local sounds = require("prototypes.entity.sounds")

local particle_animations = require("prototypes.particle-animations")


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

local small_grey_dust_smoke_trigger_effect = function()
  return
  {
    type = "create-trivial-smoke",
    smoke_name = "small-dust-particle-smoke",
    starting_frame_deviation = 0.5,
    offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
    speed_from_center = 0.01,
    speed_from_center_deviation = 0.02
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
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "guts-entrails-particle-big",
    pictures = particle_animations.get_guts_and_entrails_particle_big_pictures({}),
    shadows = particle_animations.get_guts_and_entrails_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "guts-entrails-particle-spawner",
    pictures = particle_animations.get_guts_and_entrails_particle_spawner({}),
    shadows = particle_animations.get_guts_and_entrails_particle_spawner({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "cable-and-electronics-particle-small-medium",
    pictures = particle_animations.get_cable_and_electronic_particle_small_medium_pictures({}),
    shadows = particle_animations.get_cable_and_electronic_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
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
    pictures = particle_animations.get_vegetation_particle_character_pictures ({ tint = {1, 0.976, 0.306, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-vegetation-character-particle-small-medium",
    life_time = 20,
    pictures = particle_animations.get_vegetation_particle_character_pictures ({ tint = {0.867, 0.845, 0.265, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-vegetation-vehicle-particle-small-medium",
    life_time = 30,
    pictures = particle_animations.get_vegetation_particle_character_pictures ({ tint = {0.867, 0.845, 0.265, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "vegetation-vehicle-particle-small-medium",
    life_time = 35,
    pictures = particle_animations.get_vegetation_particle_vehicle_pictures ({ tint = {1, 0.976, 0.306, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-hairy-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.722, 0.354, 0.192, 1}}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-hairy-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.369, 0.174, 0.088, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-hairy-grass-vegetation-particle-small-medium",
    render_layer_when_on_ground = "lower-object-above-shadow",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.891, 0.898, 0.282, 1}}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "green-hairy-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.283, 0.341, 0.079, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-carpet-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.891, 0.898, 0.282, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-carpet-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.283, 0.341, 0.079, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-small-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.773, 0.933, 0.216, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-small-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.283, 0.341, 0.079, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "brown-carpet-grass-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.886, 0.549, 0.400, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-carpet-grass-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.424, 0.208, 0.113, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-asterisk-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.479, 0.627, 0.221, 1}}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-asterisk-grass-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.479, 0.627, 0.221, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-asterisk-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.312, 0.408, 0.144, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "brown-asterisk-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.788, 0.736, 0.158, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-asterisk-mini-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.373, 0.231, 0.125, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-asterisk-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.443, 0.733, 0.354, 1}}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-asterisk-mini-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.373, 0.231, 0.125, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "brown-asterisk-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {1, 0.830, 0.647, 1}}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-asterisk-grass-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.788, 0.736, 0.158, 1}}),
    shadows = particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-asterisk-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.373, 0.231, 0.125, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "red-asterisk-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.588, 0.443, 0.272, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-asterisk-grass-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.718, 0.541, 0.332, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-asterisk-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.424, 0.322, 0.196, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "green-pita-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.769, 0.894, 0.589, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-croton-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.788, 0.760, 0.303, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-croton-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.396, 0.290, 0.188, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "red-croton-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.890, 0.410, 0.262, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-croton-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.286, 0.230, 0.131, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "green-pita-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.769, 0.894, 0.589, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-fluff-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.373, 0.231, 0.125, 1}}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-fluff-dry-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.373, 0.231, 0.125, 1}}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "brown-fluff-dry-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.373, 0.231, 0.125, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "red-pita-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.780, 0.390, 0.217, 1}}),
    shadows = particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-desert-bush-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.758, 0.769, 0.464, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "green-bush-mini-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.604, 0.730, 0.243, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-bush-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.655, 0.441, 0.211, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "white-desert-bush-vegetation-particle-small-medium",
    pictures = particle_animations.get_grass_particle_small_medium_pictures ({ tint = {0.651, 0.539, 0.419, 1}}),
    shadows =particle_animations.get_grass_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "garballo-mini-dry-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.631, 0.517, 0.243, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "garballo-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.392, 0.459, 0.086, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "lichen-vegetation-particle-small-medium",
    pictures = particle_animations.get_vegetation_particle_small_medium_pictures ({ tint = {0.412, 0.424, 0.188, 1}}),
    shadows =particle_animations.get_vegetation_particle_small_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (0.5,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.95,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "wooden-chest-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({tint = {1, 0.804, 0.463, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-chest-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures ({tint = {0.855, 0.687, 0.396, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures ({tint = {0.416, 0.378, 0.341, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.898, 0.659, 0.031, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.715, 0.715, 0.715, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.886, 0.090, 0.024, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.024, 0.596, 0.816, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.898, 0.659, 0.031, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.886, 0.090, 0.024, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.024, 0.596, 0.816, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-electric-pole-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({tint = {0.694, 0.486, 0.289, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-electric-pole-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {0.610, 0.427, 0.258, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "programmable-speaker-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({tint = {0.595, 0.525, 0.445, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "programmable-speaker-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {0.895, 0.786, 0.659, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rail-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {0.843, 0.701, 0.378, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "rail-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {0.815, 0.815, 0.815, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-tie-particle",
    pictures = particle_animations.get_rail_tie_particle({tint = {0.95, 0.95, 0.95, 1}}),
    shadows = particle_animations.get_rail_tie_particle({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "rock-damage-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.776, 0.612, 0.466, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rock-damage-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.776, 0.612, 0.466, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rock-damage-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.776, 0.612, 0.466, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.749, 0.749, 0.749, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object",
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.933, 0.717, 0.436, 1}}),  --({ tint = {0.443, 0.333, 0.189, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    fade_away_duration = 40,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "sand-1-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.443, 0.333, 0.189, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1
  },

  make_particle
  {
    name = "sand-1-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.443, 0.333, 0.189, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "sand-2-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.824, 0.594, 0.323, 1}}),  --({ tint = {0.427, 0.306, 0.163, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    fade_away_duration = 40,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "sand-2-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.427, 0.306, 0.163, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "sand-2-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {1, 0.730, 0.412, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0
  },

  make_particle
  {
    name = "sand-3-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.867, 0.658, 0.360, 1}}),    --({ tint = {0.427, 0.316, 0.158, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.427, 0.316, 0.158, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "sand-3-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.427, 0.316, 0.158, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-0-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.776, 0.530, 0.265, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "brown-dust-vehicle-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.616, 0.409, 0.208, 1}}), --({ tint = {0.329, 0.225, 0.112, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 30,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-0-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.616, 0.409, 0.208, 1}}), --({ tint = {0.329, 0.225, 0.112, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.329, 0.225, 0.112, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "red-desert-1-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.863, 0.589, 0.294, 1}}),   --({ tint = {0.373, 0.254, 0.127, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.373, 0.254, 0.127, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.373, 0.254, 0.127, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.878, 0.613, 0.327, 1}}),    --({ tint = {0.380, 0.260, 0.130, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.380, 0.260, 0.130, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.380, 0.260, 0.130, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.788, 0.590, 0.334, 1}}),     --({ tint = {0.392, 0.280, 0.134, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.392, 0.280, 0.134, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.392, 0.280, 0.134, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.957, 0.712, 0.394, 1}}),     --({ tint = {0.408, 0.307, 0.176, 0.502}}), --({ tint = {0.424, 0.319, 0.183, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

    make_particle
  {
    name = "dirt-1-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.424, 0.319, 0.183, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

    make_particle
  {
    name = "dirt-1-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.424, 0.319, 0.183, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

  make_particle
  {
    name = "dirt-2-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.867, 0.624, 0.364, 1}}),    --({ tint = {0.392, 0.277, 0.154, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

    make_particle
  {
    name = "dirt-2-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.392, 0.277, 0.154, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

    make_particle
  {
    name = "dirt-2-dust-tank-front-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.392, 0.277, 0.154, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

    make_particle
  {
    name = "dirt-3-dust-particle",
    life_time = 30,
    pictures = particle_animations.get_general_dust_particle ({ tint = {1, 0.706, 0.420, 1}}),  --({ tint = {0.396, 0.273, 0.152, 0.502}}),   --({ tint = {0.671, 0.462, 0.258, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    fade_away_duration = 40,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

    make_particle
  {
    name = "dirt-3-dust-vehicle-particle",
    life_time = 20,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.396, 0.273, 0.152, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false,
    movement_modifier = 0.1,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object"
  },

    make_particle
  {
    name = "dirt-3-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.396, 0.273, 0.152, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dirt-4-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.894, 0.603, 0.319, 1}}),  --({ tint = {0.329, 0.222, 0.118, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.329, 0.222, 0.118, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dirt-4-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.329, 0.222, 0.118, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dirt-5-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.812, 0.544, 0.306, 1}}),   --({ tint = {0.329, 0.221, 0.124, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.329, 0.221, 0.124, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dirt-5-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.329, 0.221, 0.124, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dirt-6-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.800, 0.536, 0.301, 1}}), --({ tint = {0.286, 0.192, 0.108, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.835, 0.560, 0.314, 1}}), --({ tint = {0.286, 0.192, 0.108, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.286, 0.192, 0.108, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dirt-7-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.749, 0.502, 0.282, 1}}),    --({ tint = {0.294, 0.197, 0.111, 0.502}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.294, 0.197, 0.111, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dirt-7-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 5,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.294, 0.197, 0.111, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dry-dirt-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.722, 0.483, 0.272, 1}}),  --({ tint = {0.337, 0.226, 0.127, 1}}),
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
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.337, 0.226, 0.127, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "dry-dirt-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.337, 0.226, 0.127, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "landfill-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.549, 0.393, 0.254, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 30
  },

  make_particle
  {
    name = "landfill-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.235, 0.168, 0.109, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "landfill-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.235, 0.168, 0.109, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "nuclear-ground-dust-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.294, 0.237, 0.186, 1}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil,
    fade_away_duration = 30
  },

  make_particle
  {
    name = "nuclear-ground-dust-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.157, 0.125, 0.097, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = nil
  },

  make_particle
  {
    name = "nuclear-ground-dust-tank-front-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 30,
    life_time_deviation = 10,
    render_layer = "lower-object",
    movement_modifier = 0.1,
    pictures = particle_animations.get_general_dust_particle ({ tint = {0.157, 0.125, 0.097, 0.502}}),
    shadows = nil,
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "tintable-water-particle",
    life_time = 180,
    pictures = particle_animations.get_water_particle_pictures ({ }),
    shadows = particle_animations.get_water_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
  },

  make_particle
  {
    name = "tintable-water-lower-particle",
    life_time = 180,
    pictures = particle_animations.get_water_particle_pictures ({ }),
    shadows = particle_animations.get_water_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
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
    pictures = particle_animations.get_water_particle_pictures ({ tint = {0.072, 0.278, 0.322, 0.314}}),
    shadows = particle_animations.get_water_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "shallow-water-2-vehicle-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "lower-object",
    pictures = particle_animations.get_water_particle_pictures ({ tint = {0.072, 0.278, 0.322, 0.314}}),
    shadows = particle_animations.get_water_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false
  },

  make_particle
  {
    name = "dirt-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.827, 0.634, 0.406, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.827, 0.634, 0.406, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

    make_particle
  {
    name = "dirt-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.827, 0.634, 0.406, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.718, 0.502, 0.286, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.718, 0.502, 0.286, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.718, 0.502, 0.286, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.766, 0.490, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.994, 0.743, 0.448, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.667, 0.463, 0.259, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.667, 0.463, 0.259, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.994, 0.743, 0.448, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.667, 0.463, 0.259, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.994, 0.743, 0.448, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.994, 0.743, 0.448, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-4-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.604, 0.420, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.604, 0.420, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-4-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.604, 0.420, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-4-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.749, 0.517, 0.311, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "landfill-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.604, 0.420, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.604, 0.420, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.749, 0.517, 0.311, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "landfill-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.604, 0.420, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "landfill-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.749, 0.517, 0.311, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "landfill-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.749, 0.517, 0.311, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.439, 0.349, 0.269, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-ground-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.439, 0.349, 0.269, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.439, 0.349, 0.269, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.439, 0.349, 0.269, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-ground-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.439, 0.349, 0.269, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "nuclear-ground-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.439, 0.349, 0.269, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-ground-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.439, 0.349, 0.269, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-character-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.600, 0.416, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.600, 0.416, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-character-particle-small",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.600, 0.416, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.600, 0.416, 0.251, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-5-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.691, 0.416, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.690, 0.439, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.475, 0.302, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.475, 0.302, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.690, 0.439, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.686, 0.475, 0.302, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-6-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.690, 0.439, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.690, 0.439, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.808, 0.545, 0.310, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.769, 0.518, 0.295, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.769, 0.518, 0.295, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.808, 0.545, 0.310, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.769, 0.518, 0.295, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dirt-7-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.808, 0.545, 0.310, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.769, 0.518, 0.295, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.660, 0.384, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.635, 0.419, 0.244, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.635, 0.419, 0.244, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.660, 0.384, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.635, 0.419, 0.244, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.660, 0.384, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.660, 0.384, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.899, 0.604, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

make_particle
  {
    name = "grass-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.899, 0.604, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.899, 0.604, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.899, 0.604, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.899, 0.604, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.899, 0.604, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.899, 0.604, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.827, 0.524, 0.198, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.663, 0.458, 0.166, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.663, 0.458, 0.166, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.827, 0.524, 0.198, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.663, 0.458, 0.166, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.827, 0.524, 0.198, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.827, 0.524, 0.198, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.863, 0.496, 0.352, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.863, 0.496, 0.352, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.863, 0.496, 0.352, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.863, 0.496, 0.352, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.863, 0.496, 0.352, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.863, 0.496, 0.352, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.863, 0.496, 0.352, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.722, 0.537, 0.340, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-4-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.722, 0.537, 0.340, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.722, 0.537, 0.340, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.722, 0.537, 0.340, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-4-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.722, 0.537, 0.340, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "grass-4-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.722, 0.537, 0.340, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

    make_particle
  {
    name = "grass-4-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.722, 0.537, 0.340, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.661, 0.329, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-0-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.661, 0.329, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.661, 0.329, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.661, 0.329, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-0-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.661, 0.329, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-0-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.661, 0.329, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-0-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.661, 0.329, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-character-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({ tint = {1, 0.725, 0.400, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-1-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-1-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-2-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-2-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-character-particle-tiny",
    life_time = 20,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-3-stone-vehicle-particle-tiny",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-vehicle-particle-small",
    life_time = 30,
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = false,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "sand-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.799, 0.538, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.873, 0.431, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.372, 0.420, 0.411, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.873, 0.431, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.873, 0.431, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.372, 0.420, 0.411, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {1, 0.873, 0.431, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.829, 0.829, 0.835, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {1, 0.873, 0.431, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.873, 0.431, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.372, 0.420, 0.411, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.400, 0.443, 0.443, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {1, 0.873, 0.431, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.372, 0.420, 0.411, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.890, 0.772, 0.632, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.890, 0.772, 0.632, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.678, 0.702, 0.669, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.678, 0.702, 0.669, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "tutorial-grid-stone-path-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.801, 0.808, 0.795, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.801, 0.808, 0.795, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.801, 0.808, 0.795, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.801, 0.808, 0.795, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.801, 0.808, 0.795, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_lower_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.482, 0.482, 0.482, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.482, 0.482, 0.482, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.482, 0.482, 0.482, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.482, 0.482, 0.482, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.231, 0.231, 0.231, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.231, 0.231, 0.231, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.231, 0.231, 0.231, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-lower-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.231, 0.231, 0.231, 1}}),
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
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "huge-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = tiny_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "green-pita-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.286, 0.230, 0.131, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "green-pita-mini-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.286, 0.230, 0.131, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-pita-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.431, 0.305, 0.228, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "brown-fluff-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.373, 0.231, 0.125, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "green-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.340, 0.345, 0.208, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.95
  },

  make_particle
  {
    name = "red-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.345, 0.208, 0.078, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "white-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.286, 0.230, 0.131, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.8
  },

  make_particle
  {
    name = "garballo-mini-dry-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.533, 0.334, 0.119, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    movement_modifier = 0.8
  },

  make_particle
  {
    name = "garballo-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({ tint = {0.427, 0.275, 0.051, 1}}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    movement_modifier = 0.8,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lichen-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.702, 0.467, 0.459, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "medium-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tiny-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-sand-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-sand-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-sand-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-sand-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({ tint = {0.686, 0.480, 0.296, 1}}),
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
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "iron-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.962, 0.899, 0.857, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "iron-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.962, 0.899, 0.857, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.616, 0.553, 0.663, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.616, 0.553, 0.663, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "flying-robot-damaged-explosion-particle",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.843, 0.843, 0.843, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.855, 0.710, 0.362, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.844, 0.844, 0.844, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-medium-yellow",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.855, 0.710, 0.362, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

 make_particle
  {
    name = "fast-underground-belt-metal-particle-medium-red",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.890, 0.275, 0.282, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

 make_particle
  {
    name = "express-underground-belt-metal-particle-medium-blue",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.310, 0.682, 0.827, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },


  make_particle
  {
    name = "fast-underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.701, 0.366, 0.366, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.625, 0.598, 0.557, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.310, 0.682, 0.827, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.676, 0.602, 0.531, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.766, 0.635, 0.541, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {1, 0.863, 0.474, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.764, 0.764, 0.764, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.827, 0.655, 0.357, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.701, 0.366, 0.366, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.729, 0.275, 0.267, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fast-splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.672, 0.672, 0.672, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.729, 0.275, 0.267, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fast-splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.832, 0.654, 0.592, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.298, 0.671, 0.804, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "express-splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.764, 0.764, 0.764, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.298, 0.671, 0.804, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "express-splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.883, 0.786, 0.735, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.635, 0.635, 0.635, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "burner-inserter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({ tint = {0.706, 0.706, 0.706, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.508, 0.423, 0.337, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.749, 0.491, 0.224, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "long-handed-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.727, 0.601, 0.545, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "long-handed-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.797, 0.324, 0.324, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fast-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.500, 0.500, 0.500, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.308, 0.447, 0.535, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "bulk-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.508, 0.508, 0.508, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "bulk-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.762, 0.937, 0.495, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "small-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.906, 0.906, 0.906, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.583, 0.424, 0.269, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-electric-pole-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.910, 0.651, 0.398, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "big-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.353, 0.498, 0.553, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-electric-pole-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.353, 0.498, 0.553, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "substation-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.797, 0.797, 0.797, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.639, 0.639, 0.639, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "substation-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.651, 0.533, 0.514, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.345, 0.420, 0.490, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.810, 0.739, 0.651, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pipe-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.648, 0.555, 0.447, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "pipe-to-ground-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.810, 0.739, 0.651, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pipe-to-ground-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.648, 0.555, 0.447, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_grey_dust_smoke_trigger_effect(),
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.720, 0.626, 0.569, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pump-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.720, 0.720, 0.720, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "pump-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.539, 0.458, 0.367, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.852, 0.852, 0.852, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect =  nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "train-stop-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.544, 0.476, 0.443, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "train-stop-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.616, 0.616, 0.616, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-red",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {0.645, 0.000, 0.000, 1}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-green",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {0.141, 0.642, 0.000, 1}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-yellow",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {0.619, 0.642, 0.000, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.787, 0.787, 0.787, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.558, 0.558, 0.558, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.566, 0.390, 0.390, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-chain-signal-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.725, 0.725, 0.725, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "locomotive-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.811, 0.811, 0.811, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.701, 0.598, 0.556, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.515, 0.515, 0.515, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "locomotive-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.631, 0.582, 0.536, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.549, 0.447, 0.322, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.549, 0.447, 0.322, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.491, 0.460, 0.419, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures  ({tint = {0.780, 0.769, 0.753, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.633, 0.534, 0.459, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.561, 0.561, 0.541, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "fluid-wagon-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.459, 0.427, 0.396, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.547, 0.547, 0.547, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.594, 0.594, 0.594, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.408, 0.408, 0.341, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-big-yellow",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.706, 0.608, 0.024, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-wagon-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "car-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.699, 0.542, 0.365, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "car-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.821, 0.821, 0.821, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "car-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.519, 0.519, 0.519, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "tank-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.695, 0.695, 0.695, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tank-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.769, 0.630, 0.619, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "tank-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.510, 0.510, 0.510, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "logistic-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.469, 0.469, 0.469, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "logistic-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.753, 0.727, 0.687, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "construction-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.847, 0.788, 0.655, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "construction-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.846, 0.788, 0.657, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "roboport-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.892, 0.807, 0.591, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "roboport-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.456, 0.622, 0.776, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "roboport-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.699, 0.699, 0.699, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.840, 0.840, 0.840, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.480, 0.539, 0.606, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.704, 0.735, 0.772, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.515, 0.531, 0.552, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.627, 0.627, 0.627, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.819, 0.652, 0.306, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.624, 0.624, 0.624, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.614, 0.510, 0.392, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.721, 0.352, 0.352, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.399, 0.294, 0.294, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "power-switch-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.429, 0.562, 0.678, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "power-switch-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.528, 0.528, 0.528, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "programmable-speaker-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.599, 0.589, 0.488, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "display-panel-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.509, 0.502, 0.406, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "boiler-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.787, 0.723, 0.556, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "boiler-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.553, 0.581, 0.428, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "boiler-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.577, 0.577, 0.577, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-engine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.871, 0.746, 0.514, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-engine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.888, 0.878, 0.788, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-engine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.798, 0.786, 0.695, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-engine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.715, 0.715, 0.715, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.747, 0.596, 0.387, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.933, 0.875, 0.635, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.503, 0.479, 0.377, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steam-turbine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.715, 0.715, 0.715, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {0.583, 0.887, 1, 1}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.709, 0.709, 0.709, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect =  nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.709, 0.709, 0.709, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "accumulator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.643, 0.698, 0.780, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "accumulator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.643, 0.698, 0.780, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "accumulator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.663, 0.663, 0.663, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "nuclear-reactor-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {0.621, 1, 0.570, 1}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.898, 0.902, 0.780, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.705, 0.705, 0.705, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.898, 0.902, 0.780, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({ tint = {1, 0.094, 0.000, 1}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({ tint = {0.902, 0.871, 0.855, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({ tint = {0.654, 0.626, 0.654, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {0.800, 0.614, 0.489, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({ tint = {0.824, 0.783, 0.839, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "spidertron-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.743, 0.663, 0.543, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.946, 1, 0.895, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.614, 0.644, 0.585, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "heat-pipe-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.702, 0.702, 0.702, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-pipe-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.788, 0.586, 0.464, 1}}),
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
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.667, 0.525, 0.403, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-mining-drill-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.558, 0.558, 0.558, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electric-mining-drill-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({ tint = {0.824, 0.783, 0.839, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-mining-drill-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({ tint = {1, 0.755, 0.369, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-mining-drill-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {0.737, 0.812, 0.812, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electric-mining-drill-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil
  },

  make_particle
  {
    name = "burner-mining-drill-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {1, 1, 1, 1}}),
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({ tint = {0.776, 0.600, 0.224, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({ tint = {0.600, 0.545, 0.518, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {0.502, 0.455, 0.435, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "offshore-pump-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.715, 0.586, 0.454, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.380, 0.576, 0.353, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "pumpjack-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.380, 0.576, 0.353, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {0.614, 0.614, 0.614, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures  ({tint = {0.706, 0.606, 0.509, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures  ({tint = {0.706, 0.606, 0.509, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({tint = {0.706, 0.606, 0.509, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({tint = {1, 0.815, 0.000, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures({tint = {0.583, 0.583, 0.583, 1}}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.365, 0.365, 0.365, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.938, 0.860, 0.680, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {0.509, 0.509, 0.509, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.396, 0.251, 0.063, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.431, 0.490, 0.463, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.447, 0.490, 0.545, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "assembling-machine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.859, 0.766, 0.680, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.350, 0.369, 0.332, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.349, 0.369, 0.333, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.992, 0.825, 0.637, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.376, 0.463, 0.580, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.376, 0.463, 0.580, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.880, 0.733, 0.569, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {0.533, 0.580, 0.384, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {0.533, 0.580, 0.384, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.388, 0.380, 0.306, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.658, 0.659, 0.586, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.651, 0.620, 0.506, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.388, 0.380, 0.306, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-big-tint",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.455, 0.349, 0.204, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.617, 0.617, 0.617, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.675, 0.522, 0.204, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.675, 0.522, 0.204, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "chemical-plant-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.715, 0.715, 0.715, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.582, 0.582, 0.582, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {0.761, 0.757, 0.671, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {0.761, 0.757, 0.671, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "centrifuge-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({ tint = {0.631, 0.514, 0.086, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.715, 0.715, 0.715, 1}}),
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
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.612, 0.612, 0.612, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.828, 0.821, 0.742, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.828, 0.821, 0.742, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.715, 0.715, 0.715, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {0.678, 0.447, 0.314, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {0.761, 0.699, 0.612, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {0.859, 0.808, 0.741, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.866, 0.601, 0.504, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.866, 0.730, 0.403, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.485, 0.485, 0.485, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "damaged-assembling-machine-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.835, 0.835, 0.835, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "damaged-assembling-machine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {0.835, 0.835, 0.835, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.866, 0.601, 0.504, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.866, 0.730, 0.403, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.485, 0.485, 0.485, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "repaired-assembling-machine-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.835, 0.835, 0.835, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "chest-capsule-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {1, 0.871, 0.424, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chest-capsule-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {1, 0.871, 0.424, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chest-capsule-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.667, 0.667, 0.667, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {1, 0.871, 0.424, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {1, 0.871, 0.424, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.485, 0.485, 0.485, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "electricity-generator-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.835, 0.835, 0.835, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.980, 0.897, 0.354, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.980, 0.897, 0.354, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.562, 0.562, 0.562, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.485, 0.485, 0.485, 1}}),
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
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.980, 0.897, 0.354, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.980, 0.897, 0.354, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.485, 0.485, 0.485, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {0.562, 0.562, 0.562, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({tint = {0.753, 0.718, 0.580, 1}}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {0.753, 0.719, 0.582, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({tint = {0.667, 0.636, 0.515, 1}}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "gate-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.806, 0.734, 0.301, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({tint = {0.667, 0.636, 0.515, 1}}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {0.735, 0.735, 0.735, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {0.496, 0.496, 0.496, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "gun-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {0.490, 0.447, 0.416, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gun-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures  ({ tint = {0.800, 0.753, 0.694, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    ender_layer = "object"
  },

  make_particle
  {
    name = "gun-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {0.541, 0.494, 0.459, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "laser-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {0.490, 0.447, 0.416, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "laser-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {0.800, 0.753, 0.694, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "laser-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {0.541, 0.494, 0.459, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {0.490, 0.447, 0.416, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {0.800, 0.753, 0.694, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {0.541, 0.494, 0.459, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.905, 0.878, 0.320, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.315, 0.315, 0.315, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.712, 0.712, 0.712, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "radar-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.806, 0.703, 0.401, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.835, 0.859, 0.682, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {0.835, 0.859, 0.682, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "radar-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {0.834, 0.860, 0.682, 1}}),
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.861, 0.670, 0.450, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.828, 0.622, 0.539, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.344, 0.344, 0.344, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "rocket-silo-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {0.715, 0.715, 0.715, 1}}),
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "defender-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.793, 0.611, 0.449, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "defender-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.772, 0.772, 0.772, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "distractor-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.793, 0.611, 0.449, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "distractor-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures  ({tint = {0.599, 0.475, 0.403, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "destroyer-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {0.793, 0.611, 0.449, 1}}),
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
    name = "metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.634, 0.537, 0.657, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "active-provider-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.564, 0.564, 0.564, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "passive-provider-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.813, 0.424, 0.424, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "passive-provider-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.631, 0.631, 0.631, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer= "object"
  },

  make_particle
  {
    name = "storage-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.924, 0.874, 0.556, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "storage-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.793, 0.793, 0.793, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "buffer-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.455, 0.649, 0.404, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "buffer-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.809, 0.809, 0.809, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "requester-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.569, 0.816, 0.973, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "requester-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.726, 0.726, 0.726, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "storage-tank-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.800, 0.709, 0.624, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "storage-tank-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {0.500, 0.458, 0.420, 1}}),
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "acid-particle",
    life_time = 180,
    pictures = particle_animations.get_water_particle_pictures({ tint = {0.1, 0.25, 0.1, 0.196}}),
    shadows = particle_animations.get_water_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "higher-object-under"
  },

  make_particle
  {
    name = "blood-particle",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({scale = 0.75}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 0.75}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "higher-object-under"
  },

  make_particle
  {
    name = "blood-particle-lower-layer",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({scale = 0.75}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 0.75}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "blood-particle-carpet",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({scale = 0.75}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 0.75}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "projectile",
    render_layer_when_on_ground = "ground-patch-higher2"
  },
  make_particle
  {
    name = "blood-particle-small",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({scale = 0.5}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 0.75}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "higher-object-under"
  },

  make_particle
  {
    name = "blood-particle-lower-layer-small",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({scale = 0.5}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 0.75}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "blood-particle-carpet-small",
    life_time = 180,
    pictures = particle_animations.get_blood_particle_pictures({scale = 0.5}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0), scale = 0.75}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "projectile",
    render_layer_when_on_ground = "ground-patch-higher2"
  },
  make_particle
  {
    name = "internal-fluids-particle",
    life_time = 100,
    pictures = particle_animations.get_water_particle_pictures({ tint = {0.311, 0.277, 0.204, 0.314}}),
    shadows = particle_animations.get_water_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
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
    flags = {"not-on-map"},
    hidden = true,
    name = "blood-fountain",
    icons =
    {
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        tint = {1,0.4,1,1}
      }
    },
    order = "d-b",
    subgroup = "particles",
    particle = "blood-particle",
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0.75,
    time_before_start_deviation = 1.5,
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
    icons =
    {
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        tint = {1,0.4,1,1}
      }
    },
    flags = {"not-on-map"},
    hidden = true,
    order = "d-c",
    subgroup = "particles",
    particle = "blood-particle",
    time_to_live = 30,
    time_to_live_deviation = 5,
    time_before_start = 2.5,
    time_before_start_deviation = 5,
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
    flags = {"not-on-map"},
    hidden = true,
    icons =
    {
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        tint = {1,0.4,1,1}
      }
    },
    order = "d-a",
    subgroup = "particles",
    particle = "blood-particle",
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
    movement_modifier = 0.9
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
    pictures = particle_animations.get_water_particle_pictures{tint = watertint()},
    shadows = particle_animations.get_water_particle_pictures{shift = util.by_pixel(1.5, -1), tint = shadowtint()},
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
      offset_deviation = {{-0.03, -0.03}, {0.03, 0.03}},
      speed_from_center = nil
    },
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "slowdown-capsule-particle",
    life_time = 180,
    pictures = particle_animations.get_water_particle_pictures ({ tint = {0.878, 0.632, 0.155, 0.694}}),
    shadows = particle_animations.get_water_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    render_layer_when_on_ground = "lower-object-above-shadow",
    draw_shadow_when_on_ground = true,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0
  },

  make_particle
  {
    name = "slowdown-capsule-particle-big",
    life_time = 180,
    pictures = particle_animations.get_slowdown_particle_pictures ({ tint = {0.878, 0.632, 0.155, 0.694}}),
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
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "selector-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {0.480, 0.606, 0.512, 1}}),
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "selector-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {0.329, 0.830, 0.566, 1}}),
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },

  make_particle
  {
    name = "selector-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {0.515, 0.531, 0.552, 1}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
    render_layer = "object"
  },
}

data:extend(particles)

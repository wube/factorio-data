local particle_animations = require("prototypes/particle/demo-particle-animations")

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
    type = "create-entity",
    entity_name = "water-splash"
  }
end

local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect();
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle =
  {

    type = "optimized-particle",
    name = name,

    life_time = params.life_time or 60 * 15,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,

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
    regular_trigger_effect = default_smoke_trigger_effect(),
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
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-chest-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures ({tint = {r = 1.000, g = 0.804, b = 0.463, a = 1.000}}), -- #ffcd75ff
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-chest-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures ({tint = {r = 0.855, g = 0.687, b = 0.396, a = 1.000}}), -- #daaf64ff
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },


  make_particle
  {
    name = "transport-belt-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures ({tint = {r = 0.416, g = 0.378, b = 0.341, a = 1.000}}), -- #6a6056ff
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.898, g = 0.659, b = 0.031, a = 1.000}}), -- #e5a80800
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}), -- #b6b6b6ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.886, g = 0.090, b = 0.024, a = 1.000}}), -- #e21706ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.024, g = 0.596, b = 0.816, a = 1.000}}), -- #0698d0ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.898, g = 0.659, b = 0.031, a = 1.000}}), -- #e5a80800
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.886, g = 0.090, b = 0.024, a = 1.000}}), -- #e21706ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-transport-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.024, g = 0.596, b = 0.816, a = 1.000}}), -- #0698d0ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-electric-pole-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({tint = {r = 0.694, g = 0.486, b = 0.289, a = 1.000}}), -- #B17C4AFF
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-electric-pole-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {r = 0.610, g = 0.427, b = 0.258, a = 1.000}}), -- #9b6c41ff
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "programmable-speaker-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({tint = {r = 0.595, g = 0.525, b = 0.445, a = 1.000}}), -- #978571ff
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "programmable-speaker-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {r = 0.895, g = 0.786, b = 0.659, a = 1.000}}), -- #e4c8a8ff
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({tint = {r = 0.843, g = 0.701, b = 0.378, a = 1.000}}), -- #d6b260ff
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {r = 0.815, g = 0.815, b = 0.815, a = 1.000}}), -- #cfcfcfff
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
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.749, g = 0.749, b = 0.749, a = 1.000}}), -- #bebebeff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

--terrains

  make_particle
  {
    name = "deep-water-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = watertint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "deep-green-water-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = watertint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "water-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = watertint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "green-water-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = watertint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "shallow-water-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = watertint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "shallow-water-2-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = watertint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "dirt-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },



  make_particle
  {
    name = "dirt-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-4-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-4-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-4-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-5-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-6-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dirt-7-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-dirt-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures(),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-4-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-4-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "grass-4-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-3-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "concrete-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-left-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "hazard-concrete-right-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-concrete-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-left-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "refined-hazard-concrete-right-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-path-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-path-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tutorial-grid-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-1-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-2-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-white-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-white-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-tile-white-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

--Environment-entities
  make_particle
  {
    name = "tree-01-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-01-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-02-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-02-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-02-red-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-02-red-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-03-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-03-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-04-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-04-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-03-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-05-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-05-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-03-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-06-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-06-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-06-brown-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-06-brown-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-07-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-07-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-08-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-08-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-08-brown-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-08-brown-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-08-brown-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-08-red-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-09-red-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tree-09-brown-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dead-dry-hairy-tree-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dead-dry-hairy-tree-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dead-grey-trunk-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dead-grey-trunk-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dead-tree-desert-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dead-tree-desert-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-hairy-tree-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-hairy-tree-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-tree-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dry-tree-wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "huge-rock-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures({}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({}),
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-rock-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures({}),
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dark-mud-decal-stone-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "dark-mud-decal-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "light-mud-decal-stone-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "light-mud-decal-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cracked-mud-stone-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cracked-mud-decal-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-decal-stone-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({}),
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "sand-decal-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },
--enviromnent-decoratives
  make_particle
  {
    name = "green-pita-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "green-pita-mini-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "green-croton-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-pita-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-croton-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "brown-fluff-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "green-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "red-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "white-desert-bush-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "garballo-mini-dry-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "garballo-wooden-splinter-particle-small",
    pictures = particle_animations.get_wooden_splinter_particle_small_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lichen-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-rock--stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-sand-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-sand-rock-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({}),
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wooden-splinter-particle-medium",
    pictures = particle_animations.get_wooden_splinter_particle_medium_pictures({}),
    shadows = particle_animations.get_wooden_splinter_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel(1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
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
    shadows = particle_animations.get_shell_particle_shadow_pictures()
  },

  make_particle
  {
    name = "iron-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.962, g = 0.899, b = 0.857, a = 1.000}}), -- #f5e5dbff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "iron-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.962, g = 0.899, b = 0.857, a = 1.000}}), -- #f5e5dbff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.616, g = 0.553, b = 0.663, a = 1.000}}), -- #9d8da9ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.616, g = 0.553, b = 0.663, a = 1.000}}), -- #9d8da9ff
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.843, g = 0.843, b = 0.843, a = 1.000}}), -- #d6d6d6ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "compilatron-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.782, g = 0.782, b = 0.782, a = 1.000}}), -- #c7c7c7ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.855, g = 0.710, b = 0.362, a = 1.000}}), -- #dab55cff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.844, g = 0.844, b = 0.844, a = 1.000}}), -- #d7d7d7ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "underground-belt-metal-particle-medium-yellow",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.855, g = 0.710, b = 0.362, a = 1.000}}), -- #dab55cff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

 make_particle
  {
    name = "fast-underground-belt-metal-particle-medium-red",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.890, g = 0.275, b = 0.282, a = 1.000}}), -- #e34648ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

 make_particle
  {
    name = "express-underground-belt-metal-particle-medium-blue",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.310, g = 0.682, b = 0.827, a = 1.000}}), -- #4faed3ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.701, g = 0.366, b = 0.366, a = 1.000}}), -- #b25d5dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.625, g = 0.598, b = 0.557, a = 1.000}}), -- #9f988dff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-underground-belt-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.310, g = 0.682, b = 0.827, a = 1.000}}), -- #4faed3ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-underground-belt-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.676, g = 0.602, b = 0.531, a = 1.000}}), -- #ac9987ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.766, g = 0.635, b = 0.541, a = 1.000}}), -- #c3a28aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 1.000, g = 0.863, b = 0.474, a = 1.000}}), -- #ffdb78ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer ="object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.764, g = 0.764, b = 0.764, a = 1.000}}), -- #c2c2c2ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.827, g = 0.655, b = 0.357, a = 1.000}}), -- #d3a75bff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.701, g = 0.366, b = 0.366, a = 1.000}}), -- #b25d5dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.729, g = 0.275, b = 0.267, a = 1.000}}), -- #ba4644ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.672, g = 0.672, b = 0.672, a = 1.000}}), -- #abababff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.729, g = 0.275, b = 0.267, a = 1.000}}), -- #ba4644ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.832, g = 0.654, b = 0.592, a = 1.000}}), -- #d4a696ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.298, g = 0.671, b = 0.804, a = 1.000}}), -- #4cabcdff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.764, g = 0.764, b = 0.764, a = 1.000}}), -- #c2c2c2ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.298, g = 0.671, b = 0.804, a = 1.000}}), -- #4cabcdff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "express-splitter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.883, g = 0.786, b = 0.735, a = 1.000}}), -- #e1c8bbff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.635, g = 0.635, b = 0.635, a = 1.000}}), -- #a1a1a1ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-inserter-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({ tint = {r = 0.706, g = 0.706, b = 0.706, a = 1.000}}), -- #b4b4b4ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.508, g = 0.423, b = 0.337, a = 1.000}}), -- #816b55ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.749, g = 0.491, b = 0.224, a = 1.000}}), -- #bf7d39ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "long-handed-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.727, g = 0.601, b = 0.545, a = 1.000}}), -- #b9998aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "long-handed-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.797, g = 0.324, b = 0.324, a = 1.000}}), -- #cb5252ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.500, g = 0.500, b = 0.500, a = 1.000}}), -- #7f7f7fff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fast-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.308, g = 0.447, b = 0.535, a = 1.000}}), -- #4e7288ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "filter-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.648, g = 0.648, b = 0.648, a = 1.000}}), -- #a5a5a5ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "filter-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.571, g = 0.419, b = 0.594, a = 1.000}}), -- #916a97ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stack-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.508, g = 0.508, b = 0.508, a = 1.000}}), -- #818181ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stack-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.762, g = 0.937, b = 0.495, a = 1.000}}), -- #c2ef7eff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stack-filter-inserter-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.590, g = 0.502, b = 0.401, a = 1.000}}), -- #967f66ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stack-filter-inserter-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.731, g = 0.731, b = 0.731, a = 1.000}}), -- #bababaff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "small-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.906, g = 0.906, b = 0.906, a = 1.000}}), -- #e7e7e7ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.583, g = 0.424, b = 0.269, a = 1.000}}), -- #946c44ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "medium-electric-pole-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.910, g = 0.651, b = 0.398, a = 1.000}}), -- #e8a665ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-electric-pole-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.353, g = 0.498, b = 0.553, a = 1.000}}), -- #5a7f8dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "big-electric-pole-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.353, g = 0.498, b = 0.553, a = 1.000}}), -- #5a7f8dff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.797, g = 0.797, b = 0.797, a = 1.000}}), -- #cbcbcbff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.639, g = 0.639, b = 0.639, a = 1.000}}), -- #a2a2a2ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.651, g = 0.533, b = 0.514, a = 1.000}}), -- #a68883ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "substation-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.345, g = 0.420, b = 0.490, a = 1.000}}), -- #586b7dff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.648, g = 0.555, b = 0.447, a = 1.000}}), -- #a58d72ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pump-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({}), -- #b79f91ff
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pump-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.720, g = 0.626, b = 0.569, a = 1.000}}), -- #b79f91ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pump-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.720, g = 0.720, b = 0.720, a = 1.000}}), -- #b7b7b7ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pump-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.539, g = 0.458, b = 0.367, a = 1.000}}), -- #89745dff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.852, g = 0.852, b = 0.852, a = 1.000}}), -- #d9d9d9ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect =  nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "train-stop-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.544, g = 0.476, b = 0.443, a = 1.000}}), -- #8a7971ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "train-stop-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.616, g = 0.616, b = 0.616, a = 1.000}}), -- #9d9d9dff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-red",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {r = 0.645, g = 0.000, b = 0.000, a = 1.000}}), -- #a40000ff
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-green",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {r = 0.141, g = 0.642, b = 0.000, a = 1.000}}), -- #24a300ff
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-glass-particle-small-yellow",
    pictures = particle_animations.get_glass_particle_small_pictures ({tint = {r = 0.619, g = 0.642, b = 0.000, a = 1.000}}), -- #9da300ff
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.787, g = 0.787, b = 0.787, a = 1.000}}), -- #c8c8c8ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-signal-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.558, g = 0.558, b = 0.558, a = 1.000}}), -- #8e8e8eff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.566, g = 0.390, b = 0.390, a = 1.000}}), -- #906363ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rail-chain-signal-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.725, g = 0.725, b = 0.725, a = 1.000}}), -- #b8b8b8ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.811, g = 0.811, b = 0.811, a = 1.000}}), -- #cececeff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.701, g = 0.598, b = 0.556, a = 1.000}}), -- #b2988dff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.515, g = 0.515, b = 0.515, a = 1.000}}), -- #838383ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "locomotive-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.631, g = 0.582, b = 0.536, a = 1.000}}), -- #a09488ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.549, g = 0.447, b = 0.322, a = 1.000}}), -- #8c7252ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.549, g = 0.447, b = 0.322, a = 1.000}}), -- #8c7252ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "cargo-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.491, g = 0.460, b = 0.419, a = 1.000}}), -- #7d756aff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures  ({tint = {r = 0.780, g = 0.769, b = 0.753, a = 1.000}}), -- #c7c4c0ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.633, g = 0.534, b = 0.459, a = 1.000}}), -- #a18875ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fluid-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.561, g = 0.561, b = 0.541, a = 1.000}}), -- #8f8f8aff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "fluid-wagon-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.459, g = 0.427, b = 0.396, a = 1.000}}), -- #756d65ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.547, g = 0.547, b = 0.547, a = 1.000}}), -- #8b8b8bff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.594, g = 0.594, b = 0.594, a = 1.000}}), -- #979797ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.408, g = 0.408, b = 0.341, a = 1.000}}), -- #686857ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-wagon-metal-particle-big-yellow",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.706, g = 0.608, b = 0.024, a = 1.000}}), -- #b49b06ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-wagon-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "car-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.699, g = 0.542, b = 0.365, a = 1.000}}), -- #b28a5dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "car-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.821, g = 0.821, b = 0.821, a = 1.000}}), -- #d1d1d1ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "car-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.519, g = 0.519, b = 0.519, a = 1.000}}), -- #848484ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tank-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.695, g = 0.695, b = 0.695, a = 1.000}}), -- #b1b1b1ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tank-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.769, g = 0.630, b = 0.619, a = 1.000}}), -- #c4a09dff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "tank-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.510, g = 0.510, b = 0.510, a = 1.000}}), -- #828282ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "logistic-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.469, g = 0.469, b = 0.469, a = 1.000}}), -- #777777ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "logistic-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.753, g = 0.727, b = 0.687, a = 1.000}}), -- #c0b9afff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "construction-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.847, g = 0.788, b = 0.655, a = 1.000}}), -- #d8c9a7ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "construction-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.846, g = 0.788, b = 0.657, a = 1.000}}), -- #d7c8a7ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "roboport-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.892, g = 0.807, b = 0.591, a = 1.000}}), -- #e3cd96ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "roboport-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.456, g = 0.622, b = 0.776, a = 1.000}}), -- #749ec5ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "roboport-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.699, g = 0.699, b = 0.699, a = 1.000}}), -- #b2b2b2ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.840, g = 0.840, b = 0.840, a = 1.000}}), -- #d6d6d6ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.480, g = 0.539, b = 0.606, a = 1.000}}), -- #7a899aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.704, g = 0.735, b = 0.772, a = 1.000}}), -- #b3bbc4ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "arithmetic-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.515, g = 0.531, b = 0.552, a = 1.000}}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.627, g = 0.627, b = 0.627, a = 1.000}}), -- #9f9f9fff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.819, g = 0.652, b = 0.306, a = 1.000}}), -- #d0a64eff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "decider-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.624, g = 0.624, b = 0.624, a = 1.000}}), -- #9f9f9fff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.614, g = 0.510, b = 0.392, a = 1.000}}), -- #9c8264ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.721, g = 0.352, b = 0.352, a = 1.000}}), -- #b75959ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "constant-combinator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.399, g = 0.294, b = 0.294, a = 1.000}}), -- #654a4aff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "power-switch-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.429, g = 0.562, b = 0.678, a = 1.000}}), -- #6d8facff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "power-switch-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.528, g = 0.528, b = 0.528, a = 1.000}}), -- #868686ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "programmable-speaker-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.599, g = 0.589, b = 0.488, a = 1.000}}), -- #98967cff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "boiler-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.787, g = 0.723, b = 0.556, a = 1.000}}), -- #c8b88dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "boiler-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.553, g = 0.581, b = 0.428, a = 1.000}}), -- #8d946dff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "boiler-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.577, g = 0.577, b = 0.577, a = 1.000}}), -- #939393ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-engine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.871, g = 0.746, b = 0.514, a = 1.000}}), -- #debe83ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-engine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.888, g = 0.878, b = 0.788, a = 1.000}}), -- #e2dfc8ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-engine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.798, g = 0.786, b = 0.695, a = 1.000}}), -- #cbc8b1ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-engine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}), -- #b6b6b6ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.747, g = 0.596, b = 0.387, a = 1.000}}), -- #be9862ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.933, g = 0.875, b = 0.635, a = 1.000}}), -- #eedfa2ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.503, g = 0.479, b = 0.377, a = 1.000}}), -- #807a60ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steam-turbine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}), -- #b6b6b6ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {r = 0.583, g = 0.887, b = 1.000, a = 1.000}}), -- #94e2ffff
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.709, g = 0.709, b = 0.709, a = 1.000}}), -- #b4b4b4ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect =  nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "solar-panel-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.709, g = 0.709, b = 0.709, a = 1.000}}), -- #b4b4b4ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "accumulator-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.643, g = 0.698, b = 0.780, a = 1.000}}), -- #a3b1c7ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "accumulator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.643, g = 0.698, b = 0.780, a = 1.000}}), -- #a3b1c7ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "accumulator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.663, g = 0.663, b = 0.663, a = 1.000}}), -- #a8a8a9ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {r = 0.621, g = 1.000, b = 0.570, a = 1.000}}), -- #9eff91ff
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.898, g = 0.902, b = 0.780, a = 1.000}}), -- #e5e6c7ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.705, g = 0.705, b = 0.705, a = 1.000}}), -- #b3b3b3ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.898, g = 0.902, b = 0.780, a = 1.000}}), -- #e4e5c6ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "nuclear-reactor-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.743, g = 0.663, b = 0.543, a = 1.000}}), -- #bda98aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.946, g = 1.000, b = 0.895, a = 1.000}}), -- #f1ffe4ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-exchanger-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.614, g = 0.644, b = 0.585, a = 1.000}}), -- #9ca495ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-pipe-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.702, g = 0.702, b = 0.702, a = 1.000}}), -- #b2b2b2ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "heat-pipe-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.788, g = 0.586, b = 0.464, a = 1.000}}), -- #c99576ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.667, g = 0.525, b = 0.403, a = 1.000}}), -- #a98566ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-mining-drill-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.558, g = 0.558, b = 0.558, a = 1.000}}), -- #8e8e8eff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-mining-drill-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.651, g = 0.533, b = 0.514, a = 1.000}}), -- #a68883ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-mining-drill-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.667, g = 0.525, b = 0.403, a = 1.000}}), -- #a98566ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-mining-drill-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.558, g = 0.558, b = 0.558, a = 1.000}}), -- #8e8e8eff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "burner-mining-drill-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-glass-particle-small",
    pictures = particle_animations.get_glass_particle_small_pictures({tint = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}}), -- #ffffffff
    shadows = particle_animations.get_glass_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.831, g = 0.831, b = 0.831, a = 1.000}}), -- #d3d3d3ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.702, g = 0.615, b = 0.547, a = 1.000}}), -- #b29c8bff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.583, g = 0.583, b = 0.583, a = 1.000}}), -- #949494ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "offshore-pump-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.715, g = 0.586, b = 0.454, a = 1.000}}), -- #b69573ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.380, g = 0.576, b = 0.353, a = 1.000}}), -- #61935aff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.380, g = 0.576, b = 0.353, a = 1.000}}), -- #61935aff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "pumpjack-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {r = 0.614, g = 0.614, b = 0.614, a = 1.000}}), -- #9c9c9cff
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures  ({tint = {r = 0.706, g = 0.606, b = 0.509, a = 1.000}}), -- #b49a81ff
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures  ({tint = {r = 0.706, g = 0.606, b = 0.509, a = 1.000}}), -- #b49a81ff
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "explosion-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures ({tint = {r = 0.706, g = 0.606, b = 0.509, a = 1.000}}), -- #b49a81ff
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({tint = {r = 1.000, g = 0.815, b = 0.000, a = 1.000}}), -- #ffcf00ff
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "stone-furnace-stone-particle-big",
    pictures = particle_animations.get_stone_particle_big_pictures({tint = {r = 0.583, g = 0.583, b = 0.583, a = 1.000}}), -- #949494ff
    shadows = particle_animations.get_stone_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.365, g = 0.365, b = 0.365, a = 1.000}}), -- #5d5d5dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.938, g = 0.860, b = 0.680, a = 1.000}}), -- #efdbadff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "steel-furnace-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {r = 0.509, g = 0.509, b = 0.509, a = 1.000}}), -- #818181ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.396, g = 0.251, b = 0.063, a = 1.000}}), -- #654010ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.431, g = 0.490, b = 0.463, a = 1.000}}), -- #6e7d76ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electric-furnace-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.447, g = 0.490, b = 0.545, a = 1.000}}), -- #727d8bff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.859, g = 0.766, b = 0.680, a = 1.000}}), -- #dbc3adff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.350, g = 0.369, b = 0.332, a = 1.000}}), -- #595e54ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-1-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.349, g = 0.369, b = 0.333, a = 1.000}}), -- #595e55ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.992, g = 0.825, b = 0.637, a = 1.000}}), -- #fcd2a2ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.376, g = 0.463, b = 0.580, a = 1.000}}), -- #607694ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-2-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.376, g = 0.463, b = 0.580, a = 1.000}}), -- #607694ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.880, g = 0.733, b = 0.569, a = 1.000}}), -- #e0bb91ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.533, g = 0.580, b = 0.384, a = 1.000}}), -- #889462ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "assembling-machine-3-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.533, g = 0.580, b = 0.384, a = 1.000}}), -- #889462ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.388, g = 0.380, b = 0.306, a = 1.000}}), -- #63614eff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.658, g = 0.659, b = 0.586, a = 1.000}}), -- #a7a895ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.651, g = 0.620, b = 0.506, a = 1.000}}), -- #a69e81ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.388, g = 0.380, b = 0.306, a = 1.000}}), -- #63614eff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "oil-refinery-metal-particle-big-tint",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.455, g = 0.349, b = 0.204, a = 1.000}}), -- #745934ff
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.617, g = 0.617, b = 0.617, a = 1.000}}), -- #9d9d9dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.675, g = 0.522, b = 0.204, a = 1.000}}), -- #ac8534ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.675, g = 0.522, b = 0.204, a = 1.000}}), -- #ac8534ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chemical-plant-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}), -- #b6b6b6ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.582, g = 0.582, b = 0.582, a = 1.000}}), -- #949494ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.761, g = 0.757, b = 0.671, a = 1.000}}), -- #c2c1abff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.761, g = 0.757, b = 0.671, a = 1.000}}), -- #c2c1abff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({ tint = {r = 0.631, g = 0.514, b = 0.086, a = 1.000}}), -- #a18316ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "centrifuge-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}), -- #b6b6b6ff
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
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.612, g = 0.612, b = 0.612, a = 1.000}}), -- #9c9c9cff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.828, g = 0.821, b = 0.742, a = 1.000}}), -- #d3d1bdff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.828, g = 0.821, b = 0.742, a = 1.000}}), -- #d3d1bdff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "lab-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}), -- #b6b6b6ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.602, g = 0.420, b = 0.291, a = 1.000}}), -- #996b4aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.602, g = 0.420, b = 0.291, a = 1.000}}), -- #996b4aff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "beacon-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.506, g = 0.457, b = 0.371, a = 1.000}}), -- #81745eff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.866, g = 0.601, b = 0.504, a = 1.000}}), -- #dc9980ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.866, g = 0.730, b = 0.403, a = 1.000}}), -- #dcba66ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}), -- #7b7b7bff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}), -- #d4d4d4ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-assembling-machine-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}), -- #d4d4d4ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.866, g = 0.601, b = 0.504, a = 1.000}}), -- #dc9980ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.866, g = 0.730, b = 0.403, a = 1.000}}), -- #dcba66ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}), -- #7b7b7bff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-assembling-machine-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}), -- #d4d4d4ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chest-capsule-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}), -- #ffde6cff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chest-capsule-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}), -- #ffde6cff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "chest-capsule-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.667, g = 0.667, b = 0.667, a = 1.000}}), -- #aaaaaaff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}), -- #ffde6cff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 1.000, g = 0.871, b = 0.424, a = 1.000}}), -- #ffde6cff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}), -- #7b7b7bff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "electricity-generator-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.835, g = 0.835, b = 0.835, a = 1.000}}), -- #d4d4d4ff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
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
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}), -- #f9e45aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}), -- #f9e45aff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.562, g = 0.562, b = 0.562, a = 1.000}}), -- #8f8f8fff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "damaged-lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}), -- #7b7b7bff
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
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}), -- #f9e45aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.980, g = 0.897, b = 0.354, a = 1.000}}), -- #f9e45aff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.485, g = 0.485, b = 0.485, a = 1.000}}), -- #7b7b7bff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "repaired-lab-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures ({tint = {r = 0.562, g = 0.562, b = 0.562, a = 1.000}}), -- #8f8f8fff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-tiny",
    pictures = particle_animations.get_stone_particle_tiny_pictures({tint = {r = 0.753, g = 0.718, b = 0.580, a = 1.000}}), -- #c0b794ff
    shadows = particle_animations.get_stone_particle_tiny_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures({tint = {r = 0.753, g = 0.719, b = 0.582, a = 1.000}}), -- #c0b794ff
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "wall-stone-particle-medium",
    pictures = particle_animations.get_stone_particle_medium_pictures({tint = {r = 0.667, g = 0.636, b = 0.515, a = 1.000}}), -- #aaa283ff
    shadows = particle_animations.get_stone_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.806, g = 0.734, b = 0.301, a = 1.000}}), -- #cdbb4cff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-stone-particle-small",
    pictures = particle_animations.get_stone_particle_small_pictures ({tint = {r = 0.667, g = 0.636, b = 0.515, a = 1.000}}), -- #aaa283ff
    shadows = particle_animations.get_stone_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({tint = {r = 0.735, g = 0.735, b = 0.735, a = 1.000}}), -- #bbbbbbff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gate-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({tint = {r = 0.496, g = 0.496, b = 0.496, a = 1.000}}), -- #7e7e7eff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gun-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {r = 0.490, g = 0.447, b = 0.416, a = 1.000}}), -- #7c716aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gun-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures  ({ tint = {r = 0.800, g = 0.753, b = 0.694, a = 1.000}}), -- #ccc0b1ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "gun-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.541, g = 0.494, b = 0.459, a = 1.000}}), -- #8a7e75ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "laser-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {r = 0.490, g = 0.447, b = 0.416, a = 1.000}}), -- #7c716aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "laser-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.800, g = 0.753, b = 0.694, a = 1.000}}), -- #ccc0b1ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "laser-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.541, g = 0.494, b = 0.459, a = 1.000}}), -- #8a7e75ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({ tint = {r = 0.490, g = 0.447, b = 0.416, a = 1.000}}), -- #7c716aff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures ({ tint = {r = 0.800, g = 0.753, b = 0.694, a = 1.000}}), -- #ccc0b1ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "flame-thrower-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures ({ tint = {r = 0.541, g = 0.494, b = 0.459, a = 1.000}}), -- #8a7e75ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.905, g = 0.878, b = 0.320, a = 1.000}}), -- #e6df51ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.315, g = 0.315, b = 0.315, a = 1.000}}), -- #505050ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "artillery-turret-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.712, g = 0.712, b = 0.712, a = 1.000}}), -- #b5b5b5ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.806, g = 0.703, b = 0.401, a = 1.000}}), -- #cdb366ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.835, g = 0.859, b = 0.682, a = 1.000}}), -- #d5dbaeff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {r = 0.835, g = 0.859, b = 0.682, a = 1.000}}), -- #d5dbaeff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "radar-long-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_long_pictures({tint = {r = 0.834, g = 0.860, b = 0.682, a = 1.000}}), -- #d4dbadff
    shadows = particle_animations.get_metal_particle_medium_long_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.861, g = 0.670, b = 0.450, a = 1.000}}), -- #dbaa72ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.828, g = 0.622, b = 0.539, a = 1.000}}), -- #d39e89ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rocket-silo-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({tint = {r = 0.344, g = 0.344, b = 0.344, a = 1.000}}), -- #575757ff
    shadows = particle_animations.get_metal_particle_big_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = default_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "rocket-silo-mechanical-component-particle-medium",
    pictures = particle_animations.get_mechanical_component_particle_medium_pictures ({tint = {r = 0.715, g = 0.715, b = 0.715, a = 1.000}}), -- #b6b6b6ff
    shadows = particle_animations.get_mechanical_component_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "defender-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.793, g = 0.611, b = 0.449, a = 1.000}}), -- #ca9b72ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "defender-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.772, g = 0.772, b = 0.772, a = 1.000}}), -- #c4c4c4ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },


  make_particle
  {
    name = "distractor-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.793, g = 0.611, b = 0.449, a = 1.000}}), -- #ca9b72ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "distractor-robot-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures  ({tint = {r = 0.599, g = 0.475, b = 0.403, a = 1.000}}), -- #987966ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "destroyer-robot-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures ({tint = {r = 0.793, g = 0.611, b = 0.449, a = 1.000}}), -- #ca9b72ff
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.552, g = 0.452, b = 0.371, a = 1.000}}), -- #8c735eff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "compilatron-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.944, g = 0.936, b = 0.895, a = 1.000}}), -- #f0eee4ff
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
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.634, g = 0.537, b = 0.657, a = 1.000}}), -- #a188a7ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "active-provider-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.564, g = 0.564, b = 0.564, a = 1.000}}), -- #8f8f8fff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect (),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "passive-provider-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.813, g = 0.424, b = 0.424, a = 1.000}}), -- #cf6c6cff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "passive-provider-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.631, g = 0.631, b = 0.631, a = 1.000}}), -- #a0a0a0ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer= "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "storage-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.924, g = 0.874, b = 0.556, a = 1.000}}), -- #ebde8dff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "storage-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.793, g = 0.793, b = 0.793, a = 1.000}}), -- #cacacaff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "buffer-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.455, g = 0.649, b = 0.404, a = 1.000}}), -- #73a566ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "buffer-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.809, g = 0.809, b = 0.809, a = 1.000}}), -- #cececeff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "requester-chest-metal-particle-small",
    pictures = particle_animations.get_metal_particle_small_pictures({tint = {r = 0.569, g = 0.816, b = 0.973, a = 1.000}}), -- #91d0f8ff
    shadows = particle_animations.get_metal_particle_small_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "requester-chest-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.726, g = 0.726, b = 0.726, a = 1.000}}), -- #b9b9b9ff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },

  make_particle
  {
    name = "storage-tank-metal-particle-medium",
    pictures = particle_animations.get_metal_particle_medium_pictures({tint = {r = 0.800, g = 0.709, b = 0.624, a = 1.000}}), -- #ccb49fff
    shadows = particle_animations.get_metal_particle_medium_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    regular_trigger_effect = small_smoke_trigger_effect(),
    render_layer = "object",
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect()
  },
  make_particle
  {
    name = "storage-tank-metal-particle-big",
    pictures = particle_animations.get_metal_particle_big_pictures({ tint = {r = 0.500, g = 0.458, b = 0.420, a = 1.000}}), -- #7f746bff
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
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = bloodtint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "blood-particle-lower-layer",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = bloodtint()}),
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
    render_layer = "lower-object-above-shadow",
  },

  make_particle
  {
    name = "storage-tank-fluid-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 180,
    render_layer = "higher-object-under",
    pictures = particle_animations.get_blood_particle_pictures({tint = {r = 0.715, g = 0.515, b = 0.232, a = 1.000}}), -- #b6833bff
    shadows = particle_animations.get_blood_particle_pictures({ tint = shadowtint(), shift = util.by_pixel (1,0)}),
  },

  make_particle
  {
    name = "spark-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    render_layer = "air-object",
    pictures = particle_animations.get_sparks_particle_pictures()
  },

  make_particle
  {
    name = "pole-spark-particle",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    render_layer = "air-object",
    pictures = particle_animations.get_pole_sparks_particle_pictures()
  },

  make_particle
  {
    name = "spark-particle-debris",
    movement_modifier_when_on_ground = 0,
    life_time = 20,
    render_layer = "air-object",
    pictures = particle_animations.get_sparks_debris_pictures()
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

  {
    type = "particle-source",
    name = "train-spark-fountain",
    subgroup = "particles",
    particle = "spark-particle",
    icon = "__core__/graphics/icons/mip/trash.png",
    icon_size = 32,
    time_to_live = 5,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 0.1,
    height_deviation = 0.1,
    vertical_speed = 0.02,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.07,
    horizontal_speed_deviation = 0.04
  },

  {
    type = "particle-source",
    name = "blood-fountain-death-spawner",
    subgroup = "particles",
    particle = "blood-particle",
    icon = "__core__/graphics/icons/mip/trash.png",
    icon_size = 32,
    time_to_live = 65,
    time_to_live_deviation = 5,
    time_before_start = 5,
    time_before_start_deviation = 0,
    height = 0.3,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.09,
    horizontal_speed_deviation = 0.04,
  },

  {
    type = "particle-source",
    name = "blood-fountain-death-behemoth-worm",
    subgroup = "particles",
    particle = "blood-particle",
    icon = "__core__/graphics/icons/mip/trash.png",
    icon_size = 32,
    time_to_live = 15,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 3.2,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.05,
    horizontal_speed_deviation = 0.04,
  },

  {
    type = "particle-source",
    name = "blood-fountain-death-big-worm",
    subgroup = "particles",
    particle = "blood-particle",
    icon = "__core__/graphics/icons/mip/trash.png",
    icon_size = 32,
    time_to_live = 25,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 3.05,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.05,
    horizontal_speed_deviation = 0.04,
  },

  {
    type = "particle-source",
    name = "blood-fountain-death-medium-worm",
    subgroup = "particles",
    particle = "blood-particle",
    icon = "__core__/graphics/icons/mip/trash.png",
    icon_size = 32,
    time_to_live = 25,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 2.25,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.05,
    horizontal_speed_deviation = 0.04,
  },

  {
    type = "particle-source",
    name = "blood-fountain-death-small-worm",
    subgroup = "particles",
    particle = "blood-particle",
    icon = "__core__/graphics/icons/mip/trash.png",
    icon_size = 32,
    time_to_live = 25,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 2.1,
    height_deviation = 0.1,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.05,
    horizontal_speed_deviation = 0.04,
  },

  make_particle
  {
    name = "leaf-particle",
    life_time = 180,
    movement_modifier = 0.9,
    pictures = particle_animations.get_leaf_particle_pictures(),
    shadows = particle_animations.get_leaf_particle_shadow_pictures()
  },

  make_particle
  {
    name = "branch-particle",
    life_time = 1200,
    pictures = particle_animations.get_branch_particle_pictures(),
    shadows = particle_animations.get_branch_particle_shadow_pictures()
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
  }
}

data:extend(particles)

local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local sounds = require("__base__.prototypes.entity.sounds")

local function elevated_rail_long_metal_particle_red(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "elevated-rail-long-metal-particle-red",
    offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
    initial_height = height,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.02,
    initial_vertical_speed_deviation = 0.03,
    speed_from_center = 0.03,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0.463
  }
end

local function elevated_rail_long_metal_particle(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "elevated-rail-long-metal-particle",
    offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
    initial_height = height,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.02,
    initial_vertical_speed_deviation = 0.03,
    speed_from_center = 0.03,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0.463
  }
end

local function elevated_rail_tie_particle(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "elevated-rail-tie-particle",
    offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
    initial_height = height,
    initial_height_deviation = 0.15,
    initial_vertical_speed = 0.05,
    initial_vertical_speed_deviation = 0.03,
    speed_from_center = 0.03,
    speed_from_center_deviation = 0.05,
    frame_speed = 0.5,
    frame_speed_deviation = 0.463
  }
end

local function elevated_rail_wooden_splinter_particle(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "elevated-rail-wooden-splinter-particle",
    offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
    initial_height = height,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.06,
    initial_vertical_speed_deviation = 0.05,
    speed_from_center = 0.04,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0.463
  }
end

local function rail_support_metal_particle_big(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "rail-support-metal-particle-big",
    offset_deviation = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    initial_height = height,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.07,
    initial_vertical_speed_deviation = 0.05,
    speed_from_center = 0.05,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0.463
  }
end

local function explosion_stone_particle_medium(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "explosion-stone-particle-medium",
    initial_height = height,
    speed_from_center = 0.1,
    speed_from_center_deviation = 0.05,
    initial_vertical_speed = 0.02,
    initial_vertical_speed_deviation = 0.15,
    offset_deviation = { { -1.8, -1.8 }, { 1.8, 1.8 } }
  }
end

local function rail_stone_particle_small(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "rail-stone-particle-small",
    offset_deviation = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    initial_height = height,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.065,
    initial_vertical_speed_deviation = 0.05,
    speed_from_center = 0.04,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0.463
  }
end

local function rail_support_concrete_particle(count, height)
  return
  {
    type = "create-particle",
    repeat_count = count,
    particle_name = "rail-support-concrete-particle",
    offset_deviation = { { -1.8, -1.8 }, { 1.8, 1.8 } },
    initial_height = height,
    initial_height_deviation = 0.1,
    initial_vertical_speed = 0.01,
    initial_vertical_speed_deviation = 0.02,
    speed_from_center = 0.05,
    speed_from_center_deviation = 0.05
  }
end




local explosions =
{
  {
    type = "explosion",
    name = "elevated-rail-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.elevated-straight-rail"}},
    hidden = true,
    icon = "__elevated-rails__/graphics/icons/elevated-rail.png",
    subgroup = "train-transport-explosions",
    order = "e-a-a",
    height = 0,
    animations =  util.empty_sprite(),--explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          elevated_rail_long_metal_particle_red(8, 3.5),
          elevated_rail_long_metal_particle(5, 3.3),
          elevated_rail_tie_particle(7, 3.3),
          elevated_rail_wooden_splinter_particle(16, 3.3)
        }
      }
    }
  },
  {
    type = "explosion",
    name = "rail-support-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.rail-support"}},
    hidden = true,
    icon = "__elevated-rails__/graphics/icons/rail-support.png",
    subgroup = "train-transport-explosions",
    order = "e-a-c",
    height = 0,
    animations =  explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          elevated_rail_long_metal_particle_red(12, 2.7),
          elevated_rail_long_metal_particle(3, 3.3),
          elevated_rail_long_metal_particle_red(12, 1.2),
          rail_support_metal_particle_big(25, 0.7),
          explosion_stone_particle_medium(40, 0.5),
          rail_stone_particle_small(100, 0.2),
          rail_support_concrete_particle(15,0.3)
        }
      }
    }
  },
  {
    type = "explosion",
    name = "rail-ramp-explosion-higher",
    localised_name = {"dying-explosion-name", {"entity-name.rail-ramp"}},
    hidden = true,
    icon = "__elevated-rails__/graphics/icons/rail-ramp.png",
    subgroup = "train-transport-explosions",
    order = "e-a-b",
    height = 0,
    animations =  explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          elevated_rail_tie_particle(14, 2.8),
          elevated_rail_long_metal_particle_red(12, 2.7),
          elevated_rail_long_metal_particle(3, 3.3),
          elevated_rail_long_metal_particle_red(12, 1.2),
          rail_support_metal_particle_big(25, 0.7),
          explosion_stone_particle_medium(40, 0.5),
          rail_stone_particle_small(100, 0.2),
          rail_support_concrete_particle(18,0.5)
        }
      }
    }
  },
  {
    type = "explosion",
    name = "rail-ramp-explosion-middle",
    localised_name = {"dying-explosion-name", {"entity-name.rail-ramp"}},
    hidden = true,
    icon = "__elevated-rails__/graphics/icons/rail-ramp.png",
    subgroup = "train-transport-explosions",
    order = "e-a-b",
    height = 0,
    animations =  explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          elevated_rail_tie_particle(7, 2),
          elevated_rail_long_metal_particle_red(12, 1.8),
          elevated_rail_long_metal_particle(3, 1.8),
          elevated_rail_long_metal_particle_red(12, 1.0),
          rail_support_metal_particle_big(5, 0.7),
          explosion_stone_particle_medium(40, 0.5),
          rail_stone_particle_small(100, 0.2),
          rail_support_concrete_particle(10, 0.3)
        }
      }
    }
  },
  {
    type = "explosion",
    name = "rail-ramp-explosion-lower",
    localised_name = {"dying-explosion-name", {"entity-name.rail-ramp"}},
    hidden = true,
    icon = "__elevated-rails__/graphics/icons/rail-ramp.png",
    subgroup = "train-transport-explosions",
    order = "e-a-b",
    height = 0,
    animations =  util.empty_sprite(),--explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          elevated_rail_tie_particle(4, 0.2),
          elevated_rail_long_metal_particle(3, 0.2),
          rail_stone_particle_small(100, 0.2),
          elevated_rail_wooden_splinter_particle(25, 0.2),
          elevated_rail_long_metal_particle_red(12, 0.6),
          rail_support_metal_particle_big(2, 0.7),
          rail_support_concrete_particle(2, 0.2)
        }
      }
    }
  }
}
data:extend(explosions)
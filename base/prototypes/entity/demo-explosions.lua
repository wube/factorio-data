local explosion_animations = require("prototypes.entity.demo-explosion-animations")
local sounds = require("prototypes.entity.demo-sounds")
local biter_die_effects = require("prototypes.entity.demo-biter-die-effects")

local default_light = function(size)
  return
  {
    intensity = 1,
    size = size,
    color = {r = 1.0, g = 1.0, b = 1.0}
  }
end

local empty_explosion = function(params)
  return
  {
    type = "explosion",
    name = params.name,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect = params.created_effect
  }
end

data:extend
{
  {
    type = "explosion",
    name = "explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.explosion(),
    light = {intensity = 1, size = 20, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5)
  },

  {
    type = "explosion",
    name = "explosion-gunshot",
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.gunshot(),
    rotate = true,
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "explosion-gunshot-small",
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.small_gunshot(),
    rotate = true,
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "explosion-hit",
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.hit_explosion(),
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "big-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.big_explosion(),
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound = sounds.large_explosion(1.0),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "medium-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.medium_explosion(),
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "explosion-stone-particle-medium",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "explosion-stone-particle-small",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "explosion-stone-particle-tiny",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "grenade-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(50),
    sound = sounds.medium_explosion(0.4),
  },

  {
    type = "explosion",
    name = "massive-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.massive_explosion(),
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound = sounds.large_explosion(1.0),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "explosion-stone-particle-medium",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "explosion-stone-particle-small",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "explosion-stone-particle-tiny",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "ground-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.medium_explosion(),
    light = {intensity = 1, size = 10, color = {r=1.0, g=0.8, b=0.6}},
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "big-rock-stone-particle-medium",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "big-rock-stone-particle-small",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "big-rock-stone-particle-tiny",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  empty_explosion
  {
    name = "blood-explosion-small",
    icon = "__base__/graphics/icons/small-biter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          entity_name = "blood-fountain",
          repeat_count = 20,
          offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
        }
      }
    }
  },

  empty_explosion
  {
    name = "blood-explosion-big",
    icon = "__base__/graphics/icons/big-biter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 150,
            particle_name = "blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "blood-fountain",
            repeat_count = 35,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          }
        }
      }
    }
  },

  empty_explosion{
    name = "blood-explosion-huge",
    flags = {"not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 150,
            particle_name = "blood-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.05,
            initial_vertical_speed = -0.01,
            initial_vertical_speed_deviation = 0.02,
            offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}}
          },
          {
            type = "create-entity",
            entity_name = "blood-fountain-big",
            repeat_count = 35,
            offset_deviation = {{-1.6, -1.6}, {1.6, 1.6}}
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "water-splash",
    icon = "__base__/graphics/icons/fluid/water.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-particle",
          repeat_count = 10,
          repeat_count_deviation = 6,
          particle_name = "deep-water-particle",
          offsets =
          {
            { 0, 0 },
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "stone-furnace-explosion",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "smelting-machine-explosions",
    order = "c-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "stone-furnace-stone-particle-big",
            offset_deviation = { { -0.6914, -0.6875 }, { 0.6914, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "stone-furnace-stone-particle-medium",
            offset_deviation = { { -0.5859, -0.8984 }, { 0.5859, 0.8984 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            particle_name = "stone-furnace-stone-particle-small",
            offset_deviation = { { -0.8984, -0.8945 }, { 0.8984, 0.8945 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "wooden-chest-explosion",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "storage-explosions",
    height = 0,
    animations = util.empty_sprite(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    order = "a-a-a",
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "wooden-chest-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "wooden-chest-wooden-splinter-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "iron-chest-explosion",
    icon = "__base__/graphics/icons/iron-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "storage-explosions",
    order = "a-b-a",
    height = 0,
    animations = util.empty_sprite(),--explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "iron-chest-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "iron-chest-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "transport-belt-explosion",
    icon = "__base__/graphics/icons/transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-a-a",
    height = 0,
    animations = util.empty_sprite (),--explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "transport-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "transport-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "transport-belt-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.016,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "transport-belt-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.32,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "underground-belt-explosion",
    icon = "__base__/graphics/icons/underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "underground-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.081,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "underground-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.43,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.048,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "underground-belt-metal-particle-medium-yellow",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.042,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "splitter-explosion",
    icon = "__base__/graphics/icons/splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-g-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "splitter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.047,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "splitter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.049,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "splitter-long-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.5977 }, { 0.6953, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "splitter-metal-particle-big",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "splitter-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.029,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "burner-inserter-explosion",
    icon = "__base__/graphics/icons/burner-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "inserter-explosions",
    order = "c-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "burner-inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "burner-inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "burner-inserter-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "inserter-explosion",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "inserter-explosions",
    order = "c-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "long-handed-inserter-explosion",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "inserter-explosions",
    order = "c-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "long-handed-inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "long-handed-inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "fast-inserter-explosion",
    icon = "__base__/graphics/icons/fast-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "inserter-explosions",
    order = "c-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "fast-inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "fast-inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "small-electric-pole-explosion",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 22,
            particle_name = "small-electric-pole-wooden-splinter-particle-medium",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "small-electric-pole-wooden-splinter-particle-small",
            offset_deviation = { { -0.5977, -0.7891 }, { 0.5977, 0.7891 } },
            initial_height = 0.8,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.054,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "small-electric-pole-metal-particle-small",
            offset_deviation = { { -0.8906, -0.1914 }, { 0.8906, 0.1914 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.031,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "medium-electric-pole-explosion",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "medium-electric-pole-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.6953 }, { 0.5, 0.6953 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "medium-electric-pole-metal-particle-small",
            offset_deviation = { { -0.5977, -0.7891 }, { 0.5977, 0.7891 } },
            initial_height = 0.8,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 11,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.028,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.047
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "big-electric-pole-explosion",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "big-electric-pole-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.6953 }, { 0.5, 0.6953 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.043
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "big-electric-pole-metal-particle-small",
            offset_deviation = { { -0.5977, -0.7891 }, { 0.5977, 0.7891 } },
            initial_height = 0.4,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.053,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "pipe-explosion",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "pipe-metal-particle-medium",
            offset_deviation = { { -0.3945, -0.3867 }, { 0.3945, 0.3867 } },
            initial_height = 0.2,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "pipe-metal-particle-small",
            offset_deviation = { { -0.3984, -0.2969 }, { 0.3984, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.48,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "pipe-glass-particle-small",
            offset_deviation = { { -0.5, -0.6992 }, { 0.5, 0.6992 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "pipe-to-ground-explosion",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-g-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 14,
            particle_name = "pipe-to-ground-metal-particle-medium",
            offset_deviation = { { -0.3945, -0.3867 }, { 0.3945, 0.3867 } },
            initial_height = 0.2,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "pipe-to-ground-metal-particle-small",
            offset_deviation = { { -0.3984, -0.2969 }, { 0.3984, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.48,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "car-explosion",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-i-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "car-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "car-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.095,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "car-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.089,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "construction-robot-explosion",
    icon = "__base__/graphics/icons/construction-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-b-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "construction-robot-metal-particle-medium",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "construction-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "lamp-explosion",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "g-a-a",
    height = 0,
    animations = util.empty_sprite(),--explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "lamp-metal-particle-small",
            offset_deviation = { { -0.5, -0.3945 }, { 0.5, 0.3945 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 45,
            particle_name = "lamp-glass-particle-small",
            offset_deviation = { { -0.5, -0.6992 }, { 0.5, 0.6992 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.045,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "boiler-explosion",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-a-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "boiler-metal-particle-medium",
            offset_deviation = { { -0.8867, -0.3867 }, { 0.8867, 0.3867 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "boiler-metal-particle-small",
            offset_deviation = { { -0.3906, -0.5977 }, { 0.3906, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "boiler-metal-particle-big",
            offset_deviation = { { -0.582, -0.5859 }, { 0.582, 0.5859 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "steam-engine-explosion",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "steam-engine-metal-particle-big",
            offset_deviation = { { -0.5, -0.6953 }, { 0.5, 0.6953 } },
            initial_height = 0.5,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.063,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "steam-engine-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.5 }, { 0.6953, 0.5 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 45,
            particle_name = "steam-engine-metal-particle-small",
            offset_deviation = { { -0.8945, -0.7969 }, { 0.8945, 0.7969 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.089,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "steam-engine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.037,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "burner-mining-drill-explosion",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "extraction-machine-explosions",
    order = "b-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "burner-mining-drill-metal-particle-big",
            offset_deviation = { { -0.09375, -0.1875 }, { 0.09375, 0.1875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "burner-mining-drill-metal-particle-medium",
            offset_deviation = { { -0.1875, -0.1953 }, { 0.1875, 0.1953 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "burner-mining-drill-glass-particle-small",
            offset_deviation = { { -0.8945, -0.8906 }, { 0.8945, 0.8906 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 23,
            particle_name = "burner-mining-drill-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.057,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "electric-mining-drill-explosion",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "extraction-machine-explosions",
    order = "b-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "burner-mining-drill-metal-particle-big",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.09375, -0.1875 }, { 0.09375, 0.1875 } },
            tile_collision_mask = nil,
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0
          },
          {
            type = "create-particle",
            repeat_count = 20,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "burner-mining-drill-metal-particle-medium",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.1875, -0.1914 }, { 0.1875, 0.1914 } },
            tile_collision_mask = nil,
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0
          },
          {
            type = "create-particle",
            repeat_count = 10,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "electric-mining-drill-long-metal-particle-medium",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.8906, -0.8867 }, { 0.8906, 0.8867 } },
            tile_collision_mask = nil,
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0
          },
          {
            type = "create-particle",
            repeat_count = 23,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "burner-mining-drill-mechanical-component-particle-medium",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            tile_collision_mask = nil,
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.057,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0
          },
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            tile_collision_mask = nil,
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.085,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.019,
            frame_speed = 1,
            frame_speed_deviation = 0
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "offshore-pump-explosion",
    icon = "__base__/graphics/icons/offshore-pump.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "extraction-machine-explosions",
    order = "b-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "offshore-pump-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.074,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 14,
            particle_name = "offshore-pump-metal-particle-medium",
            offset_deviation = { { -0.582, -0.8945 }, { 0.582, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "offshore-pump-metal-particle-small",
            offset_deviation = { { -0.8945, -0.8906 }, { 0.8945, 0.8906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.066,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 23,
            particle_name = "offshore-pump-glass-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 14,
            particle_name = "offshore-pump-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.061,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "steel-furnace-explosion",
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "smelting-machine-explosions",
    order = "c-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "steel-furnace-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "steel-furnace-metal-particle-medium",
            offset_deviation = { { -0.582, -0.8945 }, { 0.582, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "steel-furnace-metal-particle-small",
            offset_deviation = { { -0.8945, -0.8906 }, { 0.8945, 0.8906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "electric-furnace-explosion",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "smelting-machine-explosions",
    order = "c-c-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 14,
            particle_name = "electric-furnace-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.3,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.02
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "electric-furnace-metal-particle-medium",
            offset_deviation = { { -0.582, -0.5938 }, { 0.582, 0.5938 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "electric-furnace-metal-particle-small",
            offsets = { { 0.2891, 0.01563 }, { -0.2109, -0.01563 } },
            offset_deviation = { { -0.8945, -0.8906 }, { 0.8945, 0.8906 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.083,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "assembling-machine-1-explosion",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "production-machine-explosions",
    order = "d-a-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "assembling-machine-1-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "assembling-machine-1-metal-particle-medium",
            offset_deviation = { { -0.8789, -0.8945 }, { 0.8789, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "assembling-machine-1-metal-particle-small",
            offset_deviation = { { -0.8945, -0.3906 }, { 0.8945, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "assembling-machine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "assembling-machine-2-explosion",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "production-machine-explosions",
    order = "d-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "assembling-machine-2-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "assembling-machine-2-metal-particle-medium",
            offset_deviation = { { -0.8789, -0.8945 }, { 0.8789, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "assembling-machine-2-metal-particle-small",
            offset_deviation = { { -0.8945, -0.3906 }, { 0.8945, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "assembling-machine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "lab-explosion",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "production-machine-explosions",
    order = "d-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "lab-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "lab-metal-particle-medium",
            offset_deviation = { { -0.9805, -0.8945 }, { 0.9805, 0.8945 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 49,
            particle_name = "lab-glass-particle-small",
            offset_deviation = { { -0.5938, -0.5859 }, { 0.5938, 0.5859 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.021
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "lab-long-metal-particle-medium",
            offsets = { { 0.7109, 0.7578 } },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.096,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 28,
            particle_name = "lab-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.074,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "wall-explosion",
    icon = "__base__/graphics/icons/wall.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-a-a",
    height = 0,
    animations = util.empty_sprite(),--explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "wall-stone-particle-medium",
            offset_deviation = { { -0.1953, -0.1953 }, { 0.1953, 0.1953 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.048
          },
          {
            type = "create-particle",
            repeat_count = 28,
            particle_name = "wall-stone-particle-small",
            offset_deviation = { { -0.1953, -0.1992 }, { 0.1953, 0.1992 } },
            initial_height = 0.9,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.077,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 46,
            particle_name = "wall-stone-particle-tiny",
            offset_deviation = { { -0.3906, -0.4883 }, { 0.3906, 0.4883 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.076,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "gate-explosion",
    icon = "__base__/graphics/icons/gate.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "gate-metal-particle-big",
            offset_deviation = { { -0.1953, -0.1953 }, { 0.1953, 0.1953 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.056,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.048
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "gate-metal-particle-medium",
            offset_deviation = { { -0.4883, -0.5977 }, { 0.4883, 0.5977 } },
            initial_height = 0.9,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.077,
            initial_vertical_speed_deviation = 0.056,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "gate-metal-particle-small",
            offset_deviation = { { -0.3906, -0.4883 }, { 0.3906, 0.4883 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.076,
            initial_vertical_speed_deviation = 0.055,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 39,
            particle_name = "gate-stone-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.093,
            initial_vertical_speed_deviation = 0.052,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "damaged-assembling-machine-explosion",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-1-broken.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "campaign-explosions",
    order = "f-a-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 12,
            probability = 1,
            particle_name = "damaged-assembling-machine-metal-particle-big",
            offset_deviation = { { -0.4961, -0.5977 }, { 0.4961, 0.5977 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            probability = 1,
            particle_name = "damaged-assembling-machine-metal-particle-medium",
            offset_deviation = { { -0.4961, -0.7969 }, { 0.4961, 0.7969 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.102,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            probability = 1,
            particle_name = "damaged-assembling-machine-metal-particle-small",
            offset_deviation = { { -0.8945, -0.8945 }, { 0.8945, 0.8945 } },
            initial_height = 0.9,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.081,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.022
          },
          {
            type = "create-particle",
            repeat_count = 30,
            probability = 1,
            particle_name = "damaged-assembling-machine-glass-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.056
          },
          {
            type = "create-particle",
            repeat_count = 13,
            probability = 1,
            particle_name = "damaged-assembling-machine-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.22,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.04,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.016
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "repaired-assembling-machine-explosion",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-1-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "campaign-explosions",
    order = "f-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 12,
            probability = 1,
            particle_name = "repaired-assembling-machine-metal-particle-big",
            offset_deviation = { { -0.4961, -0.5977 }, { 0.4961, 0.5977 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            probability = 1,
            particle_name = "repaired-assembling-machine-metal-particle-medium",
            offset_deviation = { { -0.4961, -0.7969 }, { 0.4961, 0.7969 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.102,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            probability = 1,
            particle_name = "repaired-assembling-machine-metal-particle-small",
            offset_deviation = { { -0.8945, -0.8945 }, { 0.8945, 0.8945 } },
            initial_height = 0.9,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.081,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.022
          },
          {
            type = "create-particle",
            repeat_count = 30,
            probability = 1,
            particle_name = "repaired-assembling-machine-glass-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.056
          },
          {
            type = "create-particle",
            repeat_count = 13,
            probability = 1,
            particle_name = "damaged-assembling-machine-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.22,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.04,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.016
          },
          {
            type = "create-particle",
            repeat_count = 15,
            probability = 1,
            particle_name = "damaged-assembling-machine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.22,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.04,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.016
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "chest-capsule-explosion",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "campaign-explosions",
    order = "f-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 14,
            particle_name = "chest-capsule-metal-particle-medium",
            offset_deviation = { { -0.4961, -0.4961 }, { 0.4961, 0.4961 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.086,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "chest-capsule-metal-particle-small",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "chest-capsule-long-metal-particle-medium",
            offset_deviation = { { -0.4961, -0.5977 }, { 0.4961, 0.5977 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.048
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "electricity-generator-explosion",
    icon = "__base__/graphics/icons/crash-site-generator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "campaign-explosions",
    order = "f-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "electricity-generator-metal-particle-big",
            offset_deviation = { { -0.4961, -0.5977 }, { 0.4961, 0.5977 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "electricity-generator-metal-particle-medium",
            offset_deviation = { { -0.4961, -0.7969 }, { 0.4961, 0.7969 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.102,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "electricity-generator-metal-particle-small",
            offset_deviation = { { -0.8984, -0.8984 }, { 0.8984, 0.8984 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "electricity-generator-glass-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "electricity-generator-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "damaged-lab-explosion",
    icon = "__base__/graphics/icons/crash-site-lab-broken.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "campaign-explosions",
    order = "f-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "damaged-lab-metal-particle-big",
            offsets = {{ 0, 0 },{ 0.7031, -0.3984 }},
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 24,
            particle_name = "damaged-lab-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "damaged-lab-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 49,
            particle_name = "damaged-lab-glass-particle-small",
            offsets = {{ 1.563, 0.007813 }},
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 19,
            particle_name = "damaged-lab-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.39,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "repaired-lab-explosion",
    icon = "__base__/graphics/icons/crash-site-lab-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "campaign-explosions",
    order = "f-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "repaired-lab-metal-particle-big",
            offsets = {{ 0, 0 },{ 0.7031, -0.3984 }},
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 24,
            particle_name = "repaired-lab-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "repaired-lab-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 49,
            particle_name = "repaired-lab-glass-particle-small",
            offsets = {{ 1.563, 0.007813 }},
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 19,
            particle_name = "repaired-lab-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.39,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "gun-turret-explosion",
    icon = "__base__/graphics/icons/gun-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-c-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "gun-turret-metal-particle-big",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "gun-turret-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.055,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "gun-turret-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },


  {
    type = "explosion",
    name = "radar-explosion",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "radar-metal-particle-big",
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 22,
            particle_name = "radar-metal-particle-medium",
            offset_deviation = { { -0.5938, -0.5 }, { 0.5938, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "radar-metal-particle-small",
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "radar-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.095,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  empty_explosion
  {
    name = "small-biter-die",
    created_effect = biter_die_effects.small_biter
  },

  empty_explosion
  {
    name = "small-worm-die",
    created_effect = biter_die_effects.small_worm
  },

  empty_explosion
  {
    name = "biter-spawner-die",
    created_effect = biter_die_effects.spawner_biter
  }
}

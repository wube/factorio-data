local explosion_animations = require("prototypes.entity.explosion-animations")
local smoke_animations = require("prototypes.entity.smoke-animations")
local sounds = require("prototypes.entity.sounds")
local biter_die_effects = require("prototypes.entity.biter-die-effects")
local enemy_constants = require("prototypes.entity.enemy-constants")

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
    localised_name = params.localised_name,
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect = params.created_effect
  }
end

local explosions =
{
  {
    type = "explosion",
    name = "explosion",
    localised_name = {"entity-name.explosion"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/cannon-shell.png"}
    },
    order = "a-c-a",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion
  },

  {
    type = "explosion",
    name = "explosion-gunshot",
    localised_name = {"entity-name.explosion-gunshot"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/pistol.png"}
    },
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.gunshot(),
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "explosion-gunshot-small",
    localised_name = {"entity-name.explosion-gunshot-small"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/pistol.png"}
    },
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.small_gunshot(),
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "explosion-hit",
    localised_name = {"entity-name.explosion-hit"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/pistol.png"}
    },
    order = "a-a-a",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.hit_explosion(),
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "big-explosion",
    localised_name = {"entity-name.big-explosion"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/explosive-cannon-shell.png"}
    },
    order = "a-c-b",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.big_explosion(),
    sound = sounds.large_explosion(1.0)
  },

  {
    type = "explosion",
    name = "medium-explosion",
    localised_name = {"entity-name.medium-explosion"},
    icon = "__base__/graphics/icons/explosion.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.medium_explosion(),
    sound = sounds.medium_explosion,
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
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } }
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "grenade-explosion",
    localised_name = {"entity-name.grenade-explosion"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/grenade.png"}
    },
    order = "a-a-b",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    sound = sounds.medium_explosion
  },

  {
    type = "explosion",
    name = "massive-explosion",
    localised_name = {"entity-name.massive-explosion"},
    icon = "__base__/graphics/icons/explosion.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.massive_explosion(),
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
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } }
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "ground-explosion",
    localised_name = {"entity-name.ground-explosion"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/cliff-explosives.png"}
    },
    order = "a-a-c",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = explosion_animations.medium_explosion(),
    sound = sounds.medium_explosion,
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
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } }
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "blood-explosion-small",
    localised_name = {"entity-name.blood-explosion-small"},
    icons =
    {
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        tint = {1,0.4,1,1}
      }
    },
    order = "c-a",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "fluid-explosions",
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

  {
    type = "explosion",
    name = "blood-explosion-big",
    localised_name = {"entity-name.blood-explosion-big"},
    icons =
    {
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        tint = {1,0.4,1,1}
      }
    },
    order = "c-b",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "fluid-explosions",
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

  {
    type = "explosion",
    name = "blood-explosion-huge",
    localised_name = {"entity-name.blood-explosion-huge"},
    flags = {"not-on-map"},
    hidden = true,
    icons =
    {
      {
        icon = "__base__/graphics/icons/fluid/water.png",
        tint = {1,0.4,1,1}
      }
    },
    order = "c-c",
    subgroup = "fluid-explosions",
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
    localised_name = {"entity-name.water-splash"},
    icon = "__base__/graphics/icons/fluid/water.png",
    order = "a-a-a",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "fluid-explosions",
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
          particle_name = "tintable-water-particle",
          tint = {0.226, 0.341, 0.337, 0.314},
          offsets =
          {
            { 0, 0 }
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
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "smelting-machine-explosions",
    order = "c-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "wooden-chest-explosion",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "storage-explosions",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "storage-explosions",
    order = "a-b-a",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-a-a",
    height = 0,
    animations = util.empty_sprite (),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "underground-belt-explosion",
    icon = "__base__/graphics/icons/underground-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "splitter-explosion",
    icon = "__base__/graphics/icons/splitter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-g-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "burner-inserter-explosion",
    icon = "__base__/graphics/icons/burner-inserter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "inserter-explosion",
    icon = "__base__/graphics/icons/inserter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "long-handed-inserter-explosion",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "fast-inserter-explosion",
    icon = "__base__/graphics/icons/fast-inserter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "small-electric-pole-explosion",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "medium-electric-pole-explosion",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "big-electric-pole-explosion",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "pipe-explosion",
    icon = "__base__/graphics/icons/pipe.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "pipe-to-ground-explosion",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-g-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "car-explosion",
    icon = "__base__/graphics/icons/car.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "transport-explosions",
    order = "e-i-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.car_explosion,
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
          },
          {
            type = "play-sound",
            sound = sounds.car_debris
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "construction-robot-explosion",
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-b-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "lamp-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.small-lamp"}},
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "circuit-network-explosions",
    order = "g-a-a",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "boiler-explosion",
    icon = "__base__/graphics/icons/boiler.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-a-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "steam-engine-explosion",
    icon = "__base__/graphics/icons/steam-engine.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "burner-mining-drill-explosion",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "extraction-machine-explosions",
    order = "b-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "electric-mining-drill-explosion",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "extraction-machine-explosions",
    order = "b-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 10,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "electric-mining-drill-metal-particle-big",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.09375, -0.1875 },
              right_bottom = { 0.09375, 0.1875 }
            },
            initial_height = 1.7,
            initial_height_deviation = 0.31,
            initial_vertical_speed = 0.086,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.001,
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
            particle_name = "electric-mining-drill-metal-particle-medium",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.1875, -0.1875 },
              right_bottom = { 0.1875, 0.1875 }
            },
            initial_height = 1.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.106,
            initial_vertical_speed_deviation = 0.051,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.007,
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
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.8867, -0.8828 },
              right_bottom = { 0.8867, 0.8828 }
            },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.156,
            initial_vertical_speed_deviation = 0.046,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.012,
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
            particle_name = "electric-mining-drill-mechanical-component-particle-medium",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 2.2,
            initial_height_deviation = 0.48,
            initial_vertical_speed = 0.074,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0,
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
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0,
            initial_vertical_speed = 0.085,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.019,
            frame_speed = 1,
            frame_speed_deviation = 0
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "offshore-pump-explosion",
    icon = "__base__/graphics/icons/offshore-pump.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "extraction-machine-explosions",
    order = "b-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "steel-furnace-explosion",
    icon = "__base__/graphics/icons/steel-furnace.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "smelting-machine-explosions",
    order = "c-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "electric-furnace-explosion",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "smelting-machine-explosions",
    order = "c-c-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "assembling-machine-1-explosion",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-a-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "assembling-machine-2-explosion",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "lab-explosion",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "wall-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.stone-wall"}},
    icon = "__base__/graphics/icons/wall.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-a-a",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "gate-explosion",
    icon = "__base__/graphics/icons/gate.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "gun-turret-explosion",
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-c-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "radar-explosion",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "fast-transport-belt-explosion",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "fast-transport-belt-metal-particle-medium",
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
            particle_name = "fast-transport-belt-metal-particle-small",
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
            particle_name = "fast-transport-belt-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.32,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "steel-chest-explosion",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "storage-explosions",
    order = "a-c-a",
    height = 0,
    animations = util.empty_sprite(), --explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "steel-chest-metal-particle-medium",
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
            particle_name = "steel-chest-metal-particle-small",
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
    name = "fast-underground-belt-explosion",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "fast-underground-belt-metal-particle-medium",
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
            particle_name = "fast-underground-belt-metal-particle-small",
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
            particle_name = "fast-underground-belt-metal-particle-medium-red",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.042,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "fast-splitter-explosion",
    icon = "__base__/graphics/icons/fast-splitter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-h-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "fast-splitter-metal-particle-medium",
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
            particle_name = "fast-splitter-metal-particle-small",
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
            particle_name = "fast-splitter-long-metal-particle-medium",
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
            particle_name = "fast-splitter-metal-particle-big",
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
            particle_name = "fast-splitter-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.029,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "rail-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.straight-rail"}},
    icon = "__base__/graphics/icons/rail.png",
    flags = {"not-on-map"},
    hidden = true,
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
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "rail-long-metal-particle-medium",
            offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
            initial_height = 0.2,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.051,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "rail-tie-particle",
            offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
            initial_height = 0.2,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.051,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 0.5,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 100,
            particle_name = "rail-stone-particle-small",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.065,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "rail-wooden-splinter-particle-medium",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.1,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "train-stop-explosion",
    icon = "__base__/graphics/icons/train-stop.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "train-transport-explosions",
    order = "e-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 27,
            particle_name = "train-stop-metal-particle-medium",
            offset_deviation = { { -0.6875, -0.1914 }, { 0.6875, 0.1914 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "train-stop-long-metal-particle-medium",
            offset_deviation = { { -0.4883, -0.3945 }, { 0.4883, 0.3945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "train-stop-metal-particle-small",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.063,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "train-stop-metal-particle-small",
            offset_deviation = { { -0.5859, -0.6875 }, { 0.5859, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.053,
            initial_vertical_speed_deviation = 0.054,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "train-stop-glass-particle-small",
            offset_deviation = { { -0.4883, -0.6875 }, { 0.4883, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.113,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "rail-signal-explosion",
    icon = "__base__/graphics/icons/rail-signal.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "train-transport-explosions",
    order = "e-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "rail-signal-metal-particle-medium",
            offset_deviation = { { -0.2852, -0.2891 }, { 0.2852, 0.2891 } },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "rail-signal-metal-particle-small",
            offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
            initial_height = 0.1,
            initial_height_deviation = 0.31,
            initial_vertical_speed = 0.103,
            initial_vertical_speed_deviation = 0.054,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "rail-signal-glass-particle-small-red",
            offset_deviation = { { -0.2852, -0.293 }, { 0.2852, 0.293 } },
            initial_height = 0.1,
            initial_height_deviation = 0.09,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "rail-signal-glass-particle-small-green",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.09,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "rail-signal-glass-particle-small-yellow",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.07,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "rail-chain-signal-explosion",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "train-transport-explosions",
    order = "e-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "rail-chain-signal-metal-particle-medium",
            offset_deviation = { { -0.2852, -0.2891 }, { 0.2852, 0.2891 } },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "rail-chain-signal-metal-particle-small",
            offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
            initial_height = 0.1,
            initial_height_deviation = 0.31,
            initial_vertical_speed = 0.103,
            initial_vertical_speed_deviation = 0.054,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 36,
            particle_name = "rail-chain-signal-glass-particle-small",
            offset_deviation = { { -0.2852, -0.293 }, { 0.2852, 0.293 } },
            initial_height = 0.1,
            initial_height_deviation = 0.07,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "locomotive-explosion",
    icon = "__base__/graphics/icons/locomotive.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "train-transport-explosions",
    order = "e-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
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
            repeat_count = 39,
            particle_name = "locomotive-metal-particle-big",
            offset_deviation = { { -0.5938, -0.7969 }, { 0.5938, 0.7969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "locomotive-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.089
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "locomotive-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "locomotive-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
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
    name = "cargo-wagon-explosion",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "train-transport-explosions",
    order = "e-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
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
            repeat_count = 36,
            particle_name = "cargo-wagon-metal-particle-big",
            offset_deviation = { { -0.3984, -0.3984 }, { 0.3984, 0.3984 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "cargo-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            particle_name = "cargo-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.114,
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
    name = "arithmetic-combinator-explosion",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "circuit-network-explosions",
    order = "g-b-a",
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "arithmetic-combinator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.2969 }, { 0.3945, 0.2969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "arithmetic-combinator-metal-particle-medium",
            offset_deviation = { { -0.5, -0.3906 }, { 0.5, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.039,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "arithmetic-combinator-metal-particle-small",
            offset_deviation = { { -0.5977, -0.8906 }, { 0.5977, 0.8906 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "decider-combinator-explosion",
    icon = "__base__/graphics/icons/decider-combinator.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "circuit-network-explosions",
    order = "g-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "decider-combinator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.2969 }, { 0.3945, 0.2969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "decider-combinator-metal-particle-medium",
            offset_deviation = { { -0.5, -0.3906 }, { 0.5, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.039,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "decider-combinator-metal-particle-small",
            offset_deviation = { { -0.5977, -0.8906 }, { 0.5977, 0.8906 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "constant-combinator-explosion",
    icon = "__base__/graphics/icons/constant-combinator.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "circuit-network-explosions",
    order = "g-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "constant-combinator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.2969 }, { 0.3945, 0.2969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "constant-combinator-metal-particle-medium",
            offset_deviation = { { -0.5, -0.3906 }, { 0.5, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.039,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "constant-combinator-metal-particle-small",
            offset_deviation = { { -0.5977, -0.8906 }, { 0.5977, 0.8906 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "power-switch-explosion",
    icon = "__base__/graphics/icons/power-switch.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "circuit-network-explosions",
    order = "g-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "power-switch-metal-particle-medium",
            offset_deviation = { { -0.5938, -0.6953 }, { 0.5938, 0.6953 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "power-switch-metal-particle-small",
            offsets = {{ 0.2422, 0 },{ -0.2422, -0.01563 }},
            offset_deviation = { { -0.5977, -0.3945 }, { 0.5977, 0.3945 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.067,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets = {{ -0.2578, -0.007813 },{ 0.3984, 0.007813 }},
            offset_deviation = { { -0.3984, -0.1992 }, { 0.3984, 0.1992 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "solar-panel-explosion",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-c-a",
    height = 0,
    animations =  util.empty_sprite(),--explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 28,
            particle_name = "solar-panel-long-metal-particle-medium",
            offset_deviation = { { -0.6992, -0.5 }, { 0.6992, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 32,
            particle_name = "solar-panel-metal-particle-small",
            offset_deviation = { { -0.8984, -0.7969 }, { 0.8984, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 82,
            particle_name = "solar-panel-glass-particle-small",
            offset_deviation = { { -0.3984, -0.4961 }, { 0.3984, 0.4961 } },
            initial_height = 0.4,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "programmable-speaker-explosion",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "circuit-network-explosions",
    order = "g-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "programmable-speaker-metal-particle-small",
            offset_deviation = { { -0.3945, -0.1953 }, { 0.3945, 0.1953 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.052,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.3867 }, { 0.5977, 0.3867 } },
            initial_height = 0.8,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.067,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "programmable-speaker-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5977, -0.3906 }, { 0.5977, 0.3906 } },
            initial_height = 0.9,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.048,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "programmable-speaker-wooden-splinter-particle-small",
            offset_deviation = { { -0.5938, -0.6914 }, { 0.5938, 0.6914 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "laser-turret-explosion",
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "laser-turret-metal-particle-big",
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
            particle_name = "laser-turret-metal-particle-medium",
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
            particle_name = "laser-turret-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "accumulator-explosion",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-c-b",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            repeat_count = 27,
            particle_name = "accumulator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.4961 }, { 0.3945, 0.4961 } },
            initial_height = 0.4,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 24,
            particle_name = "accumulator-metal-particle-medium",
            offset_deviation = { { -0.7969, -0.5 }, { 0.7969, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "accumulator-metal-particle-small",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.034,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "defender-robot-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.defender"}},
    icon = "__base__/graphics/icons/defender.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "capsule-explosions",
    order = "c-a-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.robot_explosion,
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
            particle_name = "defender-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
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
            particle_name = "defender-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "laser-bubble",
    localised_name = {"entity-name.laser-bubble"},
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    icon = "__base__/graphics/icons/laser-turret.png",
    order = "a-a-a",
    animations = explosion_animations.laser_bubble(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "big-artillery-explosion",
    localised_name = {"entity-name.big-artillery-explosion"},
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/artillery-shell.png"}
    },
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    order = "a-b-a",
    animations = explosion_animations.bigass_explosion(),
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
            speed_from_center = 0.1,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } }
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "artillery-cannon-muzzle-flash",
    localised_name = {"entity-name.artillery-cannon-muzzle-flash"},
    icon = "__base__/graphics/icons/artillery-shell.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    order = "a-b-b",
    animations = explosion_animations.artillery_muzzle_flash(),
    rotate = true,
    height = 0,
    correct_rotation = true,
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "active-provider-chest-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.active-provider-chest"}},
    icon = "__base__/graphics/icons/active-provider-chest.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-c-a",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "active-provider-chest-metal-particle-medium",
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
            particle_name = "active-provider-chest-metal-particle-small",
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
    name = "passive-provider-chest-explosion",
    icon = "__base__/graphics/icons/passive-provider-chest.png",
    localised_name = {"dying-explosion-name", {"entity-name.passive-provider-chest"}},
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-d-a",
    height = 0,
    animations = util.empty_sprite (),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "passive-provider-chest-metal-particle-medium",
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
            particle_name = "passive-provider-chest-metal-particle-small",
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
    name = "storage-chest-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.storage-chest"}},
    icon = "__base__/graphics/icons/storage-chest.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-e-a",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "storage-chest-metal-particle-medium",
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
            particle_name = "storage-chest-metal-particle-small",
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
    name = "buffer-chest-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.buffer-chest"}},
    icon = "__base__/graphics/icons/buffer-chest.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-e-a",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "buffer-chest-metal-particle-medium",
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
            particle_name = "buffer-chest-metal-particle-small",
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
    name = "requester-chest-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.requester-chest"}},
    icon = "__base__/graphics/icons/requester-chest.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-f-a",
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "requester-chest-metal-particle-medium",
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
            particle_name = "requester-chest-metal-particle-small",
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
    name = "express-transport-belt-explosion",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "express-transport-belt-metal-particle-medium",
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
            particle_name = "express-transport-belt-metal-particle-small",
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
            particle_name = "express-transport-belt-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.32,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "express-underground-belt-explosion",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "express-underground-belt-metal-particle-medium",
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
            particle_name = "express-underground-belt-metal-particle-small",
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
            particle_name = "express-underground-belt-metal-particle-medium-blue",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.042,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "express-splitter-explosion",
    icon = "__base__/graphics/icons/express-splitter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "belt-explosions",
    order = "b-i-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "express-splitter-metal-particle-medium",
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
            particle_name = "express-splitter-metal-particle-small",
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
            particle_name = "express-splitter-long-metal-particle-medium",
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
            repeat_count = 2,
            particle_name = "express-splitter-metal-particle-big",
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
            particle_name = "express-splitter-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.029,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "bulk-inserter-explosion",
    icon = "__base__/graphics/icons/bulk-inserter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "inserter-explosions",
    order = "c-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "bulk-inserter-metal-particle-medium",
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
            particle_name = "bulk-inserter-metal-particle-small",
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
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "substation-explosion",
    icon = "__base__/graphics/icons/substation.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "substation-metal-particle-big",
            offset_deviation = { { -0.5, -0.6953 }, { 0.5, 0.6953 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "substation-metal-particle-big",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
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
            repeat_count = 12,
            particle_name = "substation-long-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "substation-long-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.7891 }, { 0.5977, 0.7891 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.047,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.7891 }, { 0.5977, 0.7891 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.011,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "pump-explosion",
    icon = "__base__/graphics/icons/pump.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-h-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "pump-metal-particle-big",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "pump-metal-particle-medium",
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
            repeat_count = 12,
            particle_name = "pump-metal-particle-small",
            offset_deviation = { { -0.6953, -0.6953 }, { 0.6953, 0.6953 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.136,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "pump-glass-particle-small",
            offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.113,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "fluid-wagon-explosion",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "train-transport-explosions",
    order = "e-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
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
            repeat_count = 31,
            particle_name = "fluid-wagon-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "fluid-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.47,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "fluid-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 19,
            particle_name = "fluid-wagon-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.087,
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
    name = "artillery-wagon-explosion",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "train-transport-explosions",
    order = "e-h-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
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
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.114,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big-yellow",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "artillery-wagon-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "tank-explosion",
    icon = "__base__/graphics/icons/tank.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "transport-explosions",
    order = "e-j-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.tank_explosion,
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
            particle_name = "tank-metal-particle-big",
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
            particle_name = "tank-metal-particle-medium",
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
            particle_name = "tank-metal-particle-small",
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
          },
          {
            type = "play-sound",
            sound = sounds.tank_debris
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "logistic-robot-explosion",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-a-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "logistic-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 1.2,
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
            particle_name = "logistic-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "roboport-explosion",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "logistic-network-explosions",
    order = "f-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "roboport-metal-particle-big",
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.045,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "roboport-metal-particle-medium",
            offset_deviation = { { -0.5, -0.7969 }, { 0.5, 0.7969 } },
            initial_height = 0.7,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 33,
            particle_name = "roboport-metal-particle-small",
            offset_deviation = { { -0.5977, -0.2969 }, { 0.5977, 0.2969 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.03,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.027,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "steam-turbine-explosion",
    icon = "__base__/graphics/icons/steam-turbine.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
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
            particle_name = "steam-turbine-metal-particle-big",
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
            particle_name = "steam-turbine-metal-particle-medium",
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
            particle_name = "steam-turbine-metal-particle-small",
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
            particle_name = "steam-turbine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.037,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "nuclear-reactor-explosion",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-d-a",
    height = 0,
    animations = explosion_animations.massive_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.7, 1.0),
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
            repeat_count = 39,
            particle_name = "nuclear-reactor-metal-particle-big",
            offset_deviation = { { -0.6914, -0.793 }, { 0.6914, 0.793 } },
            initial_height = 1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.083,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "nuclear-reactor-metal-particle-medium",
            offsets = { { -0.2891, 0.2344 } },
            offset_deviation = { { -0.6914, -0.5 }, { 0.6914, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.096,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 48,
            particle_name = "nuclear-reactor-glass-particle-small",
            offsets = { { -0.6641, 0.6406 } },
            offset_deviation = { { -0.8945, -0.7969 }, { 0.8945, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 41,
            particle_name = "nuclear-reactor-metal-particle-small",
            offset_deviation = { { -0.8945, -0.7969 }, { 0.8945, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.089,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets = { { 0.5234, -0.4609 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.093,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "nuclear-reactor-mechanical-component-particle-medium",
            offsets = { { -0.6641, 0.6406 } },
            offset_deviation = { { -0.8906, -0.7969 }, { 0.8906, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "spidertron-explosion",
    icon = "__base__/graphics/icons/spidertron.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "transport-explosions",
    order = "e-k-a",
    height = 0,
    animations = explosion_animations.massive_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.spidertron_explosion,
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
            repeat_count = 39,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spidertron-metal-particle-big",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.6875, -0.793 },
              right_bottom = { 0.6875, 0.793 }
            },
            initial_height = 1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.083,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 31,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spidertron-metal-particle-medium",
            offsets = {
              { -0.2891, 0.2344 }
            },
            offset_deviation = {
              left_top = { -0.6875, -0.5 },
              right_bottom = { 0.6875, 0.5 }
            },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.096,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 48,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spidertron-glass-particle-small",
            offsets = {
              { -0.6641, 0.6406 }
            },
            offset_deviation = {
              left_top = { -0.8906, -0.7969 },
              right_bottom = { 0.8906, 0.7969 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 41,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spidertron-metal-particle-small",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.8906, -0.7969 },
              right_bottom = { 0.8906, 0.7969 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.089,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 15,
            repeat_count_deviation = 5,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spidertron-long-metal-particle-medium",
            offsets = {
              { -0.2891, 0.2344 }
            },
            offset_deviation = {
              left_top = { -0.6875, -0.5 },
              right_bottom = { 0.6875, 0.5 }
            },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.131,
            initial_vertical_speed_deviation = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.026,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 25,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets = {
              { 0.5234, -0.4609 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.093,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 12,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "spidertron-mechanical-component-particle-medium",
            offsets = {
              { -0.6641, 0.6406 }
            },
            offset_deviation = {
              left_top = { -0.8867, -0.7969 },
              right_bottom = { 0.8867, 0.7969 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "play-sound",
            sound = sounds.spidertron_debris
          },
          {
            type = "play-sound",
            sound = sounds.spidertron_die_vox
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "nuke-explosion",
    flags = {"not-on-map"},
    hidden = true,
    icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/atomic-bomb.png"}
    },
    order = "a-d-a",
    subgroup = "explosions",
    height = 0,
    animations = explosion_animations.nuke_explosion(),
    sound = sounds.large_explosion(1.0),
    --[[
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
            repeat_count = 60,
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
    --]]
  },

  {
    type = "explosion",
    name = "heat-exchanger-explosion",
    icon = "__base__/graphics/icons/heat-boiler.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "heat-exchanger-metal-particle-medium",
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
            particle_name = "heat-exchanger-metal-particle-small",
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
            particle_name = "heat-exchanger-metal-particle-big",
            offset_deviation = { { -0.582, -0.5859 }, { 0.582, 0.5859 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "heat-pipe-explosion",
    icon = "__base__/graphics/icons/heat-pipe.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "heat-pipe-metal-particle-small",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.3906, -0.2969 }, { 0.3906, 0.2969 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.028,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "heat-pipe-metal-particle-medium",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.09375, -0.1875 }, { 0.09375, 0.1875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.046,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.016
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "pumpjack-explosion",
    icon = "__base__/graphics/icons/pumpjack.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "extraction-machine-explosions",
    order = "b-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "pumpjack-metal-particle-big",
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
            repeat_count = 38,
            particle_name = "pumpjack-metal-particle-medium",
            offset_deviation = { { -0.582, -0.8945 }, { 0.582, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            particle_name = "pumpjack-metal-particle-small",
            offset_deviation = { { -0.8945, -0.8906 }, { 0.8945, 0.8906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 29,
            particle_name = "pumpjack-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
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
    name = "assembling-machine-3-explosion",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-c-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "assembling-machine-3-metal-particle-big",
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
            particle_name = "assembling-machine-3-metal-particle-medium",
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
            particle_name = "assembling-machine-3-metal-particle-small",
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
        }
      }
    }
  },

  {
    type = "explosion",
    name = "oil-refinery-explosion",
    icon = "__base__/graphics/icons/oil-refinery.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-d-a",
    height = 0,
    animations = explosion_animations.massive_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.7, 1.0),
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
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offsets =
            {
              { 0.7734, -0.6484 },
              { -0.7266, 0.5859 }
            },
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.8,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.9805, -0.8867 }, { 0.9805, 0.8867 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-small",
            offsets =
            {
              { -1.492, -1.453 },
              { 1.555, -1.469 },
              { 1.477, 1.469 },
              { -0.6172, 0.3281 }
            },
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            probability = 1,
            particle_name = "oil-refinery-long-metal-particle-medium",
            offsets =
            {
              { -0.02344, -0.8984 }
            },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.7,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.166,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 9,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big-tint",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "chemical-plant-explosion",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "chemical-plant-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "chemical-plant-metal-particle-medium",
            offset_deviation = { { -0.9805, -0.8945 }, { 0.9805, 0.8945 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "chemical-plant-metal-particle-small",
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 43,
            particle_name = "chemical-plant-glass-particle-small",
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
            repeat_count = 40,
            particle_name = "chemical-plant-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.085,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "centrifuge-explosion",
    icon = "__base__/graphics/icons/centrifuge.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "centrifuge-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            particle_name = "centrifuge-metal-particle-medium",
            offset_deviation = { { -0.9805, -0.8945 }, { 0.9805, 0.8945 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.095,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.053
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "centrifuge-metal-particle-small",
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "centrifuge-long-metal-particle-medium",
            offsets = { { 0.2734, 0.1484 } },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "centrifuge-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.085,
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
    name = "beacon-explosion",
    icon = "__base__/graphics/icons/beacon.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "module-explosions",
    order = "e-a-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "beacon-metal-particle-big",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.4961, -0.5938 },
              right_bottom = { 0.4961, 0.5938 }
            },
            initial_height = 0.45,
            initial_height_deviation = 0.46,
            initial_vertical_speed = 0.106,
            initial_vertical_speed_deviation = 0.036,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.007,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 15,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "beacon-metal-particle-medium",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.4961, -0.5 },
              right_bottom = { 0.4961, 0.5 }
            },
            initial_height = 0.4,
            initial_height_deviation = 0,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.038,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.006,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 29,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "beacon-metal-particle-small",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.5938, -0.5938 },
              right_bottom = { 0.5938, 0.5938 }
            },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.063,
            initial_vertical_speed_deviation = 0.035,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 15,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.031,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 12,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "concrete-stone-particle-small",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.5, -0.5 },
              right_bottom = { 0.5, 0.5 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.034,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.012,
            frame_speed = 1,
            frame_speed_deviation = 0,
            rotate_offsets = false
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "land-mine-explosion",
    icon = "__base__/graphics/icons/land-mine.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "gun-explosions",
    order = "a-a-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion
  },

  {
    type = "explosion",
    name = "flamethrower-turret-explosion",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "flame-thrower-turret-metal-particle-big",
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
            particle_name = "flame-thrower-turret-metal-particle-medium",
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
            particle_name = "flame-thrower-turret-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "artillery-turret-explosion",
    icon = "__base__/graphics/icons/artillery-turret.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
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
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.114,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big-yellow",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "artillery-wagon-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "rocket-silo-explosion",
    icon = "__base__/graphics/icons/rocket-silo.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "defensive-structure-explosions",
    order = "b-h-a",
    height = 0,
    animations = explosion_animations.massive_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8, 1.0),
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
            repeat_count = 35,
            probability = 1,
            particle_name = "rocket-silo-metal-particle-big",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.14,
            initial_vertical_speed = 0.194,
            initial_vertical_speed_deviation = 0.012,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.025
          },
          {
            type = "create-particle",
            repeat_count = 52,
            probability = 1,
            particle_name = "rocket-silo-metal-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.2969, -0.5 }, { 0.2969, 0.5 } },
            initial_height = 0.8,
            initial_height_deviation = 0.48,
            initial_vertical_speed = 0.135,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.09,
            speed_from_center_deviation = 0
          },
          {
            type = "create-particle",
            repeat_count = 50,
            probability = 1,
            particle_name = "rocket-silo-metal-particle-small",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 2.5,
            initial_height_deviation = 0.63,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.09,
            speed_from_center_deviation = 0.044
          },
          {
            type = "create-particle",
            repeat_count = 34,
            probability = 1,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets =
            {
              { -1.461, 3.977 },
              { 1.305, -3.758 },
              { 3.195, 1.492 },
              { -3.367, -1.43 }
            },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.102,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 36,
            probability = 1,
            particle_name = "artillery-wagon-mechanical-component-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.131,
            initial_vertical_speed_deviation = 0.041,
            speed_from_center = 0.09,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "distractor-robot-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.distractor"}},
    icon = "__base__/graphics/icons/distractor.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "capsule-explosions",
    order = "c-b-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.robot_explosion,
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
            particle_name = "distractor-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
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
            particle_name = "distractor-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "destroyer-robot-explosion",
    localised_name = {"dying-explosion-name", {"entity-name.destroyer"}},
    icon = "__base__/graphics/icons/destroyer.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "capsule-explosions",
    order = "c-c-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.robot_explosion,
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
            particle_name = "destroyer-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
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
            particle_name = "destroyer-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },

  {
    type = "explosion",
    name = "storage-tank-explosion",
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "storage-explosions",
    order = "a-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    sound = sounds.large_explosion(0.5, 0.7),
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
            particle_name = "storage-tank-metal-particle-big",
            offset_deviation = { { -0.3984, -0.6992 }, { 0.3984, 0.6992 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.117,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 27,
            particle_name = "storage-tank-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.2969 }, { 0.5977, 0.2969 } },
            initial_height = 0.5,
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
    name = "slowdown-capsule-explosion",
    icon = "__base__/graphics/icons/slowdown-capsule.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = util.empty_sprite(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.slowdown_capsule_explosion,
    subgroup = "gun-explosions",
    order = "a-a-a",
    render_layer = "lower-object-above-shadow",
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
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "slowdown-capsule-particle",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.09766, -0.09766 },
              right_bottom = { 0.09766, 0.09766 }
            },
            initial_height = 1,
            initial_height_deviation = 0,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.01,
            frame_speed = 0.5,
            frame_speed_deviation = 0,
            tail_length = 15,
            tail_length_deviation = 1,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 2,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "slowdown-capsule-particle-big",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.4961, -0.3945 },
              right_bottom = { 0.4961, 0.3945 }
            },
            initial_height = 0.7,
            initial_height_deviation = 0.14,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.01,
            frame_speed = 0.3,
            frame_speed_deviation = 0,
            tail_length = 15,
            tail_length_deviation = 1,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "slowdown-capsule-particle",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.1914, -0.2969 },
              right_bottom = { 0.1914, 0.2969 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.03,
            initial_vertical_speed = 0.012,
            initial_vertical_speed_deviation = 0,
            speed_from_center = 0.1,
            speed_from_center_deviation = 0,
            frame_speed = 0.5,
            frame_speed_deviation = 0,
            tail_length = 10,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "slowdown-capsule-particle-big",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.09766, -0.2969 },
              right_bottom = { 0.09766, 0.2969 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.03,
            initial_vertical_speed = 0.021,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05,
            frame_speed = 0.5,
            frame_speed_deviation = 0,
            tail_length = 10,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 7,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "slowdown-capsule-particle-big",
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.5, 0 },
              right_bottom = { 0.5, 0 }
            },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.051,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 0.25,
            frame_speed_deviation = 0,
            tail_length = 7,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "small-biter-die",
    scale = small_biter_scale,
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    order = "a[corpse]-a[biter]-a[small]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.small_biter
  },
  {
    type = "explosion",
    name = "medium-biter-die",
    scale = medium_biter_scale,
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    order = "a[corpse]-a[biter]-b[medium]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.medium_biter
  },
  {
    type = "explosion",
    name = "big-biter-die",
    scale = big_biter_scale,
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    order = "a[corpse]-a[biter]-c[big]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.big_biter
  },
  {
    type = "explosion",
    name = "behemoth-biter-die",
    scale = behemoth_biter_scale,
    icon = "__base__/graphics/icons/behemoth-biter-corpse.png",
    order = "a[corpse]-a[biter]-d[behemoth]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.behemoth_biter
  },
  {
    type = "explosion",
    name = "small-worm-die",
    localised_name = {"dying-explosion-name", {"entity-name.small-worm-turret"}},
    icon = "__base__/graphics/icons/small-worm-corpse.png",
    order = "a[corpse]-c[worm]-a[small]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.small_worm
  },
  {
    type = "explosion",
    name = "medium-worm-die",
    localised_name = {"dying-explosion-name", {"entity-name.medium-worm-turret"}},
    icon = "__base__/graphics/icons/medium-worm-corpse.png",
    order = "a[corpse]-c[worm]-b[medium]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.medium_worm
  },
  {
    type = "explosion",
    name = "big-worm-die",
    localised_name = {"dying-explosion-name", {"entity-name.big-worm-turret"}},
    icon = "__base__/graphics/icons/big-worm-corpse.png",
    order = "a[corpse]-c[worm]-c[big]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.big_worm
  },
  {
    type = "explosion",
    name = "behemoth-worm-die",
    localised_name = {"dying-explosion-name", {"entity-name.behemoth-worm-turret"}},
    icon = "__base__/graphics/icons/behemoth-worm-corpse.png",
    order = "a[corpse]-c[worm]-d[behemoth]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.behemoth_worm
  },
  {
    type = "explosion",
    name = "biter-spawner-die",
    created_effect = biter_die_effects.spawner_biter,
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
    order = "a[corpse]-b[biter-spawner]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
  },
  {
    type = "explosion",
    name = "spitter-spawner-die",
    created_effect = biter_die_effects.spawner_spitter,
    icon = "__base__/graphics/icons/spitter-spawner-corpse.png",
    order = "a[corpse]-c[spitter-spawner]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
  },
  {
    type = "explosion",
    name = "small-spitter-die",
    scale = scale_spitter_small,
    icon = "__base__/graphics/icons/small-spitter-corpse.png",
    order = "a[corpse]-b[spitter]-a[small]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.small_spitter
  },
  {
    type = "explosion",
    name = "medium-spitter-die",
    scale = scale_spitter_medium,
    icon = "__base__/graphics/icons/medium-spitter-corpse.png",
    order = "a[corpse]-b[spitter]-b[medium]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.medium_spitter
  },
  {
    type = "explosion",
    name = "big-spitter-die",
    scale = scale_spitter_big,
    icon = "__base__/graphics/icons/big-spitter-corpse.png",
    order = "a[corpse]-b[spitter]-c[big]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.big_spitter
  },
  {
    type = "explosion",
    name = "behemoth-spitter-die",
    scale = scale_spitter_behemoth,
    icon = "__base__/graphics/icons/behemoth-spitter-corpse.png",
    order = "a[corpse]-b[spitter]-d[behemoth]",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "enemy-death-explosions",
    animations = util.empty_sprite(),
    created_effect = biter_die_effects.behemoth_spitter
  },

  {
    type = "explosion",
    name = "selector-combinator-explosion",
    icon = "__base__/graphics/icons/selector-combinator.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "circuit-network-explosions",
    order = "g-b-a",
    animations = explosion_animations.small_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
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
            particle_name = "selector-combinator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.2969 }, { 0.3945, 0.2969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "selector-combinator-metal-particle-medium",
            offset_deviation = { { -0.5, -0.3906 }, { 0.5, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.039,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "selector-combinator-metal-particle-small",
            offset_deviation = { { -0.5977, -0.8906 }, { 0.5977, 0.8906 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        }
      }
    }
  },

  {
    type = "delayed-active-trigger",
    name = "cargo-pod-container-explosion-delay",
    delay = 16*2 - 1, --frames at 0.5 speed
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "cargo-pod-container-remnants"
            }
          }
        }
      }
    }
  },
  {
    type = "explosion",
    name = "cargo-pod-container-explosion",
    icon = "__base__/graphics/icons/cargo-pod.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "storage-explosions",
    order = "b-a-a",
    height = 0,
    render_layer = "object",
    animations =
    {
      layers =
      {
        util.sprite_load("__base__/graphics/entity/cargo-pod/pod-death-shadow",
        {
          priority = "medium",
          scale = 0.5,
          animation_speed = 0.5,
          frame_count = 18,
          draw_as_shadow = true
        }),
        util.sprite_load("__base__/graphics/entity/cargo-pod/pod-death",
        {
          priority = "medium",
          scale = 0.5,
          animation_speed = 0.5,
          frame_count = 18
        })
      }
    },
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound =
    {
      filename = "__base__/sound/car-metal-impact-6.ogg",
      volume = 0.6
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "delayed",
        delayed_trigger = "cargo-pod-container-explosion-delay"
      }
    }
  },

}

for k, explosion in pairs (explosions) do
  if not explosion.localised_name then
    local name = explosion.name
    if name:find("%-explosion") then
      explosion.localised_name = {"dying-explosion-name", {"entity-name."..name:gsub("%-explosion", "")}}
    elseif name:find("%-die") then
      explosion.localised_name = {"dying-explosion-name", {"entity-name."..name:gsub("%-die", "")}}
    end
  end
end

data:extend(explosions)

local uranium_cannon_shell_explosion = util.copy(data.raw["explosion"]["big-explosion"])
uranium_cannon_shell_explosion.name = "uranium-cannon-shell-explosion"
uranium_cannon_shell_explosion.localised_name = {"entity-name.uranium-cannon-shell-explosion"}
uranium_cannon_shell_explosion.icons =
{
  {icon = "__base__/graphics/icons/explosion.png"},
  {icon = "__base__/graphics/icons/explosive-uranium-cannon-shell.png"}
}
uranium_cannon_shell_explosion.order = "a-c-d"
uranium_cannon_shell_explosion.animations[1].tint = {r = 0.4, g = 1, b = 0.4}

data:extend({uranium_cannon_shell_explosion})

local uranium_cannon_explosion = util.copy(data.raw["explosion"]["explosion"])
uranium_cannon_explosion.name = "uranium-cannon-explosion"
uranium_cannon_explosion.localised_name = "entity-name.uranium-cannon-explosion"
uranium_cannon_explosion.icons =
{
  {icon = "__base__/graphics/icons/explosion.png"},
  {icon = "__base__/graphics/icons/uranium-cannon-shell.png"}
}
uranium_cannon_explosion.order = "a-c-c"

for k, v in pairs(uranium_cannon_explosion.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
end

data:extend({uranium_cannon_explosion})

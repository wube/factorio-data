local explosion_animations = require("prototypes.entity.explosion-animations")

acid_tint_medium = {r = 0.35, g = 0.56, b = 0.04, a = 1}
acid_tint_big = {r = 0.35, g = 0.56, b = 0.04, a = 1}

capsule_smoke =
{
  {
    name = "smoke-fast",
    deviation = {0.15, 0.15},
    frequency = 1,
    position = {0, 0},
    starting_frame = 3,
    starting_frame_deviation = 5,
  }
}

data:extend(
{
  {
    type = "projectile",
    name = "shotgun-pellet",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = 8, type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "grenade",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "grenade-explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1
            },
            {
              type = "destroy-decoratives",
              from_render_layer = "decorative",
              to_render_layer = "object",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = false,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 2.25 -- large radius for demostrative purposes
            }
          }
        }
      },
      {
        type = "area",
        radius = 6.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = {amount = 35, type = "explosion"}
            },
            {
              type = "create-entity",
              entity_name = "explosion"
            }
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/grenade/grenade.png",
      draw_as_glow = true,
      frame_count = 15,
      line_length = 8,
      animation_speed = 0.250,
      width = 48,
      height = 54,
      shift = util.by_pixel(0.5, 0.5),
      priority = "high",
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 15,
      line_length = 8,
      animation_speed = 0.250,
      width = 50,
      height = 40,
      shift = util.by_pixel(2, 6),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5
    }
  },

  {
    type = "projectile",
    name = "defender-capsule",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            show_in_tooltip = true,
            entity_name = "defender"
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    enable_drawing_with_mask = true,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
          flags = { "no-crop" },
          width = 28,
          height = 20,
          priority = "high"
        },
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule-mask.png",
          flags = { "no-crop" },
          width = 28,
          height = 20,
          priority = "high",
          apply_runtime_tint = true
        }
      }
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule-shadow.png",
      flags = { "no-crop" },
      width = 26,
      height = 20,
      priority = "high"
    },
    smoke = capsule_smoke
  },
  {
    type = "projectile",
    name = "laser",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.03,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = 5, type = "laser"}
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      draw_as_glow = true,
      tint = {r=1.0, g=0.0, b=0.0},
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    }
  },
  {
    type = "projectile",
    name = "blue-laser",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.02,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = {amount = 10, type = "laser"}
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/blue-laser/blue-laser.png",
      draw_as_glow = true,
      width = 7,
      height = 14,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "rocket",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.01,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = 200, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 1.5 -- large radius for demostrative purposes
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({1, 0.8, 0.3}),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
  },

  {
    type = "projectile",
    name = "explosive-rocket",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.01,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "damage",
            damage = {amount = 50, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 3.5 -- large radius for demostrative purposes
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 6.5,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 100, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            }
          }
        }
      }
    },
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({1, 0.2, 0.2}),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
  },
  {
    type = "projectile",
    name = "piercing-shotgun-pellet",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = 8, type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "cannon-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = 1000,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 1000 , type = "physical"}
          },
          {
            type = "damage",
            damage = {amount = 100 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark-tintable",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "artillery-projectile",
    name = "artillery-projectile",
    flags = {"not-on-map"},
    hidden = true,
    reveal_map = true,
    map_color = {1, 1, 0},
    picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/shell.png",
      draw_as_glow = true,
      width = 64,
      height = 64,
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/artillery-projectile/shell-shadow.png",
      width = 64,
      height = 64,
      scale = 0.5
    },
    chart_picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.25
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.0,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 1000 , type = "physical"}
                  },
                  {
                    type = "damage",
                    damage = {amount = 1000 , type = "explosion"}
                  }
                }
              }
            }
          },
          {
            type = "create-trivial-smoke",
            smoke_name = "artillery-smoke",
            initial_height = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005,
            offset_deviation = {{-4, -4}, {4, 4}},
            max_radius = 3.5,
            repeat_count = 4 * 4 * 15
          },
          {
            type = "create-entity",
            entity_name = "big-artillery-explosion"
          },
          {
            type = "show-explosion-on-chart",
            scale = 8/32
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
          type = "destroy-decoratives",
          from_render_layer = "decorative",
          to_render_layer = "object",
          include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
          include_decals = false,
          invoke_decorative_trigger = true,
          decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
          radius = 3.5 -- large radius for demostrative purposes
          }
        }
      }
    },
    height_from_ground = 280 / 64
  },
  {
    type = "projectile",
    name = "uranium-cannon-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = 2200,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 2000 , type = "physical"}
          },
          {
            type = "damage",
            damage = {amount = 200 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark-tintable",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "explosive-uranium-cannon-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    piercing_damage = 150,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 350 , type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "uranium-cannon-shell-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.25,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 315, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "uranium-cannon-explosion"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 3.25 -- large radius for demostrative purposes
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "explosive-cannon-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    piercing_damage = 100,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 180, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 300, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "medium-scorchmark-tintable",
            check_buildability = true
          },
          {
          type = "invoke-tile-trigger",
          repeat_count = 1
          },
          {
          type = "destroy-decoratives",
          from_render_layer = "decorative",
          to_render_layer = "object",
          include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
          include_decals = false,
          invoke_decorative_trigger = true,
          decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
          radius = 2 -- large radius for demostrative purposes
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "cluster-grenade",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "grenade-explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            }
          }
        }
      },
      {
        type = "cluster",
        cluster_count = 7,
        distance = 4,
        distance_deviation = 3,
        action_delivery =
        {
          type = "projectile",
          projectile = "grenade",
          direction_deviation = 0.6,
          starting_speed = 0.25,
          starting_speed_deviation = 0.3
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/cluster-grenade/cluster-grenade.png",
      draw_as_glow = true,
      frame_count = 15,
      line_length = 8,
      animation_speed = 0.250,
      width = 48,
      height = 54,
      shift = util.by_pixel(0.5, 0.5),
      priority = "high",
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 15,
      line_length = 8,
      animation_speed = 0.250,
      width = 50,
      height = 40,
      shift = util.by_pixel(2, 6),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5
    }
  },
  {
    type = "projectile",
    name = "distractor-capsule",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            show_in_tooltip = true,
            entity_name = "distractor",
            offsets = {{0.5, -0.5},{-0.5, -0.5},{0, 0.5}}
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    enable_drawing_with_mask = true,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/distractor-capsule.png",
          flags = { "no-crop" },
          width = 36,
          height = 30,
          priority = "high"
        },
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/distractor-capsule-mask.png",
          flags = { "no-crop" },
          width = 36,
          height = 30,
          priority = "high",
          apply_runtime_tint = true
        }
      }
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/distractor-capsule-shadow.png",
      flags = { "no-crop" },
      width = 40,
      height = 26,
      priority = "high"
    },
    smoke = capsule_smoke
  },
  {
    type = "projectile",
    name = "destroyer-capsule",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          show_in_tooltip = true,
          entity_name = "destroyer",
          offsets = {{-0.7, -0.7},{-0.7, 0.7},{0.7, -0.7},{0.7, 0.7},{0, 0}}
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    enable_drawing_with_mask = true,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/destroyer-capsule.png",
          flags = { "no-crop" },
          width = 42,
          height = 34,
          priority = "high"
        },
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/destroyer-capsule-mask.png",
          flags = { "no-crop" },
          width = 42,
          height = 34,
          priority = "high",
          apply_runtime_tint = true
        }
      }
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/destroyer-capsule-shadow.png",
      flags = { "no-crop" },
      width = 48,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke
  },
  {
    type = "projectile",
    name = "poison-capsule",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = true,
              entity_name = "poison-cloud",
              initial_height = 0
            },
            {
              type = "create-particle",
              particle_name = "poison-capsule-metal-particle",
              repeat_count = 8,
              initial_height = 1,
              initial_vertical_speed = 0.1,
              initial_vertical_speed_deviation = 0.05,
              offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.01
            }
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/poison-capsule/poison-capsule.png",
      draw_as_glow = true,
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 58,
      height = 59,
      shift = util.by_pixel(1, 0.5),
      priority = "high",
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/poison-capsule/poison-capsule-shadow.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 54,
      height = 42,
      shift = util.by_pixel(1, 2),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5
    },
    smoke =
    {
      {
        name = "poison-capsule-smoke",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        starting_frame = 3,
        starting_frame_deviation = 5,
      }
    }
  },
  {
    type = "projectile",
    name = "slowdown-capsule",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "slowdown-capsule-explosion"
            }
          }
        }
      },
      {
        type = "area",
        radius = 9,
        force = "enemy",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "slowdown-sticker",
              show_in_tooltip = true
            }
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/slowdown-capsule/slowdown-capsule.png",
      draw_as_glow = true,
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 60,
      height = 60,
      shift = util.by_pixel(0.5, 0.5),
      priority = "high",
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/slowdown-capsule/slowdown-capsule-shadow.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 64,
      height = 48,
      shift = util.by_pixel(2, 13.5),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5
    },
    smoke = capsule_smoke
  },
  {
    type = "projectile",
    name = "cliff-explosives",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "ground-explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            },
            {
              type = "destroy-cliffs",
              radius = 1.5,
              explosion_at_trigger = "explosion"
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1
            },
            {
              type = "destroy-decoratives",
              from_render_layer = "decorative",
              to_render_layer = "object",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = false,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 2 -- large radius for demostrative purposes
            }
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/cliff-explosives/cliff-explosives.png",
      draw_as_glow = true,
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 52,
      height = 58,
      shift = util.by_pixel(0.5, -4.5),
      priority = "high",
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/cliff-explosives/cliff-explosives-shadow.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 74,
      height = 42,
      shift = util.by_pixel(-3.5, 4),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5
    }
  }
}
)

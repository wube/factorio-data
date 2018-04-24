
capsule_smoke =
{
  {
    name = "smoke-fast",
    deviation = {0.15, 0.15},
    frequency = 1,
    position = {0, 0},
    slow_down_factor = 1,
    starting_frame = 3,
    starting_frame_deviation = 5,
    starting_frame_speed = 0,
    starting_frame_speed_deviation = 5
  }
}

data:extend(
{
  {
    type = "projectile",
    name = "laser",
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
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = 5, type = "laser"}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser.png",
      frame_count = 1,
      frame_width = 7,
      frame_height = 14,
      priority = "high"
    },
    speed = 0.15
  },
  {
    type = "projectile",
    name = "blue-laser",
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
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = {amount = 10, type = "laser"}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/blue-laser/blue-laser.png",
      frame_count = 1,
      frame_width = 7,
      frame_height = 14,
      priority = "high"
    },
    speed = 0.15
  },
  {
    type = "projectile",
    name = "rocket",
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
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = 60, type = "explosion"}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 1,
      frame_width = 10,
      frame_height = 30,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      frame_width = 10,
      frame_height = 30,
      priority = "high"
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
  {
    type = "projectile",
    name = "explosive-rocket",
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
            entity_name = "explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              perimeter = 4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 40, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            },
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 1,
      frame_width = 10,
      frame_height = 30,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      frame_width = 10,
      frame_height = 30,
      priority = "high"
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
  {
    type = "projectile",
    name = "shotgun-pellet",
    collision_box = {{-0.05, -1}, {0.05, 1}},
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
          damage = {amount = 4, type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      frame_width = 3,
      frame_height = 50,
      priority = "high"
    },
  },
  {
    type = "projectile",
    name = "piercing-shotgun-pellet",
    collision_box = {{-0.05, -1}, {0.05, 1}},
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
          damage = {amount = 6, type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
      frame_count = 1,
      frame_width = 3,
      frame_height = 50,
      priority = "high"
    },
  },
  {
    type = "projectile",
    name = "basic-grenade",
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
            entity_name = "huge-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              perimeter = 5,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 25, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            },
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/basic-grenade/basic-grenade.png",
      frame_count = 1,
      frame_width = 24,
      frame_height = 24,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/basic-grenade/basic-grenade-shadow.png",
      frame_count = 1,
      frame_width = 24,
      frame_height = 32,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "defender-capsule",
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
            entity_name = "defender",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  {
    type = "projectile",
    name = "distractor-capsule",
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
            entity_name = "distractor",
            offset = {0.5, -0.5}
          },
          {
            type = "create-entity",
            entity_name = "distractor",
            offset = {-0.5, -0.5}
          },
          {
            type = "create-entity",
            entity_name = "distractor",
            offset = {0, 0.5}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/distractor-capsule.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    smoke = capsule_smoke
  },
  {
    type = "projectile",
    name = "destroyer-capsule",
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
            entity_name = "destroyer",
            offset = {-0.7, -0.7}
          },
          {
            type = "create-entity",
            entity_name = "destroyer",
            offset = {-0.7, 0.7}
          },
          {
            type = "create-entity",
            entity_name = "destroyer",
            offset = {0.7, -0.7}
          },
          {
            type = "create-entity",
            entity_name = "destroyer",
            offset = {0.7, 0.7}
          },
          {
            type = "create-entity",
            entity_name = "destroyer",
            offset = {0, 0}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/destroyer-capsule.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    smoke = capsule_smoke
  },
  {
    type = "projectile",
    name = "poison-capsule",
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
          entity_name = "poison-cloud"
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/poison-capsule/poison-capsule.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/poison-capsule/poison-capsule-shadow.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  {
    type = "projectile",
    name = "slowdown-capsule",
    acceleration = 0.005,
    action =
    {
      type = "area",
      perimeter = 7,
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-sticker",
          sticker = "slowdown-sticker"
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/slowdown-capsule/slowdown-capsule.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/slowdown-capsule/slowdown-capsule-shadow.png",
      frame_count = 1,
      frame_width = 32,
      frame_height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  }
}
)

data:extend(
{
  {
    type = "projectile",
    name = "shotgun-pellet",
    flags = {"not-on-map"},
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
          damage = {amount = 5, type = "physical"}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "grenade",
    flags = {"not-on-map"},
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
              repeat_count = 1,
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
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 26,
      height = 28,
      shift = util.by_pixel(1, 1),
      priority = "high",
      hr_version =
      {
        filename = "__base__/graphics/entity/grenade/hr-grenade.png",
        frame_count = 16,
        line_length = 8,
        animation_speed = 0.250,
        width = 48,
        height = 54,
        shift = util.by_pixel(0.5, 0.5),
        priority = "high",
        scale = 0.5
      }

    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 26,
      height = 20,
      shift = util.by_pixel(2, 6),
      priority = "high",
      draw_as_shadow = true,
      hr_version =
      {
        filename = "__base__/graphics/entity/grenade/hr-grenade-shadow.png",
        frame_count = 16,
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
  },

  {
    type = "projectile",
    name = "defender-capsule",
    flags = {"not-on-map"},
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
          frame_count = 1,
          width = 28,
          height = 20,
          priority = "high"
        },
        {
          filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule-mask.png",
          flags = { "no-crop" },
          frame_count = 1,
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
      frame_count = 1,
      width = 26,
      height = 20,
      priority = "high"
    },
    smoke = capsule_smoke
  }
}
)

require ("prototypes.entity.demo-worm-animations")
require ("prototypes.entity.demo-enemy-sounds")
require "util"

function laser_turret_extension(inputs)
return
{
  filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start.png",
  priority = "medium",
  width = 66,
  height = 67,
  frame_count = inputs.frame_count and inputs.frame_count or 15,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  axially_symmetrical = false,
  direction_count = 4,
  shift = {0.0625, -0.984375}
}
end

function laser_turret_extension_shadow(inputs)
return
{
  filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start-shadow.png",
  width = 92,
  height = 50,
  frame_count = inputs.frame_count and inputs.frame_count or 15,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  axially_symmetrical = false,
  direction_count = 4,
  draw_as_shadow = true,
  shift = {1.46875, 0},
}
end

function laser_turret_extension_mask(inputs)
return
{
  filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start-mask.png",
  width = 51,
  height = 47,
  frame_count = inputs.frame_count and inputs.frame_count or 15,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  axially_symmetrical = false,
  apply_runtime_tint = true,
  direction_count = 4,
  shift = {0.078125, -1.26563},
}
end

function shift_medium_worm(shiftx, shifty)
  return {shiftx - 0.15, shifty + 0.15}
end

medium_worm_scale = 0.83
medium_worm_tint = {r=0.9, g=0.15, b=0.3, a=1.0}

big_worm_scale = 1.0
big_worm_tint = {r=0.34, g=0.68, b=0.90, a=1.0}

function shift_big_worm(shiftx, shifty)
  return {shiftx - 0.2, shifty + 0.2}
end

data:extend(
{
  {
    type = "turret",
    name = "medium-worm-turret",
    icon = "__base__/graphics/icons/medium-worm.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    order="b-b-e",
    subgroup="enemies",
    max_health = 350,
    resistances =
    {
      {
        type = "physical",
        decrease = 4,
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15,
      }
    },
    healing_per_tick = 0.015,
    collision_box = {{-1.1, -1.0}, {1.1, 1.0}},
    selection_box = {{-1.1, -1.0}, {1.1, 1.0}},
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = "medium-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(0.9),
    folded_speed = 0.01,
    folded_animation = worm_folded_animation(medium_worm_scale, medium_worm_tint),
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = worm_preparing_animation(medium_worm_scale, medium_worm_tint, "forward"),
    prepared_speed = 0.015,
    prepared_animation = worm_prepared_animation(medium_worm_scale, medium_worm_tint),
    starting_attack_speed = 0.03,
    starting_attack_animation = worm_attack_animation(medium_worm_scale, medium_worm_tint, "forward"),
    starting_attack_sound = make_worm_roars(0.8),
    ending_attack_speed = 0.03,
    ending_attack_animation = worm_attack_animation(medium_worm_scale, medium_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(medium_worm_scale, medium_worm_tint, "backward"),
    prepare_range = 30,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 100,
      range = 20,
      projectile_creation_distance = 1.9,
      damage_modifier = 3,
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "acid-projectile-purple",
            starting_speed = 0.5
          }
        }
      }
    },
    autoplace =
    {
      sharpness = 0.3,
      control = "enemy-base",
      order = "b[enemy]-a[base]",
      force = "enemy",
      peaks =
      {
        {
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.22,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
        },
        {
          influence = 0.3,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 10,
          tier_from_start_top_property_limit = 10,
          tier_from_start_max_range = 20,
        },
      }
    }
  },

  {
    type = "turret",
    name = "big-worm-turret",
    icon = "__base__/graphics/icons/big-worm.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    max_health = 500,
    order="b-b-f",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30,
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "big-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(1.0),
    inventory_size = 2,
    folded_speed = 0.01,
    folded_animation = worm_folded_animation(big_worm_scale, big_worm_tint),
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = worm_preparing_animation(big_worm_scale, big_worm_tint, "forward"),
    prepared_speed = 0.015,
    prepared_animation = worm_prepared_animation(big_worm_scale, big_worm_tint),
    starting_attack_speed = 0.03,
    starting_attack_animation = worm_attack_animation(big_worm_scale, big_worm_tint, "forward"),
    starting_attack_sound = make_worm_roars(0.95),
    ending_attack_speed = 0.03,
    ending_attack_animation = worm_attack_animation(big_worm_scale, big_worm_tint, "backward"),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(big_worm_scale, big_worm_tint, "backward"),
    prepare_range = 30,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 100,
      range = 25,
      projectile_creation_distance = 2.1,
      damage_modifier = 6,
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "acid-projectile-purple",
            starting_speed = 0.5
          }
        }
      }
    },
    autoplace =
    {
      sharpness = 0.3,
      control = "enemy-base",
      order = "b[enemy]-a[base]",
      force = "enemy",
      peaks =
      {
        {
          influence = -10.0,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.07,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
        },
        {
          influence = 0.38,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
          tier_from_start_optimal = 10,
          tier_from_start_top_property_limit = 10,
          tier_from_start_max_range = 20,
        }
      }
    }
  },
  {
    type = "electric-turret",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = { mining_time = 0.5, result = "laser-turret" },
    max_health = 1000,
    corpse = "medium-remnants",
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "medium-explosion",
    folding_speed = 0.05,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "801kJ",
      input_flow_limit = "4800kW",
      drain = "24kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1},
        laser_turret_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{},
        laser_turret_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          shift = {0.0625, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {0.0625, -1.3125},
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
          line_length = 8,
          width = 88,
          height = 52,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          draw_as_shadow = true,
          shift = {1.59375, 0}
        }
      }
    },
    folding_animation = 
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"},
        laser_turret_extension_mask{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 98,
          height = 82,
          axially_symmetrical = false,
          direction_count = 1,
          shift = { 0.109375, 0.03125 }
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
          line_length = 1,
          width = 54,
          height = 46,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = {0.046875, -0.109375},
        },
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      cooldown = 20,
      projectile_center = {0, -0.2},
      projectile_creation_distance = 1.4,
      range = 25,
      damage_modifier = 4,
      ammo_type =
      {
        type = "projectile",
        category = "laser-turret",
        energy_consumption = "800kJ",
        action =
        {
          {
            type = "direct",
            action_delivery =
            {
              {
                type = "projectile",
                projectile = "laser",
                starting_speed = 0.28
              }
            }
          }
        }
      },
      sound = make_laser_sounds()
    }
  },
  {
    type = "corpse",
    name = "medium-worm-corpse",
    icon = "__base__/graphics/icons/medium-worm-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-b[medium]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = worm_die_animation(medium_worm_scale, medium_worm_tint)
  },
  {
    type = "corpse",
    name = "big-worm-corpse",
    icon = "__base__/graphics/icons/big-worm-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = worm_die_animation(big_worm_scale, big_worm_tint)
  }
}
)

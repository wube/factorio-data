require "util"

laser_turret_extension =
{
  filename = "__base__/graphics/entity/laser-turret/laser-turret-extension.png",
  priority = "medium",
  frame_width = 131,
  frame_height = 74,
  direction_count = 4,
  frame_count = 5,
  axially_symmetrical = false,
  shift = {1.171875, -0.34375}
}

function shift_medium_worm(shiftx, shifty)
  return {shiftx - 0.15, shifty + 0.15}
end

medium_worm_preparing =
{
  filename = "__base__/graphics/entity/medium-worm-turret/preparing.png",
  priority = "medium",
  frame_width = 175,
  frame_height = 125,
  frame_count = 27,
  line_length = 7,
  direction_count = 1,
  axially_symmetrical = false,
  shift = shift_medium_worm(0.929688, -0.624219),
}

medium_worm_starting_attack =
{
  priority = "medium",
  frame_width = 229,
  frame_height = 175,
  frame_count = 8,
  direction_count = 16,
  line_length = 1,
  shift = shift_medium_worm(0.677344, -0.6375),
  axially_symmetrical = false,
  stripes =
  {
    {
      filename = "__base__/graphics/entity/medium-worm-turret/starting-attack-1.png",
      width_in_frames = 8,
      height_in_frames = 8
    },
    {
      filename = "__base__/graphics/entity/medium-worm-turret/starting-attack-2.png",
      width_in_frames = 8,
      height_in_frames = 8
    },
  }
}

function shift_big_worm(shiftx, shifty)
  return {shiftx - 0.2, shifty + 0.2}
end

big_worm_preparing =
{
  filename = "__base__/graphics/entity/big-worm-turret/preparing.png",
  priority = "medium",
  line_length = 7,
  frame_width = 207,
  frame_height = 148,
  frame_count = 27,
  axially_symmetrical = false,
  direction_count = 1,
  shift = shift_big_worm(1.09375, -0.734375),
}

big_worm_starting_attack =
{
  frame_width = 270,
  frame_height = 207,
  frame_count = 8,
  axially_symmetrical = false,
  direction_count = 16,
  shift = shift_big_worm(0.796875, -0.75),
  stripes =
  {
   {
    filename = "__base__/graphics/entity/big-worm-turret/starting-attack-1.png",
    width_in_frames = 4,
    height_in_frames = 8,
   },
   {
    filename = "__base__/graphics/entity/big-worm-turret/starting-attack-2.png",
    width_in_frames = 4,
    height_in_frames = 8,
   },
   {
    filename = "__base__/graphics/entity/big-worm-turret/starting-attack-3.png",
    width_in_frames = 4,
    height_in_frames = 8,
   },
   {
    filename = "__base__/graphics/entity/big-worm-turret/starting-attack-4.png",
    width_in_frames = 4,
    height_in_frames = 8,
   }
  }
}

data:extend(
{
  {
    type = "turret",
    name = "medium-worm-turret",
    icon = "__base__/graphics/icons/medium-worm.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    order="b-b-e",
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
    rotation_speed = 1,
    corpse = "medium-worm-corpse",
    folded_speed = 0.01,
    folded_animation =
    {
      filename = "__base__/graphics/entity/medium-worm-turret/folded.png",
      priority = "medium",
      frame_width = 120,
      frame_height = 88,
      frame_count = 15,
      direction_count = 1,
      line_length = 5,
      axially_symmetrical = false,
      shift = shift_medium_worm(0.0664062, -0.0398437),
    },
    preparing_speed = 0.025,
    preparing_animation = medium_worm_preparing,
    prepared_speed = 0.01,
    prepared_animation =
    {
      filename = "__base__/graphics/entity/medium-worm-turret/prepared.png",
      run_mode = "forward-then-backward",
      priority = "medium",
      line_length = 4,
      frame_width = 164,
      frame_height = 133,
      frame_count = 11,
      axially_symmetrical = false,
      direction_count = 1,
      shift = shift_medium_worm(0.757031, -0.770312),
    },
    starting_attack_speed = 0.03,
    starting_attack_animation = medium_worm_starting_attack,
    ending_attack_speed = 0.03,
    ending_attack_animation = (function()
                                local res = util.table.deepcopy(medium_worm_starting_attack)
                                res.run_mode = "backward"
                                return res
                              end)(),
    folding_speed = 0.015,
    folding_animation = (function()
                           local res = util.table.deepcopy(medium_worm_preparing)
                           res.run_mode = "backward"
                           return res
                         end)(),
    prepare_range = 30,
    attack_parameters =
    {
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
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 500,
    order="b-b-f",
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
    rotation_speed = 1,
    corpse = "big-worm-corpse",
    inventory_size = 2,
    folded_speed = 0.01,
    folded_animation =
    {
      filename = "__base__/graphics/entity/big-worm-turret/folded.png",
      priority = "medium",
      frame_width = 142,
      frame_height = 104,
      frame_count = 15,
      axially_symmetrical = false,
      direction_count = 1,
      line_length = 5,
      shift = shift_big_worm(0.078125, -0.046875),
    },
    preparing_speed = 0.025,
    preparing_animation = big_worm_preparing,
    prepared_speed = 0.01,
    prepared_animation =
    {
      filename = "__base__/graphics/entity/big-worm-turret/prepared.png",
      run_mode = "forward-then-backward",
      priority = "medium",
      line_length = 4,
      frame_width = 194,
      frame_height = 157,
      frame_count = 11,
      axially_symmetrical = false,
      direction_count = 1,
      shift = shift_big_worm(0.890625, -0.90625),
    },
    starting_attack_speed = 0.03,
    starting_attack_animation = big_worm_starting_attack,
    ending_attack_speed = 0.03,
    ending_attack_animation = (function()
                                local res = util.table.deepcopy(big_worm_starting_attack)
                                res.run_mode = "backward"
                                return res
                              end)(),
    folding_speed = 0.015,
    folding_animation = (function()
                           local res = util.table.deepcopy(big_worm_preparing)
                           res.run_mode = "backward"
                           return res
                         end)(),
    prepare_range = 30,
    attack_parameters =
    {
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
        },
      }
    }
  },
  {
    type = "electric-turret",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = { mining_time = 0.5, result = "laser-turret" },
    max_health = 250,
    corpse = "small-remnants",
    collision_box = {{ -0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{ -0.4, -0.4}, {0.4, 0.4}},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "huge-explosion",
    folding_speed = 0.05,
    ammo_type =
    {
      type = "projectile",
      category = "laser-turret",
      energy_consumption = "200kJ",
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
    energy_source =
    {
      type = "electric",
      buffer_capacity = "201kJ",
      input_flow_limit = "1200kW",
      drain = "6kW",
      usage_priority = "primary-input"
    },
    folded_animation = (function()
                          local res = util.table.deepcopy(laser_turret_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
    preparing_animation = laser_turret_extension,
    prepared_animation =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-turret.png",
      priority = "medium",
      frame_width = 131,
      frame_height = 72,
      direction_count = 64,
      frame_count = 1,
      line_length = 8,
      axially_symmetrical = false,
      shift = {1.328125, -0.375}
    },
    folding_animation = (function()
                          local res = util.table.deepcopy(laser_turret_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),
    base_picture =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
      priority = "high",
      width = 43,
      height = 28,
      shift = { 0.109375, 0.03125 }
    },
    attack_parameters =
    {
      ammo_category = "electric",
      cooldown = 20,
      damage = 2,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 25,
      sound =
      {
        {
          filename = "__base__/sound/laser.wav",
          volume = 0.4
        }
      }
    }
  },
  {
    type = "corpse",
    name = "medium-worm-corpse",
    order="b-c-e",
    dying_speed = 0.01,
    final_render_layer = "corpse",
    animation =
    {
      frame_width = 274,
      frame_height = 243,
      frame_count = 29,
      direction_count = 1,
      line_length = 6,
      axially_symetric = false,
      shift = shift_medium_worm(0.053125, 0.159375),
      filename = "__base__/graphics/entity/medium-worm-turret/die.png",
    },
  },
  {
    type = "corpse",
    name = "big-worm-corpse",
    order="b-c-f",
    dying_speed = 0.01,
    final_render_layer = "corpse",
    animation =
    {
      filename = "__base__/graphics/entity/big-worm-turret/die.png",
      line_length = 6,
      frame_width = 323,
      frame_height = 287,
      frame_count = 29,
      axially_symmetrical = false,
      direction_count = 1,
      shift = shift_big_worm(0.0625, 0.1875),
    }
  }
}
)

require "util"

gun_turret_extension =
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-extension.png",
  priority = "medium",
  width = 171,
  height = 102,
  direction_count = 4,
  frame_count = 5,
  axially_symmetrical = false,
  shift = {1.34375, -0.5 + 0.6}
}

function shift_small_worm(shiftx, shifty)
  return {shiftx - 0.1, shifty + 0.1}
end

small_worm_preparing =
{
  filename = "__base__/graphics/entity/small-worm-turret/preparing.png",
  priority = "medium",
  width = 144,
  height = 103,
  frame_count = 27,
  line_length = 7,
  direction_count = 1,
  axially_symmetrical = false,
  shift = shift_small_worm(0.765625, -0.514062)
}

small_worm_starting_attack =
{
  priority = "medium",
  width = 189,
  height = 144,
  frame_count = 8,
  direction_count = 16,
  line_length = 1,
  shift = shift_small_worm(0.557812, -0.525),
  axially_symmetrical = false,
  stripes =
  {
    {
      filename = "__base__/graphics/entity/small-worm-turret/starting-attack-1.png",
      width_in_frames = 8,
      height_in_frames = 8
    },
    {
      filename = "__base__/graphics/entity/small-worm-turret/starting-attack-2.png",
      width_in_frames = 8,
      height_in_frames = 8
    },
  }
}

data:extend(
{
  {
    type = "turret",
    name = "small-worm-turret",
    icon = "__base__/graphics/icons/small-worm.png",
    flags = {"placeable-enemy", "not-repairable", "breaths-air"},
    order="b-b-d",
    max_health = 200,
    subgroup="enemies",
    healing_per_tick = 0.01,
    collision_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    selection_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    shooting_cursor_size = 3,
    corpse = "small-worm-corpse",
    dying_explosion = "blood-explosion-big",
    folded_speed = 0.01,
    folded_animation =
    {
      filename = "__base__/graphics/entity/small-worm-turret/folded.png",
      priority = "medium",
      width = 99,
      height = 72,
      frame_count = 15,
      direction_count = 1,
      line_length = 5,
      axially_symmetrical = false,
      shift = shift_small_worm(0.0546875, -0.0328125)
    },
    prepare_range = 25,
    preparing_speed = 0.025,
    preparing_animation = small_worm_preparing,
    prepared_speed = 0.015,
    prepared_animation =
    {
      filename = "__base__/graphics/entity/small-worm-turret/prepared.png",
      priority = "medium",
      run_mode = "forward-then-backward",
      width = 135,
      height = 109,
      frame_count = 11,
      line_length = 4,
      direction_count = 1,
      axially_symmetrical = false,
      shift = shift_small_worm(0.623437, -0.634375)
    },
    starting_attack_speed = 0.03,
    starting_attack_animation = small_worm_starting_attack,
    starting_attack_sound =
    {
      {
        filename = "__base__/sound/creatures/worm-roar-short-1.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creatures/worm-roar-short-2.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creatures/worm-roar-short-3.ogg",
        volume = 0.7
      }
    },
    ending_attack_speed = 0.03,
    ending_attack_animation = (function()
                                local res = util.table.deepcopy(small_worm_starting_attack)
                                res.run_mode = "backward"
                                return res
                              end)(),
    folding_speed = 0.015,
    folding_animation = (function()
                           local res = util.table.deepcopy(small_worm_preparing)
                           res.run_mode = "backward"
                           return res
                         end)(),
    attack_parameters =
    {
      ammo_category = "bullet",
      cooldown = 15,
      range = 17,
      projectile_creation_distance = 1.8,
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
          influence = 0.31,
          noise_layer = "enemy-base",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.5,
        },
        {
          influence = 0.1,
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
    type = "ammo-turret",
    name = "gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "gun-turret"},
    max_health = 200,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.9 }, {0.4, 0.9}},
    selection_box = {{-0.5, -1 }, {0.5, 1}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "huge-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    folded_animation = (function()
                          local res = util.table.deepcopy(gun_turret_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
    preparing_animation = gun_turret_extension,
    prepared_animation =
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret.png",
      priority = "medium",
      width = 178,
      height = 107,
      direction_count = 64,
      frame_count = 1,
      line_length = 8,
      axially_symmetrical = false,
      shift = {1.34375, -0.46875 + 0.6}
    },
    folding_animation = (function()
                          local res = util.table.deepcopy(gun_turret_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),
    base_picture =
    {
      filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
      priority = "high",
      width = 43,
      height = 28,
      shift = { 0, -0.125 + 0.6 }
    },
    attack_parameters =
    {
      ammo_category = "bullet",
      cooldown = 6,
      projectile_center = {0, 0.6},
      projectile_creation_distance = 1.2,
      shell_particle = 
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.6},
        creation_distance = 0.6,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 17,
      sound =
      {
        {
          filename = "__base__/sound/gunshot.ogg",
          volume = 0.3
        }
      }
    }
  },
  {
    type = "corpse",
    name = "small-worm-corpse",
    icon = "__base__/graphics/icons/small-worm-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    dying_speed = 0.01,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    final_render_layer = "corpse",
    animation =
    {
      width = 226,
      height = 200,
      frame_count = 29,
      direction_count = 1,
      line_length = 6,
      axially_symetric = false,
      shift = shift_small_worm(0.04375, 0.13125),
      filename = "__base__/graphics/entity/small-worm-turret/die.png",
    },
  }
}
)

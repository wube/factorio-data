require ("prototypes.entity.spitter-projectiles")
require ("prototypes.entity.worm-animations")
require ("prototypes.entity.pipecovers")
require ("prototypes.entity.assemblerpipes")
enemy_autoplace = require ("prototypes.entity.enemy-autoplace-utils")

local sounds = require("prototypes.entity.sounds")
local hit_effects = require ("prototypes.entity.hit-effects")

function shift_medium_worm(shiftx, shifty)
  return {shiftx - 0.15, shifty + 0.15}
end

function shift_big_worm(shiftx, shifty)
  return {shiftx - 0.2, shifty + 0.2}
end

local util = require('util')

function gun_turret_extension(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising.png",
  priority = "medium",
  width = 66,
  height = 64,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(0, -26),
  axially_symmetrical = false,
  hr_version =
  {
    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-raising.png",
    priority = "medium",
    width = 130,
    height = 126,
    direction_count = 4,
    frame_count = inputs.frame_count or 5,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    shift = util.by_pixel(0, -26.5),
    axially_symmetrical = false,
    scale = 0.5
  }
}
end

function gun_turret_extension_mask(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-mask.png",
  flags = { "mask" },
  width = 24,
  height = 32,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(0, -28),
  axially_symmetrical = false,
  apply_runtime_tint = true,
  hr_version =
  {
    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-raising-mask.png",
    flags = { "mask" },
    width = 48,
    height = 62,
    direction_count = 4,
    frame_count = inputs.frame_count or 5,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    shift = util.by_pixel(0, -28),
    axially_symmetrical = false,
    apply_runtime_tint = true,
    scale = 0.5
  }
}
end

function gun_turret_extension_shadow(inputs)
return
{
  filename = "__base__/graphics/entity/gun-turret/gun-turret-raising-shadow.png",
  width = 126,
  height = 62,
  direction_count = 4,
  frame_count = inputs.frame_count or 5,
  line_length = inputs.line_length or 0,
  run_mode = inputs.run_mode or "forward",
  shift = util.by_pixel(19, 2),
  axially_symmetrical = false,
  draw_as_shadow = true,
  hr_version =
  {
    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-raising-shadow.png",
    width = 250,
    height = 124,
    direction_count = 4,
    frame_count = inputs.frame_count or 5,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    shift = util.by_pixel(19, 2.5),
    axially_symmetrical = false,
    draw_as_shadow = true,
    scale = 0.5
  }
}
end

function gun_turret_attack(inputs)
return
{
  layers =
  {
    {
      width = 66,
      height = 66,
      frame_count = inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = util.by_pixel(0, -27),
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-1.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-2.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-3.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-4.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        }
      },
      hr_version =
      {
        width = 132,
        height = 130,
        frame_count = inputs.frame_count or 2,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(0, -27.5),
        stripes =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-1.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-2.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-3.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-4.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          }
        },
        scale = 0.5
      }
    },
    {
      flags = { "mask" },
      line_length = inputs.frame_count or 2,
      width = 30,
      height = 28,
      frame_count = inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = util.by_pixel(0, -32),
      apply_runtime_tint = true,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-1.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-2.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-3.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-mask-4.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        }
      },
      hr_version =
      {
        flags = { "mask" },
        line_length = inputs.frame_count or 2,
        width = 58,
        height = 54,
        frame_count = inputs.frame_count or 2,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(0, -32.5),
        apply_runtime_tint = true,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-1.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-2.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-3.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-4.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          }
        },
        scale = 0.5
      }
    },
    {
      width = 126,
      height = 62,
      frame_count = inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
      shift = util.by_pixel(23, 2),
      draw_as_shadow = true,
      stripes =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-1.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-2.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-3.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-shooting-shadow-4.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 16
        }
      },
      hr_version =
      {
        width = 250,
        height = 124,
        frame_count = inputs.frame_count or 2,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(22, 2.5),
        draw_as_shadow = true,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-1.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-2.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-3.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-4.png",
            width_in_frames = inputs.frame_count or 2,
            height_in_frames = 16
          }
        },
        scale = 0.5
      }
    }
  }
}
end

function laser_turret_extension(inputs)
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-raising.png",
    priority = "medium",
    width = 66,
    height = 64,
    frame_count = inputs.frame_count or 15,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    shift = util.by_pixel(0, -32),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-raising.png",
      priority = "medium",
      width = 130,
      height = 126,
      frame_count = inputs.frame_count or 15,
      line_length = inputs.line_length or 0,
      run_mode = inputs.run_mode or "forward",
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(0, -32.5),
      scale = 0.5
    }
  }
end

function laser_turret_extension_shadow(inputs)
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-raising-shadow.png",
    width = 92,
    height = 50,
    frame_count = inputs.frame_count or 15,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    draw_as_shadow = true,
    shift = util.by_pixel(47, 3),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-raising-shadow.png",
      width = 182,
      height = 96,
      frame_count = inputs.frame_count or 15,
      line_length = inputs.line_length or 0,
      run_mode = inputs.run_mode or "forward",
      axially_symmetrical = false,
      direction_count = 4,
      draw_as_shadow = true,
      shift = util.by_pixel(47, 2.5),
      scale = 0.5
    }
  }
end

function laser_turret_extension_mask(inputs)
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-raising-mask.png",
    flags = { "mask" },
    width = 44,
    height = 40,
    frame_count = inputs.frame_count or 15,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    axially_symmetrical = false,
    apply_runtime_tint = true,
    direction_count = 4,
    shift = util.by_pixel(0, -43),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-raising-mask.png",
      flags = { "mask" },
      width = 86,
      height = 80,
      frame_count = inputs.frame_count or 15,
      line_length = inputs.line_length or 0,
      run_mode = inputs.run_mode or "forward",
      axially_symmetrical = false,
      apply_runtime_tint = true,
      direction_count = 4,
      shift = util.by_pixel(0, -43),
      scale = 0.5
    }
  }
end

function laser_turret_shooting()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting.png",
    line_length = 8,
    width = 64,
    height = 60,
    frame_count = 1,
    direction_count = 64,
    shift = util.by_pixel(0, -35),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting.png",
      line_length = 8,
      width = 126,
      height = 120,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(0, -35),
      scale = 0.5
    }
  }
end

function laser_turret_shooting_glow()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-light.png",
    line_length = 8,
    width = 62,
    height = 58,
    frame_count = 1,
    direction_count = 64,
    blend_mode = "additive",
    shift = util.by_pixel(0, -35),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting-light.png",
      line_length = 8,
      width = 122,
      height = 116,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(-0.5, -35),
      blend_mode = "additive",
      scale = 0.5
    }
  }
end

function laser_turret_shooting_mask()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-mask.png",
    flags = { "mask" },
    line_length = 8,
    width = 46,
    height = 42,
    frame_count = 1,
    apply_runtime_tint = true,
    direction_count = 64,
    shift = util.by_pixel(0, -43),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting-mask.png",
      flags = { "mask" },
      line_length = 8,
      width = 92,
      height = 80,
      frame_count = 1,
      apply_runtime_tint = true,
      direction_count = 64,
      shift = util.by_pixel(0, -43.5),
      scale = 0.5
    }
  }
end

function laser_turret_shooting_shadow()
  return
  {
    filename = "__base__/graphics/entity/laser-turret/laser-turret-shooting-shadow.png",
    line_length = 8,
    width = 86,
    height = 46,
    frame_count = 1,
    direction_count = 64,
    draw_as_shadow = true,
    shift = util.by_pixel(51, 2),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-shooting-shadow.png",
      line_length = 8,
      width = 170,
      height = 92,
      frame_count = 1,
      direction_count = 64,
      draw_as_shadow = true,
      shift = util.by_pixel(50.5, 2.5),
      scale = 0.5
    }
  }
end

function shift_small_worm(shiftx, shifty)
  return {shiftx - 0.1, shifty + 0.1}
end

data:extend(
{
  {
    type = "turret",
    name = "small-worm-turret",
    icon = "__base__/graphics/icons/small-worm.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    order="b-c-a",
    max_health = 200,
    subgroup="enemies",
    resistances = {},
    healing_per_tick = 0.01,
    collision_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    map_generator_bounding_box = {{-1.9, -1.8}, {1.9, 1.8}},
    selection_box = {{-0.9, -0.8 }, {0.9, 0.8}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 3,
    corpse = "small-worm-corpse",
    dying_explosion = "small-worm-die",
    dying_sound = sounds.worm_dying_small(0.57),
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(scale_worm_small, tint_worm_small),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(scale_worm_small, tint_worm_small, "forward"),
    preparing_sound = sounds.worm_standup_small(1),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_sound = sounds.worm_breath(0.6),
    prepared_animation = worm_prepared_animation(scale_worm_small, tint_worm_small),
    prepared_alternative_speed = 0.024,
    prepared_alternative_speed_secondary = 0.018,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_small, tint_worm_small),
    prepared_alternative_sound = sounds.worm_roar_alternative(0.64),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_small, tint_worm_small),
    starting_attack_sound = sounds.worm_roars(0.62),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(scale_worm_small, tint_worm_small),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(scale_worm_small, tint_worm_small, "backward"),
    folding_sound = sounds.worm_fold(1),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    integration = worm_integration(scale_worm_small),
    prepare_range = range_worm_small + prepare_range_worm_small,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_small,--defined in spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_small,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_small, scale_worm_small * scale_worm_stream),
      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-small",
            source_offset = {0.15, -0.5}
          }
        }
      },

      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/creatures/worm-spit-start.ogg",
            volume = 0.0
          },
          {
            filename = "__base__/sound/creatures/worm-spit-start-2.ogg",
            volume = 0.0
          },
          {
            filename = "__base__/sound/creatures/worm-spit-start-3.ogg",
            volume = 0.0
          }
        },
        --middle_sound =
       -- {
          --{
           -- filename = "__base__/sound/fight/flamethrower-mid.ogg",
            --volume = 0.7
          --}
        --},
        end_sound =
        {
          {
            filename = "__base__/sound/creatures/worm-spit-end.ogg",
            volume = 0.0
          }
        }
      }
    },
    --{
    --  type = "stream",
    --  ammo_category = "bullet",
    --  cooldown = 15,
    --  range = 21,
    --  projectile_creation_parameters = worm_shoot_shiftings(scale_worm_small),
    --  use_shooter_direction = true,
    --  damage_modifier = 2.5,
    --  ammo_type =
    --  {
    --    category = "biological",
    --    action =
    --    {
    --      type = "direct",
    --      action_delivery =
    --      {
    --        type = "stream",
    --        stream = "acid-stream-small",
    --        starting_speed = 0.5,
    --        max_range = 50,
    --      }
    --    }
    --  }
    --},
    autoplace = enemy_autoplace.enemy_worm_autoplace(0),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 1,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 0,
        spawn_max_radius = 1
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      }
    }
  },
  {
    type = "ammo-turret",
    name = "gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "gun-turret"},
    max_health = 400,
    corpse = "gun-turret-remnants",
    dying_explosion = "gun-turret-explosion",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    preparing_sound = sounds.gun_turret_activate,
    folding_sound = sounds.gun_turret_deactivate,
    folding_speed = 0.08,
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.5,
    alert_when_attacking = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    folded_animation =
    {
      layers =
      {
        gun_turret_extension{frame_count=1, line_length = 1},
        gun_turret_extension_mask{frame_count=1, line_length = 1},
        gun_turret_extension_shadow{frame_count=1, line_length = 1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        gun_turret_extension{},
        gun_turret_extension_mask{},
        gun_turret_extension_shadow{}
      }
    },
    prepared_animation = gun_turret_attack{frame_count=1},
    attacking_animation = gun_turret_attack{},
    folding_animation =
    {
      layers =
      {
        gun_turret_extension{run_mode = "backward"},
        gun_turret_extension_mask{run_mode = "backward"},
        gun_turret_extension_shadow{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
          priority = "high",
          width = 76,
          height = 60,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(1, -1),
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base.png",
            priority = "high",
            width = 150,
            height = 118,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0.5, -1),
            scale = 0.5
          }
        },
        --{
        --  filename = "__base__/graphics/entity/gun-turret/gun-turret-base-shadow.png",
        --  line_length = 1,
        --  width = 78,
        --  height = 62,
        --  axially_symmetrical = false,
        --  direction_count = 1,
        --  frame_count = 1,
        --  shift = util.by_pixel(5, 3),
        --  draw_as_shadow = true,
        --  hr_version =
        --  {
        --    filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base-shadow.png",
        --    line_length = 1,
        --    width = 154,
        --    height = 122,
        --    axially_symmetrical = false,
        --    direction_count = 1,
        --    frame_count = 1,
        --    shift = util.by_pixel(5, 2.5),
        --    draw_as_shadow = true,
        --    scale = 0.5
        --  }
        --},
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask", "low-object" },
          line_length = 1,
          width = 62,
          height = 52,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, -4),
          apply_runtime_tint = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-base-mask.png",
            flags = { "mask", "low-object" },
            line_length = 1,
            width = 122,
            height = 102,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0, -4.5),
            apply_runtime_tint = true,
            scale = 0.5
          }
        }

      }
    },
    vehicle_impact_sound = sounds.generic_impact,

    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 6,
      projectile_creation_distance = 1.39375,
      projectile_center = {0, -0.0875}, -- same as gun_turret_attack shift
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {-0.0625, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 18,
      sound = sounds.gun_turret_gunshot
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/gun-turret/gun-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "corpse",
    name = "small-worm-corpse",
    icon = "__base__/graphics/icons/small-worm-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    final_render_layer = "lower-object-above-shadow",
    animation = worm_die_animation(scale_worm_small, tint_worm_small),
    ground_patch =
    {
      sheet = worm_integration(scale_worm_small)
    }
  },
  {
    type = "electric-turret",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = { mining_time = 0.5, result = "laser-turret" },
    max_health = 1000,
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    preparing_sound = sounds.laser_turret_activate,
    folding_sound = sounds.laser_turret_deactivate,
    corpse = "laser-turret-remnants",
    dying_explosion = "laser-turret-explosion",
    folding_speed = 0.05,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "801kJ",
      input_flow_limit = "9600kW",
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
        laser_turret_shooting(),
        laser_turret_shooting_shadow(),
        laser_turret_shooting_mask()
      }
    },
    --attacking_speed = 0.1,
    energy_glow_animation = laser_turret_shooting_glow(),
    glow_light_intensity = 0.5, -- defaults to 0
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
          width = 70,
          height = 52,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base.png",
            priority = "high",
            width = 138,
            height = 104,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(-0.5, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
          line_length = 1,
          width = 66,
          height = 42,
          draw_as_shadow = true,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(6, 3),
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base-shadow.png",
            line_length = 1,
            width = 132,
            height = 82,
            draw_as_shadow = true,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(6, 3),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound = sounds.generic_impact,

    attack_parameters =
    {
      type = "beam",
      cooldown = 40,
      range = 24,
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
      damage_modifier = 2,
      ammo_type =
      {
        category = "laser",
        energy_consumption = "800kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "laser-beam",
            max_length = 24,
            duration = 40,
            source_offset = {0, -1.31439 }
          }
        }
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "artillery-turret",
    name = "artillery-turret",
    icon = "__base__/graphics/icons/artillery-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    inventory_size = 1,
    ammo_stack_limit = 15,
    automated_ammo_count = 5,
    alert_when_attacking = false,
    minable = {mining_time = 0.5, result = "artillery-turret"},
    open_sound = sounds.artillery_open,
    close_sound = sounds.artillery_close,
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    rotating_sound = { sound = { filename = "__base__/sound/fight/artillery-rotation-loop.ogg", volume = 0.6 }},
    rotating_stopped_sound = { filename = "__base__/sound/fight/artillery-rotation-stop.ogg" },
    max_health = 2000,
    corpse = "artillery-turret-remnants",
    dying_explosion = "artillery-turret-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    gun = "artillery-wagon-cannon",
    turret_rotation_speed = 0.001,
    turn_after_shooting_cooldown = 60,
    cannon_parking_frame_count = 8,
    cannon_parking_speed = 0.25,
    manual_range_modifier = 2.5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 30
      },
      {
        type = "impact",
        decrease = 50,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 30
      },
      {
        type = "acid",
        decrease = 3,
        percent = 20
      }
    },

    base_shift = util.by_pixel(0, -22),

    base_picture_render_layer = "lower-object-above-shadow",

    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/artillery-turret/artillery-turret-base.png",
          priority = "high",
          width = 104,
          height = 100,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(-0, 22),
          hr_version =
          {
            filename = "__base__/graphics/entity/artillery-turret/hr-artillery-turret-base.png",
            priority = "high",
            line_length = 1,
            width = 207,
            height = 199,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-0, 22),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/artillery-turret/artillery-turret-base-shadow.png",
          priority = "high",
          line_length = 1,
          width = 138,
          height = 75,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(18, 38),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/artillery-turret/hr-artillery-turret-base-shadow.png",
            priority = "high",
            line_length = 1,
            width = 277,
            height = 149,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(18, 38),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },

    cannon_barrel_pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 266,
          height = 192,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -56),
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 530,
            height = 384,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0, -56),
            scale = 0.5,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-16.png"
            }
          }
        },
        {
          priority = "very-low",
          width = 454,
          height = 314,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(-3+58, 8+46),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 906,
            height = 626,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(-3.5+58, 7.5+46),
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_base_pictures =
    {
      layers =
      {
        {
          priority = "very-low",
          width = 180,
          height = 136,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(0, -40),
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 358,
            height = 270,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(0, -40.5),
            scale = 0.5,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-16.png"
            }
          }
        },
        {
          priority = "very-low",
          width = 238,
          height = 170,
          direction_count = 256,
          line_length = 4,
          lines_per_file = 4,
          shift = util.by_pixel(54+58, -1+46),
          draw_as_shadow = true,
          filenames =
          {
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-1.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-2.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-3.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-4.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-5.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-6.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-7.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-8.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-9.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-10.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-11.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-12.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-13.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-14.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-15.png",
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-16.png"
          },
          hr_version =
          {
            priority = "very-low",
            width = 476,
            height = 340,
            direction_count = 256,
            line_length = 4,
            lines_per_file = 4,
            shift = util.by_pixel(54.5+58, -1+46),
            scale = 0.5,
            draw_as_shadow = true,
            filenames =
            {
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-1.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-2.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-3.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-4.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-5.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-6.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-7.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-8.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-9.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-10.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-11.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-12.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-13.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-14.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-15.png",
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-16.png"
            }
          }
        }
      }
    },
    cannon_barrel_recoil_shiftings =
    {
      {x =-0.000, y =0.040, z =-0.000},
      {x =-0.789, y =0.037, z =-0.351},
      {x =-1.578, y =0.035, z =-0.702},
      {x =-2.367, y =0.033, z =-1.054},
      {x =-3.155, y =0.031, z =-1.405},
      {x =-3.944, y =0.028, z =-1.756},
      {x =-3.931, y =0.028, z =-1.750},
      {x =-3.901, y =0.028, z =-1.737},
      {x =-3.854, y =0.029, z =-1.716},
      {x =-3.790, y =0.029, z =-1.688},
      {x =-3.711, y =0.029, z =-1.652},
      {x =-3.617, y =0.029, z =-1.610},
      {x =-3.508, y =0.030, z =-1.562},
      {x =-3.385, y =0.030, z =-1.507},
      {x =-3.249, y =0.030, z =-1.447},
      {x =-3.102, y =0.031, z =-1.381},
      {x =-2.944, y =0.031, z =-1.311},
      {x =-2.776, y =0.032, z =-1.236},
      {x =-2.599, y =0.032, z =-1.157},
      {x =-2.416, y =0.033, z =-1.076},
      {x =-2.226, y =0.033, z =-0.991},
      {x =-2.032, y =0.034, z =-0.905},
      {x =-1.835, y =0.034, z =-0.817},
      {x =-1.635, y =0.035, z =-0.728},
      {x =-1.436, y =0.035, z =-0.639},
      {x =-1.238, y =0.036, z =-0.551},
      {x =-1.042, y =0.037, z =-0.464},
      {x =-0.851, y =0.037, z =-0.379},
      {x =-0.665, y =0.038, z =-0.296},
      {x =-0.485, y =0.038, z =-0.216},
      {x =-0.314, y =0.039, z =-0.140},
      {x =-0.152, y =0.039, z =-0.068}
    },
    cannon_barrel_light_direction = {0.5976251, 0.0242053, -0.8014102},
    cannon_barrel_recoil_shiftings_load_correction_matrix =
    {
      { 0,    0.25,   0 },
      {-0.25,    0,   0 },
      { 0,       0,   0.25 }
    },

    vehicle_impact_sound = sounds.generic_impact,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/artillery-turret/artillery-turret-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 32,
        shift = util.by_pixel(0, 75),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  }
})

data:extend(
{
  {
    type = "turret",
    name = "medium-worm-turret",
    icon = "__base__/graphics/icons/medium-worm.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    order="b-c-b",
    subgroup="enemies",
    max_health = 400,
    resistances =
    {
      {
        type = "physical",
        decrease = 5
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 2,
        percent = 50
      }
    },
    healing_per_tick = 0.015,
    collision_box = {{-1.1, -1.0}, {1.1, 1.0}},
    map_generator_bounding_box = {{-2.1, -2.0}, {2.1, 2.0}},
    selection_box = {{-1.1, -1.0}, {1.1, 1.0}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 3.5,
    rotation_speed = 1,
    corpse = "medium-worm-corpse",
    dying_explosion = "medium-worm-die",
    dying_sound = sounds.worm_dying_small(0.65),
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(scale_worm_medium, tint_worm_medium),
    preparing_speed = 0.024,
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    preparing_animation = worm_preparing_animation(scale_worm_medium, tint_worm_medium, "forward"),
    preparing_sound = sounds.worm_standup(1),
    prepared_sound = sounds.worm_breath(0.8),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_medium, tint_worm_medium),
    prepared_alternative_sound = sounds.worm_roar_alternative(0.68),
    prepared_animation = worm_prepared_animation(scale_worm_medium, tint_worm_medium),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_medium, tint_worm_medium),
    starting_attack_sound = sounds.worm_roars(0.68),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(scale_worm_medium, tint_worm_medium),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(scale_worm_medium, tint_worm_medium, "backward"),
    folding_sound = sounds.worm_fold(1),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    integration = worm_integration(scale_worm_medium),
    prepare_range = range_worm_medium + prepare_range_worm_medium,
    allow_turning_when_starting_attack = true,

    attack_parameters =
    {
      type = "stream",
      cooldown = 4,
      range = range_worm_medium,--defined in spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_medium,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_medium, scale_worm_medium * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-medium",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.3,
    autoplace = enemy_autoplace.enemy_worm_autoplace(2),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 3,
        spawn_min_radius = 0,
        spawn_max_radius = 3
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      }
    }
  },

  {
    type = "turret",
    name = "big-worm-turret",
    icon = "__base__/graphics/icons/big-worm.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 750,
    order="b-c-c",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "big-worm-corpse",
    dying_explosion = "big-worm-die",
    dying_sound = sounds.worm_dying(0.7),
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(scale_worm_big, tint_worm_big),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(scale_worm_big, tint_worm_big, "forward"),
    preparing_sound = sounds.worm_standup(1),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(scale_worm_big, tint_worm_big),
    prepared_sound = sounds.worm_breath_big(1),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_big, tint_worm_big),
    prepared_alternative_sound = sounds.worm_roar_alternative_big(0.72),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_big, tint_worm_big),
    starting_attack_sound = sounds.worm_roars_big(0.67),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(scale_worm_big, tint_worm_big),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(scale_worm_big, tint_worm_big, "backward"),
    folding_sound = sounds.worm_fold(1),
    integration = worm_integration(scale_worm_big),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_big + prepare_range_worm_big,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      damage_modifier = damage_modifier_worm_big,--defined in spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_big,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_big, scale_worm_big * scale_worm_stream),

      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-big",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.5,
    autoplace = enemy_autoplace.enemy_worm_autoplace(5),
    call_for_help_radius = 40,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 3
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      }
    }
  },
  {
    type = "turret",
    name = "behemoth-worm-turret",
    icon = "__base__/graphics/icons/behemoth-worm.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 750,
    order="b-c-d",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    damaged_trigger_effect = hit_effects.biter(),
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "behemoth-worm-corpse",
    dying_explosion = "behemoth-worm-die",
    dying_sound = sounds.worm_dying_big(0.72),
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(scale_worm_behemoth, tint_worm_behemoth),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(scale_worm_behemoth, tint_worm_behemoth, "forward"),
    preparing_sound = sounds.worm_standup(1),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(scale_worm_behemoth, tint_worm_behemoth),
    prepared_sound = sounds.worm_breath_big(1),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(scale_worm_behemoth, tint_worm_behemoth),
    prepared_alternative_sound = sounds.worm_roar_alternative_big(0.87),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(scale_worm_behemoth, tint_worm_behemoth),
    starting_attack_sound = sounds.worm_roars_big(0.81),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(scale_worm_behemoth, tint_worm_behemoth),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(scale_worm_behemoth, tint_worm_behemoth, "backward"),
    folding_sound = sounds.worm_fold(1),
    integration = worm_integration(scale_worm_behemoth),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_behemoth + prepare_range_worm_behemoth,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "biological",
      damage_modifier = damage_modifier_worm_behemoth,--defined in spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_behemoth,--defined in spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_behemoth, scale_worm_behemoth * scale_worm_stream),
      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-behemoth",
            source_offset = {0.15, -0.5}
          }
        }
      }
    },
    build_base_evolution_requirement = 0.9,
    autoplace = enemy_autoplace.enemy_worm_autoplace(8),
    call_for_help_radius = 80,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "worms-decal",
        spawn_min = 1,
        spawn_max = 3,
        spawn_min_radius = 1,
        spawn_max_radius = 5
      },
      {
        decorative = "shroom-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 1,
        spawn_max_radius = 2
      },
      {
        decorative = "enemy-decal",
        spawn_min = 1,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 1,
        spawn_max_radius = 4
      }
    }
  },
  {
    type = "corpse",
    name = "medium-worm-corpse",
    icon = "__base__/graphics/icons/medium-worm-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-b[medium]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "lower-object-above-shadow",
    animation = worm_die_animation(scale_worm_medium, tint_worm_medium),
    ground_patch =
    {
      sheet = worm_integration(scale_worm_medium)
    }
  },
  {
    type = "corpse",
    name = "big-worm-corpse",
    icon = "__base__/graphics/icons/big-worm-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "lower-object-above-shadow",
    animation = worm_die_animation(scale_worm_big, tint_worm_big),
    ground_patch =
    {
      sheet = worm_integration(scale_worm_big)
    }
  },
  {
    type = "corpse",
    name = "behemoth-worm-corpse",
    icon = "__base__/graphics/icons/behemoth-worm-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-d[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "lower-object-above-shadow",
    animation = worm_die_animation(scale_worm_behemoth, tint_worm_behemoth),
    ground_patch =
    {
      sheet = worm_integration(scale_worm_behemoth)
    }
  }
}
)

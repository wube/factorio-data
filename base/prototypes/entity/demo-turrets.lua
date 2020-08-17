require ("prototypes.entity.demo-spitter-projectiles")
require ("prototypes.entity.demo-worm-animations")
enemy_autoplace = require ("prototypes.entity.demo-enemy-autoplace-utils")
local hit_effects = require ("prototypes.entity.demo-hit-effects")
local sounds = require("prototypes.entity.demo-sounds")
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
        frame_count = inputs.frame_count and inputs.frame_count or 2,
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
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-2.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-3.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-mask-4.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          }
        },
        scale = 0.5
      }
    },
    {
      width = 126,
      height = 62,
      frame_count = inputs.frame_count and inputs.frame_count or 2,
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
        frame_count = inputs.frame_count and inputs.frame_count or 2,
        axially_symmetrical = false,
        direction_count = 64,
        shift = util.by_pixel(22, 2.5),
        draw_as_shadow = true,
        stripes =
        {
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-1.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-2.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-3.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/gun-turret/hr-gun-turret-shooting-shadow-4.png",
            width_in_frames = inputs.frame_count and inputs.frame_count or 2,
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
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    shift = util.by_pixel(0, -32),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-raising.png",
      priority = "medium",
      width = 130,
      height = 126,
      frame_count = inputs.frame_count and inputs.frame_count or 15,
      line_length = inputs.line_length and inputs.line_length or 0,
      run_mode = inputs.run_mode and inputs.run_mode or "forward",
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
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 4,
    draw_as_shadow = true,
    shift = util.by_pixel(47, 3),
    hr_version =
    {
      filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-raising-shadow.png",
      width = 182,
      height = 96,
      frame_count = inputs.frame_count and inputs.frame_count or 15,
      line_length = inputs.line_length and inputs.line_length or 0,
      run_mode = inputs.run_mode and inputs.run_mode or "forward",
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
    frame_count = inputs.frame_count and inputs.frame_count or 15,
    line_length = inputs.line_length and inputs.line_length or 0,
    run_mode = inputs.run_mode and inputs.run_mode or "forward",
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
      frame_count = inputs.frame_count and inputs.frame_count or 15,
      line_length = inputs.line_length and inputs.line_length or 0,
      run_mode = inputs.run_mode and inputs.run_mode or "forward",
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
      range = range_worm_small,--defined in demo-spitter-projectiles.lua
      damage_modifier = damage_modifier_worm_small,--defined in demo-spitter-projectiles.lua
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
          },
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
        spawn_max_radius = 1,
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 2,
        spawn_max = 4,
        spawn_min_radius = 1,
        spawn_max_radius = 2,
      },
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
      sound = sounds.gun_turret_gunshot,
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
        scale = 5,
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
        category = "laser-turret",
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
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false
    }
  }
}
)


data:extend(
{
  {
    type = "unit",
    name = "medium-biter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 75,
    order="b-b-b",
    resistances = 
    {
      {
        type = "physical",
        decrease = 4,
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(15),
      range = 1,
      cooldown = 35,
      animation =
      {
        frame_width = 200,
        frame_height = 132,
        frame_count = 11,
        direction_count = 16,
        axially_symmetrical = false,
        shift = {1.25719, -0.464063},
        stripes =
        {
          {
            filename = "__base__/graphics/entity/medium-biter/medium-biter-attack-1.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/medium-biter/medium-biter-attack-2.png",
            width_in_frames = 5,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/medium-biter/medium-biter-attack-3.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/medium-biter/medium-biter-attack-4.png",
            width_in_frames = 5,
            height_in_frames = 8
          }
        }
      }
    },
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "medium-biter-corpse",
    dying_sound =
    {
      {
        filename = "__base__/sound/creeper-death-1.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-2.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-3.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-4.wav",
        volume = 0.7
      }
    },
    run_animation =
    {
      filename = "__base__/graphics/entity/medium-biter/medium-biter-run.png",
      still_frame = 4,
      frame_width = 122,
      frame_height = 84,
      frame_count = 16,
      direction_count = 16,
      axially_symmetrical = false,
      shift = {0.514688, -0.219375},
    }
  },

  {
    type = "unit",
    name = "big-biter",
    order="b-b-c",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 375,
    resistances = 
    {
      {
        type = "physical",
        decrease = 8,
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.6, -0.8}, {0.6, 0}},
    distraction_cooldown = 300,
    attack_parameters =
    {
      range = 1.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(30),
      animation =
      {
        frame_width = 279,
        frame_height = 184,
        frame_count = 11,
        direction_count = 16,
        axially_symmetrical = false,
        shift = {1.74609, -0.644531},
        stripes =
        {
          {
            filename = "__base__/graphics/entity/big-biter/big-biter-attack-1.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/big-biter/big-biter-attack-2.png",
            width_in_frames = 5,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/big-biter/big-biter-attack-3.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = "__base__/graphics/entity/big-biter/big-biter-attack-4.png",
            width_in_frames = 5,
            height_in_frames = 8
          }
        },
      },
    },
    vision_distance = 30,
    movement_speed = 0.17,
    distance_per_frame = 0.2,
    -- in pu
    pollution_to_join_attack = 1000,
    corpse = "big-biter-corpse",
    dying_sound =
    {
      {
        filename = "__base__/sound/creeper-death-1.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-2.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-3.wav",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creeper-death-4.wav",
        volume = 0.7
      }
    },
    run_animation =
    {
      still_frame = 4,
      frame_width = 169,
      frame_height = 117,
      frame_count = 16,
      direction_count = 16,
      axially_symmetrical = false,
      shift = {0.714844, -0.304688},
      stripes =
      {
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-run-1.png",
          width_in_frames = 8,
          height_in_frames = 16
        },
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-run-2.png",
          width_in_frames = 8,
          height_in_frames = 16
        }
      },
    }
  },
  {
    type = "corpse",
    name = "medium-biter-corpse",
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    order="b-c-b",
    dying_speed = 0.04,
    final_render_layer = "corpse",
    animation =
    {
      frame_width = 204,
      frame_height = 138,
      frame_count = 17,
      direction_count = 16,
      axially_symetric = false,
      shift = {0.4725, -0.118125},
      stripes =
      {
        {
          filename = "__base__/graphics/entity/medium-biter/medium-biter-die-1.png",
          width_in_frames = 9,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/medium-biter/medium-biter-die-2.png",
          width_in_frames = 8,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/medium-biter/medium-biter-die-3.png",
          width_in_frames = 9,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/medium-biter/medium-biter-die-4.png",
          width_in_frames = 8,
          height_in_frames = 8
        }
      },
    }
  },
  {
    type = "corpse",
    name = "big-biter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    order="b-c-c",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    dying_speed = 0.04,
    final_render_layer = "corpse",
    animation =
    {
      frame_width = 284,
      frame_height = 192,
      frame_count = 17,
      direction_count = 16,
      axially_symmetrical = false,
      shift = {0.65625, -0.164062},
      stripes =
      {
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-die-1.png",
          width_in_frames = 6,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-die-2.png",
          width_in_frames = 6,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-die-3.png",
          width_in_frames = 5,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-die-4.png",
          width_in_frames = 6,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-die-5.png",
          width_in_frames = 6,
          height_in_frames = 8
        },
        {
          filename = "__base__/graphics/entity/big-biter/big-biter-die-6.png",
          width_in_frames = 5,
          height_in_frames = 8
        }
      },
    }
  }
})

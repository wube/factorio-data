function hr_crash_site_assembling_machine_1_ground()
  return
  {
    filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-ground.png",
    priority="high",
    width = 208,
    height = 116,
    shift = util.by_pixel(-24, 12),
    frame_count = 1,
    line_length = 1,
    hr_version =
    {
      filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-ground.png",
      priority="high",
      width = 446,
      height = 234,
      shift = util.by_pixel(-31, 12),
      frame_count = 1,
      line_length = 1,
      scale = 0.5
    }
  }
end


function hr_crash_site_assembling_machine_2_ground()
  return
  {
    filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-ground.png",
    priority="high",
    width = 146,
    height = 106,
    shift = util.by_pixel(-8, -4),
    frame_count = 1,
    line_length = 1,
    hr_version =
    {
      filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-ground.png",
      priority="high",
      width = 290,
      height = 238,
      shift = util.by_pixel(-8, -10),
      frame_count = 1,
      line_length = 1,
      scale = 0.5
    }
  }
end


function hr_crash_site_lab_ground()
  return
  {
    filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-ground.png",
    priority="high",
    width = 352,
    height = 170,
    shift = util.by_pixel(-48, 12),
    frame_count = 1,
    line_length = 1,
    hr_version =
    {
      filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-ground.png",
      priority="high",
      width = 700,
      height = 344,
      shift = util.by_pixel(-49, 11),
      frame_count = 1,
      line_length = 1,
      scale = 0.5
    }
  }
end


data:extend(
{
  {
    type = "simple-entity",
    name = "crash-site-lab-broken",
    icon = "__base__/graphics/icons/crash-site-lab-broken.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "hidden"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.2, -1.2}, {2.2, 1.2}},
    selection_box = {{-2.5, -1.5}, {2.5, 1.5}},
    --light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_lab_ground(),

    animations =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-broken.png",
          width = 236,
          height = 140,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1 / 3,
          shift = util.by_pixel(-24, 6),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-broken.png",
            width = 472,
            height = 280,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-24, 6),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-broken-shadow.png",
          width = 270,
          height = 150,
          frame_count = 1,
          line_length = 1,
          repeat_count = 1,
          animation_speed = 1 / 3,
          shift = util.by_pixel(-16, 10),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-broken-shadow.png",
            width = 550,
            height = 304,
            frame_count = 1,
            line_length = 1,
            repeat_count = 1,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-14, 9),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      }
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },-- broken
  {
    type = "lab",
    name = "crash-site-lab-repaired",
    icon = "__base__/graphics/icons/crash-site-lab-repaired.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "hidden"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.2, -1.2}, {2.2, 1.2}},
    selection_box = {{-2.5, -1.5}, {2.5, 1.5}},
    entity_info_icon_shift = util.by_pixel(32, 0),
    light = {intensity = 0.9, size = 12, color = {r = 1.0, g = 1.0, b = 1.0}, shift = {1.5, 0.5}},
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_lab_ground(),

    on_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-repaired.png",
          width = 244,
          height = 126,
          frame_count = 1,
          line_length = 1,
          repeat_count = 24,
          animation_speed = 1 / 3,
          shift = util.by_pixel(-18, 14),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired.png",
            width = 488,
            height = 252,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-18, 14),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-repaired-beams.png",
          width = 68,
          height = 50,
          frame_count = 24,
          line_length = 6,
          animation_speed = 1 / 3,
          shift = util.by_pixel(36, -20),
          blend_mode = "additive",
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired-beams.png",
            width = 130,
            height = 100,
            frame_count = 24,
            line_length = 6,
            animation_speed = 1 / 3,
            shift = util.by_pixel(37, -20),
            blend_mode = "additive",
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-repaired-shadow.png",
          width = 350,
          height = 148,
          frame_count = 1,
          line_length = 1,
          repeat_count = 24,
          animation_speed = 1 / 3,
          shift = util.by_pixel(-12, 12),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired-shadow.png",
            width = 696,
            height = 302,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-11, 12),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      }
    },
    off_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-repaired.png",
          width = 244,
          height = 126,
          frame_count = 1,
          line_length = 1,
          repeat_count = 24,
          animation_speed = 1 / 3,
          shift = util.by_pixel(-18, 14),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired.png",
            width = 488,
            height = 252,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-18, 14),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-lab/crash-site-lab-repaired-shadow.png",
          width = 350,
          height = 148,
          frame_count = 1,
          line_length = 1,
          repeat_count = 24,
          animation_speed = 1 / 3,
          shift = util.by_pixel(-12, 12),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired-shadow.png",
            width = 696,
            height = 302,
            frame_count = 1,
            line_length = 1,
            repeat_count = 24,
            animation_speed = 1 / 3,
            shift = util.by_pixel(-11, 12),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      }
    },
    working_sound =
    {
      sound =
      {
          filename = "__base__/sound/lab.ogg",
          volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 4
    },
    energy_usage = "60kW",
    researching_speed = 1,
    inputs = { "automation-science-pack" }
  },-- repaired
})-- lab

crash_site_assembling_machine_1_animation_speed = 2
crash_site_assembling_machine_2_animation_speed = 2/3

data:extend(
{
  {
    type = "simple-entity",
    name = "crash-site-assembling-machine-1-broken",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-1-broken.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "hidden"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -0.7}, {1.2, 0.7}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    alert_icon_shift = util.by_pixel(-3, -12),
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_assembling_machine_1_ground(),

    animations =
    {
      layers =
      {
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-broken.png",
            priority="high",
            width = 166,
            height = 108,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 14),
            hr_version =
            {
              filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-broken.png",
              priority="high",
              width = 330,
              height = 216,
              frame_count = 1,
              line_length = 1,
              shift = util.by_pixel(1, 14),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-broken-shadow.png",
            priority="high",
            width = 144,
            height = 92,
            frame_count = 1,
            line_length = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(8, 18),
            hr_version =
            {
              filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-broken-shadow.png",
              priority="high",
              width = 290,
              height = 190,
              frame_count = 1,
              line_length = 1,
              draw_as_shadow = true,
              shift = util.by_pixel(10, 16),
              scale = 0.5
            }
          }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },-- rotation 1 broken
  {
    type = "assembling-machine",
    name = "crash-site-assembling-machine-1-repaired",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-1-repaired.png",
    icon_size = 32,
    flags = {"hidden", "not-rotatable"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -0.7}, {1.2, 0.7}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    alert_icon_shift = util.by_pixel(-3, -12),
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_assembling_machine_1_ground(),

    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-repaired.png",
          priority="high",
          width = 142,
          height = 92,
          frame_count = 20,
          line_length = 5,
          shift = util.by_pixel(-12, 2),
          animation_speed = crash_site_assembling_machine_1_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-repaired.png",
            priority="high",
            width = 282,
            height = 182,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(-12, 3),
            animation_speed = crash_site_assembling_machine_1_animation_speed,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-repaired-shadow.png",
          priority="high",
          width = 140,
          height = 84,
          frame_count = 20,
          line_length = 5,
          draw_as_shadow = true,
          shift = util.by_pixel(4, 6),
          animation_speed = crash_site_assembling_machine_1_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-repaired-shadow.png",
            priority="high",
            width = 278,
            height = 168,
            frame_count = 20,
            line_length = 5,
            draw_as_shadow = true,
            shift = util.by_pixel(4, 6),
            animation_speed = crash_site_assembling_machine_1_animation_speed,
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
      animation =
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-repaired-light.png",
          priority="high",
          width = 78,
          height = 64,
          frame_count = 20,
          line_length = 5,
          shift = util.by_pixel(10, -10),
          blend_mode = "additive",
          animation_speed = crash_site_assembling_machine_1_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-repaired-light.png",
            priority="high",
            width = 162,
            height = 120,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(12, -8),
            blend_mode = "additive",
            animation_speed = crash_site_assembling_machine_1_animation_speed,
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
    crafting_speed = 0.3,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4
    },
    energy_usage = "90kW",
    ingredient_count = 2,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    }
  },-- rotation 1 repaired
  {
    type = "simple-entity",
    name = "crash-site-assembling-machine-2-broken",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-2-broken.png",
    icon_size = 32,
    flags = {"hidden", "not-rotatable"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    selection_box = {{-1, -1.5}, {1, 1.5}},
    alert_icon_shift = util.by_pixel(-3, -12),
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_assembling_machine_2_ground(),

    animations =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-broken.png",
          priority="high",
          width = 136,
          height = 104,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(-8, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-broken.png",
            priority="high",
            width = 266,
            height = 208,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(-7, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-broken-shadow.png",
          priority="high",
          width = 146,
          height = 96,
          frame_count = 1,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(-2, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-broken-shadow.png",
            priority="high",
            width = 296,
            height = 190,
            frame_count = 1,
            line_length = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(-3, 2),
            scale = 0.5
          }
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },-- rotation 2 broken
  {
    type = "assembling-machine",
    name = "crash-site-assembling-machine-2-repaired",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-2-repaired.png",
    icon_size = 32,
    flags = {"hidden", "not-rotatable"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    selection_box = {{-1, -1.5}, {1, 1.5}},
    alert_icon_shift = util.by_pixel(-3, -12),
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_assembling_machine_2_ground(),

    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-repaired.png",
          priority="high",
          width = 100,
          height = 98,
          frame_count = 20,
          line_length = 5,
          shift = util.by_pixel(-4, -10),
          animation_speed = crash_site_assembling_machine_2_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired.png",
            priority="high",
            width = 198,
            height = 200,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(-4, -11),
            animation_speed = crash_site_assembling_machine_2_animation_speed,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-repaired-shadow.png",
          priority="high",
          width = 106,
          height = 86,
          frame_count = 20,
          line_length = 5,
          draw_as_shadow = true,
          shift = util.by_pixel(2, -8),
          animation_speed = crash_site_assembling_machine_2_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired-shadow.png",
            priority="high",
            width = 208,
            height = 174,
            frame_count = 20,
            line_length = 5,
            draw_as_shadow = true,
            shift = util.by_pixel(3, -9),
            animation_speed = crash_site_assembling_machine_2_animation_speed,
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
      animation =
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-repaired-light.png",
          priority="high",
          width = 84,
          height = 62,
          frame_count = 20,
          line_length = 5,
          shift = util.by_pixel(-8, -6),
          blend_mode = "additive",
          animation_speed = crash_site_assembling_machine_2_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired-light.png",
            priority="high",
            width = 174,
            height = 124,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(-7, -4),
            blend_mode = "additive",
            animation_speed = crash_site_assembling_machine_2_animation_speed,
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4
    },
    energy_usage = "90kW",
    ingredient_count = 2,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    }
  },-- rotation 2 repaired
})-- assembling-machine

crash_site_generator_animation_speed = 1/3

data:extend(
{
  {
    type = "electric-pole",
    name = "crash-site-electric-pole",
    icon = "__base__/graphics/icons/crash-site-electric-pole.png",
    icon_size = 32,
    flags = {"placeable-neutral","placeable-off-grid"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{0, 0}, {0, 0}},
    drawing_box = {{-0.5, -2.6}, {0.5, 0.5}},
    maximum_wire_distance = 7.5,
    selectable_in_game = false,
    order="a",
    supply_area_distance = 1,
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-generator/crash-site-electric-pole.png",
          width = 4,
          height= 4,
          direction_count = 1,
        },
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel(140, -2),
          red = util.by_pixel(126, 0),
          green = util.by_pixel(135, -9)
        },
        wire =
        {
          green = util.by_pixel(32, -82),
          red = util.by_pixel(28, -74),
          copper = util.by_pixel(40, -73),
        }
      },
    }
  },--crash-site-pole
  {
    type = "electric-energy-interface",
    name = "crash-site-generator",
    icon = "__base__/graphics/icons/crash-site-generator.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "hidden", "not-rotatable"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 150,
    corpse = "medium-remnants",
    --subgroup = "other",
    collision_box = {{-1.5, -0.9}, {0.9, 0.9}},
    selection_box = {{-1.5, -0.9}, {0.9, 0.9}},
    allow_copy_paste = false,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "tertiary",
      input_flow_limit = "0kW",
      output_flow_limit = "500GW"
    },

    energy_production = "500GW",
    energy_usage = "0kW",
    light = {intensity = 0.75, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}, shift = {64/64, -140/64}},
    continuous_animation = true,
    integration_patch_render_layer = "decals",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    integration_patch = {
      filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator-ground.png",
      priority="high",
      width = 192,
      height = 180,
      shift = util.by_pixel(-28, -38),
      frame_count = 1,
      line_length = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator-ground.png",
        priority="high",
        width = 384,
        height = 360,
        shift = util.by_pixel(-28, -38),
        frame_count = 1,
        line_length = 1,
        scale = 0.5
      }
    },

    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator.png",
          width = 142,
          height= 128,
          frame_count = 5,
          line_length = 5,
          repeat_count = 16,
          shift = util.by_pixel(-10, -24),
          animation_speed = crash_site_generator_animation_speed,
          hr_version = {
            filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator.png",
            width = 286,
            height= 252,
            frame_count = 5,
            line_length = 5,
            repeat_count = 16,
            animation_speed = crash_site_generator_animation_speed,
            shift = util.by_pixel(-11, -23),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator-beams.png",
          width = 48,
          height= 116,
          frame_count = 16,
          line_length = 4,
          repeat_count = 5,
          shift = util.by_pixel(24, -30),
          animation_speed = crash_site_generator_animation_speed,
          hr_version = {
            filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator-beams.png",
            width = 224,
            height= 232,
            frame_count = 16,
            line_length = 4,
            repeat_count = 5,
            animation_speed = crash_site_generator_animation_speed,
            shift = util.by_pixel(-8, -30),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator-shadow.png",
          width = 236,
          height= 78,
          frame_count = 1,
          line_length = 1,
          repeat_count = 80,
          shift = util.by_pixel(26, 4),
          draw_as_shadow = true,
          animation_speed = crash_site_generator_animation_speed,
          hr_version = {
            filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator-shadow.png",
            width = 474,
            height= 152,
            frame_count = 1,
            line_length = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            shift = util.by_pixel(25, 5),
            animation_speed = crash_site_generator_animation_speed,
            scale = 0.5
          }
        },
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound =
      {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    }
  },

  { -- crash site chest 1
    type = "container",
    name = "crash-site-chest-1",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    max_health = 350,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    integration_patch = {
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-ground.png",
      priority="high",
      width = 111,
      height = 73,
      shift = util.by_pixel(-6, 12),
      frame_count = 1,
      line_length = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-1-ground.png",
        priority="high",
        width = 220,
        height = 148,
        shift = util.by_pixel(-6, 12),
        frame_count = 1,
        line_length = 1,
        scale = 0.5
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1.png",
          priority = "extra-high",
          width = 61,
          height = 39,
          shift = util.by_pixel(2, 8),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-1.png",
            priority = "extra-high",
            width = 120,
            height = 76,
            shift = util.by_pixel(2, 8),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-shadow.png",
          priority = "extra-high",
          width = 99,
          height = 67,
          shift = util.by_pixel(-8, 2),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-1-shadow.png",
            priority = "extra-high",
            width = 210,
            height = 128,
            shift = util.by_pixel(-2, 3),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  { -- crash site chest 2
    type = "container",
    name = "crash-site-chest-2",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    max_health = 350,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    integration_patch = {
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-ground.png",
      priority="high",
      width = 111,
      height = 95,
      shift = util.by_pixel(-12, 4),
      frame_count = 1,
      line_length = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-2-ground.png",
        priority="high",
        width = 218,
        height = 186,
        shift = util.by_pixel(-10, 5),
        frame_count = 1,
        line_length = 1,
        scale = 0.5
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2.png",
          priority = "extra-high",
          width = 59,
          height = 45,
          shift = util.by_pixel(0, 8),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-2.png",
            priority = "extra-high",
            width = 116,
            height = 88,
            shift = util.by_pixel(0, 8),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-shadow.png",
          priority = "extra-high",
          width = 95,
          height = 65,
          shift = util.by_pixel(0, 4),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-2-shadow.png",
            priority = "extra-high",
            width = 188,
            height = 126,
            shift = util.by_pixel(0, 5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})

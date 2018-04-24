require ("prototypes.entity.demo-worm-animations")
require ("prototypes.entity.demo-enemy-sounds")
require ("prototypes.entity.demo-pipecovers")
require ("prototypes.entity.assemblerpipes")
require "util"
require ("prototypes.entity.demo-enemy-autoplace-utils")

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
  shift = {-0.03125, -0.984375}
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
  shift = {1.375, 0},
}
end

function laser_turret_extension_mask(inputs)
return
{
  filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start-mask.png",
  flags = { "mask" },
  width = 51,
  height = 47,
  frame_count = inputs.frame_count and inputs.frame_count or 15,
  line_length = inputs.line_length and inputs.line_length or 0,
  run_mode = inputs.run_mode and inputs.run_mode or "forward",
  axially_symmetrical = false,
  apply_runtime_tint = true,
  direction_count = 4,
  shift = {-0.015625, -1.26563},
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
    type = "artillery-turret",
    name = "artillery-turret",
    icon = "__base__/graphics/icons/artillery-turret.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    inventory_size = 1,
    ammo_stack_limit = 15,
    automated_ammo_count = 5,
    alert_when_attacking = false,
    minable = {mining_time = 1, result = "artillery-turret"},
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 2000,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.45, -1.45}, {1.45, 1.45}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
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
        decrease = 10,
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
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-16.png",
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
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-16.png",
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
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-16.png",
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
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-16.png",
            }
          }
        },
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
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-16.png",
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
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-16.png",
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
            "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-16.png",
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
              "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-16.png",
            }
          }
        },
      }
    },
    cannon_base_shiftings =
    {
      util.by_pixel(0.0, 19.5),
      util.by_pixel(-1.5, 19.0),
      util.by_pixel(-3.5, 19.0),
      util.by_pixel(-5.5, 18.5),
      util.by_pixel(-7.5, 18.5),
      util.by_pixel(-9.0, 18.0),
      util.by_pixel(-11.0, 17.5),
      util.by_pixel(-13.0, 17.5),
      util.by_pixel(-15.0, 17.0),
      util.by_pixel(-16.5, 16.5),
      util.by_pixel(-18.5, 16.0),
      util.by_pixel(-20.5, 15.5),
      util.by_pixel(-22.0, 15.0),
      util.by_pixel(-24.0, 14.5),
      util.by_pixel(-25.5, 14.0),
      util.by_pixel(-27.5, 13.0),
      util.by_pixel(-29.0, 12.5),
      util.by_pixel(-30.5, 12.0),
      util.by_pixel(-32.0, 11.0),
      util.by_pixel(-34.0, 10.5),
      util.by_pixel(-35.5, 9.5),
      util.by_pixel(-37.0, 9.0),
      util.by_pixel(-38.5, 8.0),
      util.by_pixel(-40.0, 7.5),
      util.by_pixel(-41.5, 6.5),
      util.by_pixel(-42.5, 5.5),
      util.by_pixel(-44.0, 4.5),
      util.by_pixel(-45.5, 4.0),
      util.by_pixel(-46.5, 3.0),
      util.by_pixel(-48.0, 2.0),
      util.by_pixel(-49.0, 1.0),
      util.by_pixel(-50.5, 0.0),
      util.by_pixel(-51.5, -0.5),
      util.by_pixel(-52.5, -1.5),
      util.by_pixel(-53.5, -2.5),
      util.by_pixel(-54.5, -3.5),
      util.by_pixel(-55.5, -5.0),
      util.by_pixel(-56.5, -6.0),
      util.by_pixel(-57.5, -7.0),
      util.by_pixel(-58.0, -8.0),
      util.by_pixel(-59.0, -9.0),
      util.by_pixel(-60.0, -10.5),
      util.by_pixel(-60.5, -11.5),
      util.by_pixel(-61.0, -12.5),
      util.by_pixel(-62.0, -13.5),
      util.by_pixel(-62.5, -15.0),
      util.by_pixel(-63.0, -16.0),
      util.by_pixel(-63.5, -17.0),
      util.by_pixel(-64.0, -18.5),
      util.by_pixel(-64.5, -19.5),
      util.by_pixel(-65.0, -21.0),
      util.by_pixel(-65.0, -22.0),
      util.by_pixel(-65.5, -23.0),
      util.by_pixel(-65.5, -24.5),
      util.by_pixel(-66.0, -25.5),
      util.by_pixel(-66.0, -26.5),
      util.by_pixel(-66.0, -28.0),
      util.by_pixel(-66.5, -29.0),
      util.by_pixel(-66.5, -30.0),
      util.by_pixel(-66.5, -31.5),
      util.by_pixel(-66.5, -32.5),
      util.by_pixel(-66.0, -34.0),
      util.by_pixel(-66.0, -35.0),
      util.by_pixel(-66.0, -36.0),
      util.by_pixel(-65.5, -37.0),
      util.by_pixel(-66.0, -38.5),
      util.by_pixel(-66.0, -39.5),
      util.by_pixel(-66.5, -40.5),
      util.by_pixel(-66.5, -42.0),
      util.by_pixel(-66.5, -43.0),
      util.by_pixel(-66.5, -44.0),
      util.by_pixel(-66.5, -45.5),
      util.by_pixel(-66.5, -46.5),
      util.by_pixel(-66.5, -48.0),
      util.by_pixel(-66.0, -49.0),
      util.by_pixel(-66.0, -50.0),
      util.by_pixel(-65.5, -51.5),
      util.by_pixel(-65.5, -52.5),
      util.by_pixel(-65.0, -53.5),
      util.by_pixel(-64.5, -55.0),
      util.by_pixel(-64.5, -56.0),
      util.by_pixel(-64.0, -57.5),
      util.by_pixel(-63.5, -58.5),
      util.by_pixel(-63.0, -59.5),
      util.by_pixel(-62.5, -61.0),
      util.by_pixel(-61.5, -62.0),
      util.by_pixel(-61.0, -63.0),
      util.by_pixel(-60.5, -64.0),
      util.by_pixel(-59.5, -65.5),
      util.by_pixel(-59.0, -66.5),
      util.by_pixel(-58.0, -67.5),
      util.by_pixel(-57.0, -68.5),
      util.by_pixel(-56.0, -70.0),
      util.by_pixel(-55.0, -71.0),
      util.by_pixel(-54.0, -72.0),
      util.by_pixel(-53.0, -73.0),
      util.by_pixel(-52.0, -74.0),
      util.by_pixel(-51.0, -75.0),
      util.by_pixel(-50.0, -76.0),
      util.by_pixel(-48.5, -77.0),
      util.by_pixel(-47.5, -78.0),
      util.by_pixel(-46.0, -79.0),
      util.by_pixel(-45.0, -80.0),
      util.by_pixel(-43.5, -81.0),
      util.by_pixel(-42.0, -81.5),
      util.by_pixel(-40.5, -82.5),
      util.by_pixel(-39.5, -83.5),
      util.by_pixel(-38.0, -84.0),
      util.by_pixel(-36.5, -85.0),
      util.by_pixel(-34.5, -85.5),
      util.by_pixel(-33.0, -86.5),
      util.by_pixel(-31.5, -87.0),
      util.by_pixel(-30.0, -88.0),
      util.by_pixel(-28.5, -88.5),
      util.by_pixel(-26.5, -89.0),
      util.by_pixel(-25.0, -90.0),
      util.by_pixel(-23.0, -90.5),
      util.by_pixel(-21.5, -91.0),
      util.by_pixel(-19.5, -91.5),
      util.by_pixel(-17.5, -92.0),
      util.by_pixel(-16.0, -92.5),
      util.by_pixel(-14.0, -93.0),
      util.by_pixel(-12.0, -93.0),
      util.by_pixel(-10.5, -93.5),
      util.by_pixel(-8.5, -94.0),
      util.by_pixel(-6.5, -94.0),
      util.by_pixel(-4.5, -94.5),
      util.by_pixel(-2.5, -94.5),
      util.by_pixel(-0.5, -95.0),
      util.by_pixel(1.0, -95.0),
      util.by_pixel(3.0, -94.5),
      util.by_pixel(5.0, -94.5),
      util.by_pixel(7.0, -94.0),
      util.by_pixel(8.5, -94.0),
      util.by_pixel(10.5, -93.5),
      util.by_pixel(12.5, -93.0),
      util.by_pixel(14.5, -92.5),
      util.by_pixel(16.5, -92.5),
      util.by_pixel(18.0, -92.0),
      util.by_pixel(20.0, -91.5),
      util.by_pixel(21.5, -91.0),
      util.by_pixel(23.5, -90.5),
      util.by_pixel(25.0, -89.5),
      util.by_pixel(27.0, -89.0),
      util.by_pixel(28.5, -88.5),
      util.by_pixel(30.5, -88.0),
      util.by_pixel(32.0, -87.0),
      util.by_pixel(33.5, -86.5),
      util.by_pixel(35.0, -85.5),
      util.by_pixel(36.5, -85.0),
      util.by_pixel(38.0, -84.0),
      util.by_pixel(39.5, -83.5),
      util.by_pixel(41.0, -82.5),
      util.by_pixel(42.5, -81.5),
      util.by_pixel(44.0, -80.5),
      util.by_pixel(45.0, -80.0),
      util.by_pixel(46.5, -79.0),
      util.by_pixel(47.5, -78.0),
      util.by_pixel(49.0, -77.0),
      util.by_pixel(50.0, -76.0),
      util.by_pixel(51.5, -75.0),
      util.by_pixel(52.5, -74.0),
      util.by_pixel(53.5, -73.0),
      util.by_pixel(54.5, -72.0),
      util.by_pixel(55.5, -71.0),
      util.by_pixel(56.5, -70.0),
      util.by_pixel(57.5, -68.5),
      util.by_pixel(58.5, -67.5),
      util.by_pixel(59.0, -66.5),
      util.by_pixel(60.0, -65.5),
      util.by_pixel(60.5, -64.0),
      util.by_pixel(61.5, -63.0),
      util.by_pixel(62.0, -62.0),
      util.by_pixel(62.5, -61.0),
      util.by_pixel(63.0, -59.5),
      util.by_pixel(63.5, -58.5),
      util.by_pixel(64.0, -57.5),
      util.by_pixel(64.5, -56.0),
      util.by_pixel(65.0, -55.0),
      util.by_pixel(65.5, -53.5),
      util.by_pixel(65.5, -52.5),
      util.by_pixel(66.0, -51.5),
      util.by_pixel(66.5, -50.0),
      util.by_pixel(66.5, -49.0),
      util.by_pixel(66.5, -48.0),
      util.by_pixel(66.5, -46.5),
      util.by_pixel(67.0, -45.5),
      util.by_pixel(67.0, -44.0),
      util.by_pixel(67.0, -43.0),
      util.by_pixel(66.5, -42.0),
      util.by_pixel(66.5, -40.5),
      util.by_pixel(66.5, -39.5),
      util.by_pixel(66.5, -38.5),
      util.by_pixel(66.5, -37.5),
      util.by_pixel(66.5, -36.0),
      util.by_pixel(67.0, -35.0),
      util.by_pixel(67.0, -34.0),
      util.by_pixel(67.0, -32.5),
      util.by_pixel(67.0, -31.5),
      util.by_pixel(67.0, -30.5),
      util.by_pixel(67.0, -29.0),
      util.by_pixel(67.0, -28.0),
      util.by_pixel(67.0, -26.5),
      util.by_pixel(66.5, -25.5),
      util.by_pixel(66.5, -24.5),
      util.by_pixel(66.0, -23.0),
      util.by_pixel(66.0, -22.0),
      util.by_pixel(65.5, -20.5),
      util.by_pixel(65.0, -19.5),
      util.by_pixel(65.0, -18.5),
      util.by_pixel(64.5, -17.0),
      util.by_pixel(64.0, -16.0),
      util.by_pixel(63.0, -15.0),
      util.by_pixel(62.5, -13.5),
      util.by_pixel(62.0, -12.5),
      util.by_pixel(61.5, -11.5),
      util.by_pixel(60.5, -10.0),
      util.by_pixel(60.0, -9.0),
      util.by_pixel(59.0, -8.0),
      util.by_pixel(58.0, -7.0),
      util.by_pixel(57.5, -6.0),
      util.by_pixel(56.5, -4.5),
      util.by_pixel(55.5, -3.5),
      util.by_pixel(54.5, -2.5),
      util.by_pixel(53.5, -1.5),
      util.by_pixel(52.0, -0.5),
      util.by_pixel(51.0, 0.0),
      util.by_pixel(50.0, 1.0),
      util.by_pixel(48.5, 2.0),
      util.by_pixel(47.5, 3.0),
      util.by_pixel(46.0, 4.0),
      util.by_pixel(45.0, 5.0),
      util.by_pixel(43.5, 5.5),
      util.by_pixel(42.0, 6.5),
      util.by_pixel(40.5, 7.5),
      util.by_pixel(39.0, 8.0),
      util.by_pixel(37.5, 9.0),
      util.by_pixel(36.0, 10.0),
      util.by_pixel(34.5, 10.5),
      util.by_pixel(33.0, 11.5),
      util.by_pixel(31.5, 12.0),
      util.by_pixel(29.5, 12.5),
      util.by_pixel(28.0, 13.5),
      util.by_pixel(26.5, 14.0),
      util.by_pixel(24.5, 14.5),
      util.by_pixel(23.0, 15.0),
      util.by_pixel(21.0, 15.5),
      util.by_pixel(19.0, 16.0),
      util.by_pixel(17.5, 16.5),
      util.by_pixel(15.5, 17.0),
      util.by_pixel(13.5, 17.5),
      util.by_pixel(11.5, 18.0),
      util.by_pixel(10.0, 18.0),
      util.by_pixel(8.0, 18.5),
      util.by_pixel(6.0, 19.0),
      util.by_pixel(4.0, 19.0),
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
      { 0,       0,   0.25 },
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },
})



data:extend(
{
  {
    type = "turret",
    name = "medium-worm-turret",
    icon = "__base__/graphics/icons/medium-worm.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    order="b-b-e",
    subgroup="enemies",
    max_health = 400,
    resistances =
    {
      {
        type = "physical",
        decrease = 5,
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15,
      },
      {
        type = "fire",
        decrease = 2,
        percent = 50,
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
      cooldown = 60,
      range = 25,
      projectile_creation_distance = 1.9,
      damage_modifier = 4,
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
            starting_speed = 0.5,
            max_range = 40
          }
        }
      }
    },
    build_base_evolution_requirement = 0.3,
    autoplace = enemy_worm_autoplace(2),
    call_for_help_radius = 40
  },

  {
    type = "turret",
    name = "big-worm-turret",
    icon = "__base__/graphics/icons/big-worm.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    max_health = 750,
    order="b-b-f",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 10,
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30,
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70,
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
      cooldown = 60,
      range = 26,
      projectile_creation_distance = 2.1,
      damage_modifier = 5,
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
            starting_speed = 0.5,
            max_range = 50
          }
        }
      }
    },
    build_base_evolution_requirement = 0.5,
    autoplace = enemy_worm_autoplace(5),
    call_for_help_radius = 40
  },
  {
    type = "electric-turret",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 32,
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
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          shift = {-0.03125, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          flags = { "mask" },
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {-0.03125, -1.3125},
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
          shift = {1.5, 0}
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
          frame_count = 1,
          shift = {0.015625, 0.03125}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 54,
          height = 46,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          frame_count = 1,
          shift = {-0.046875, -0.109375},
        },
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      cooldown = 20,
      projectile_center = {-0.09375, -0.2},
      projectile_creation_distance = 1.4,
      range = 24,
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
                starting_speed = 0.35
              }
            }
          }
        }
      },
      sound = make_laser_sounds()
    },
    call_for_help_radius = 40
  },
  {
    type = "corpse",
    name = "medium-worm-corpse",
    icon = "__base__/graphics/icons/medium-worm-corpse.png",
    icon_size = 32,
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
    icon_size = 32,
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


local hit_effects = require ("prototypes.entity.demo-hit-effects")
local sounds = require("prototypes.entity.demo-sounds")

data:extend(
{
  {
    type = "mining-drill",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "pumpjack"},
    resource_categories = {"basic-fluid"},
    max_health = 200,
    corpse = "pumpjack-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_box = {{ -1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-1.6, -2.5}, {1.5, 1.6}},
    energy_source =
    {
      type = "electric",
      emissions_per_minute = 10,
      usage_priority = "secondary-input"
    },
    output_fluid_box =
    {
      base_area = 10,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          positions = { {1, -2}, {2, -1}, {-1, 2}, {-2, 1} }
        }
      }
    },
    energy_usage = "90kW",
    mining_speed = 1,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_specification =
    {
      module_slots = 2
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    base_render_layer = "lower-object-above-shadow",
    base_picture =
    {
      sheets =
      {
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
          priority = "extra-high",
          width = 131,
          height = 137,
          shift = util.by_pixel(-2.5, -4.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base.png",
            priority = "extra-high",
            width = 261,
            height = 273,
            shift = util.by_pixel(-2.25, -4.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 111,
          draw_as_shadow = true,
          shift = util.by_pixel(6, 0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base-shadow.png",
            width = 220,
            height = 220,
            scale = 0.5,
            draw_as_shadow = true,
            shift = util.by_pixel(6, 0.5)
          }
        }
      }
    },
    animations =
    {
      north =
      {
        layers =
        {
          {
            priority = "high",
            filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
            line_length = 8,
            width = 104,
            height = 102,
            frame_count = 40,
            shift = util.by_pixel(-4, -24),
            animation_speed = 0.5,
            hr_version =
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead.png",
              animation_speed = 0.5,
              scale = 0.5,
              line_length = 8,
              width = 206,
              height = 202,
              frame_count = 40,
              shift = util.by_pixel(-4, -24)
            }
          },
          {
            priority = "high",
            filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
            animation_speed = 0.5,
            draw_as_shadow = true,
            line_length = 8,
            width = 155,
            height = 41,
            frame_count = 40,
            shift = util.by_pixel(17.5, 14.5),
            hr_version =
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead-shadow.png",
              animation_speed = 0.5,
              draw_as_shadow = true,
              line_length = 8,
              width = 309,
              height = 82,
              frame_count = 40,
              scale = 0.5,
              shift = util.by_pixel(17.75, 14.5)
            }
          }
        }
      }
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/pumpjack.ogg",
          volume = 0.7
        },
        --{
        --  filename = "__base__/sound/pumpjack-1.ogg",
        --  volume = 0.43
        --}
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 10,
    },
    fast_replaceable_group = "pumpjack",

    circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
    circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
}
)


data:extend(
{
  {
    type = "mining-drill",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "pumpjack"},
    resource_categories = {"basic-fluid"},
    max_health = 100,
    corpse = "big-remnants",
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.6, -2.5}, {1.5, 1.6}},
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.15 / 1.5,
      usage_priority = "secondary-input"
    },
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          positions = { {1, -2}, {2, -1}, {-1, 2}, {-2, 1} }
        }
      },
    },
    energy_usage = "90kW",
    mining_speed = 1,
    mining_power = 2,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_slots = 2,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    base_picture =
    {
      sheet = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
      priority = "extra-high",
      width = 114,
      height = 113,
      shift = {0.1875, -0.03125}
    },
    animations =
    {
      north =
      {
        priority = "extra-high",
        frame_width = 116,
        frame_height = 110,
        line_length = 10,
        shift = {0.125, -0.71875},
        filename = "__base__/graphics/entity/pumpjack/pumpjack-animation.png",
        frame_count = 40,
        animation_speed = 0.5
      }
    }
  }
}
)

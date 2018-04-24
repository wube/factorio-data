data:extend(
{
  {
    type = "mining-drill",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "pumpjack"},
    resource_categories = {"basic-fluid"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{ -1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.6, -2.5}, {1.5, 1.6}},
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.15 / 1.5,
      usage_priority = "secondary-input"
    },
    output_fluid_box =
    {
      base_area = 1,
      base_level = 1,
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
    base_picture =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
        priority = "extra-high",
        width = 114,
        height = 113,
        shift = util.by_pixel(6, -0.5)
      }
    },
    animations =
    {
      north =
      {
        priority = "extra-high",
        width = 116,
        height = 110,
        line_length = 10,
        shift = util.by_pixel(4, -23),
        filename = "__base__/graphics/entity/pumpjack/pumpjack-animation.png",
        frame_count = 40,
        animation_speed = 0.5
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/pumpjack.ogg" },
      apparent_volume = 1.5,
    },
    fast_replaceable_group = "pumpjack",
    circuit_wire_connection_points =
    {
      get_circuit_connector_wire_shifting_for_connector({0.15625, -1.0625}, {0.15625, -1.0625}, 2),
      get_circuit_connector_wire_shifting_for_connector({0.15625, -1.0625}, {0.15625, -1.0625}, 2),
      get_circuit_connector_wire_shifting_for_connector({0.15625, -1.0625}, {0.15625, -1.0625}, 2),
      get_circuit_connector_wire_shifting_for_connector({0.15625, -1.0625}, {0.15625, -1.0625}, 2)
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({0.15625, -1.0625}, {0.15625, -1.0625}, 2),
      get_circuit_connector_sprites({0.15625, -1.0625}, {0.15625, -1.0625}, 2),
      get_circuit_connector_sprites({0.15625, -1.0625}, {0.15625, -1.0625}, 2),
      get_circuit_connector_sprites({0.15625, -1.0625}, {0.15625, -1.0625}, 2)
    },
    circuit_wire_max_distance = 9,
  }
}
)


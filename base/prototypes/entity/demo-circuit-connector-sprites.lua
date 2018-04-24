function get_circuit_connector_sprites(mainOffset, shadowOffset, connectorNumber)
  local logisticAnimationOffsets =
  {
    {-0.171875, -0.109375},
    {-0.109375, -0.015625},
    {0.015625, 0.015625},
    {0.140625, -0.015625},
    {0.203125, -0.109375},
    {0.140625, -0.203125},
    {0.015625, -0.234375},
    {-0.109375, -0.203125},
    {-0.234375, -0.015625},
    {-0.171875, 0.109375},
    {0.015625, 0.140625},
    {0.203125, 0.078125},
    {0.265625, -0.046875},
    {0.203125, -0.171875},
    {0.015625, -0.234375},
    {-0.203125, -0.203125},
    {-0.265625, 0.046875},
    {-0.171875, 0.171875},
    {0.015625, 0.234375},
    {0.171875, 0.171875},
    {0.265625, 0.046875},
    {0.171875, -0.109375},
    {-0.015625, -0.171875},
    {-0.203125, -0.078125},
    {-0.203125, 0.140625},
    {-0.140625, 0.234375},
    {0.015625, 0.265625},
    {0.140625, 0.234375},
    {0.203125, 0.140625},
    {0.109375, -0.140625},
    {-0.015625, -0.203125},
    {-0.140625, -0.078125},
  };
  local result =
  {
    connector_main =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-main.png",
      priority = "low",
      width = 28,
      height = 27,
      x = 28*(connectorNumber%8),
      y = 27*(math.floor(connectorNumber/8)),
      shift = {0 + mainOffset[1], 0.015625 + mainOffset[2]},
    },
    led_red =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-led-red.png",
      priority = "low",
      width = 20,
      height = 16,
      x = 20*(connectorNumber%8),
      y = 16*(math.floor(connectorNumber/8)),
      shift = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
    },
    led_green =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-led-green.png",
      priority = "low",
      width = 20,
      height = 16,
      x = 20*(connectorNumber%8),
      y = 16*(math.floor(connectorNumber/8)),
      shift = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
    },
    led_blue =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-led-blue.png",
      priority = "low",
      width = 21,
      height = 22,
      x = 21*(connectorNumber%8),
      y = 22*(math.floor(connectorNumber/8)),
      shift = {-0.015625 + mainOffset[1], 0 + mainOffset[2]},
    },

    logistic_animation =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-logistic-animation.png",
      priority = "low",
      blend_mode = "additive",
      line_length = 4,
      width = 43,
      height = 43,
      frame_count = 15,
      animation_speed = 0.5,
      shift = {0.015625 + logisticAnimationOffsets[connectorNumber+1][1] + mainOffset[1], -0.234375 + logisticAnimationOffsets[connectorNumber+1][2] + mainOffset[2]},
    },

    led_light =
    {
      intensity = 0.8,
      size = 0.9,
    },

    blue_led_light_offset = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
    red_green_led_light_offset = {0 + mainOffset[1], -0.15625 + mainOffset[2]},
  };

  if (not (shadowOffset == nil)) then
    result.connector_shadow =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-shadow.png",
      priority = "low",
      flags = { "shadow" },
      width = 34,
      height = 26,
      x = 34*(connectorNumber%8),
      y = 26*(math.floor(connectorNumber/8)),
      shift = {0.125 + shadowOffset[1], 0.09375 + shadowOffset[2]},
    };
  end
  return result;
end

function get_circuit_connector_wire_shifting_for_connector(mainOffset, shadowOffset, connectorNumber)
  local redWireOffsets =
  {
    {-0.046875, 0.109375},
    {0.140625, 0.046875},
    {0.265625, -0.078125},
    {0.203125, -0.203125},
    {0.046875, -0.296875},
    {-0.171875, -0.234375},
    {-0.265625, -0.109375},
    {-0.203125, 0.015625},
    {-0.109375, 0.109375},
    {0.078125, 0.078125},
    {0.265625, 0.015625},
    {0.265625, -0.140625},
    {0.109375, -0.265625},
    {-0.109375, -0.265625},
    {-0.234375, -0.140625},
    {-0.203125, 0.015625},
    {-0.109375, 0.171875},
    {0.109375, 0.171875},
    {0.234375, 0.078125},
    {0.265625, -0.078125},
    {0.140625, -0.203125},
    {-0.109375, -0.203125},
    {-0.234375, -0.078125},
    {-0.265625, 0.015625},
    {-0.109375, 0.203125},
    {0.078125, 0.203125},
    {0.234375, 0.109375},
    {0.265625, -0.046875},
    {0.109375, -0.171875},
    {-0.109375, -0.171875},
    {-0.265625, -0.046875},
    {-0.234375, 0.140625},
  }
  local greenWireOffsets =
  {
    {-0.203125, 0.109375},
    {0.046875, 0.109375},
    {0.265625, 0.046875},
    {0.328125, -0.109375},
    {0.203125, -0.296875},
    {-0.046875, -0.328125},
    {-0.265625, -0.234375},
    {-0.328125, -0.078125},
    {-0.234375, 0.171875},
    {-0.015625, 0.203125},
    {0.265625, 0.171875},
    {0.359375, -0.015625},
    {0.234375, -0.203125},
    {0.015625, -0.296875},
    {-0.234375, -0.078125},
    {-0.359375, 0.015625},
    {-0.203125, 0.265625},
    {0.046875, 0.328125},
    {0.234375, 0.234375},
    {0.328125, 0.078125},
    {0.234375, -0.109375},
    {-0.015625, -0.234375},
    {-0.265625, -0.015625},
    {-0.359375, 0.109375},
    {-0.109375, 0.328125},
    {0.078125, 0.328125},
    {0.234375, 0.234375},
    {0.265625, 0.109375},
    {0.171875, -0.046875},
    {-0.109375, -0.046875},
    {-0.265625, 0.078125},
    {-0.234375, 0.265625},
  }
  local redShadowOffsets =
  {
    {0.046875, 0.203125},
    {0.265625, 0.140625},
    {0.390625, 0.046875},
    {0.359375, -0.109375},
    {0.171875, -0.171875},
    {-0.078125, -0.140625},
    {-0.171875, -0.015625},
    {-0.109375, 0.140625},
    {0.140625, 0.296875},
    {0.328125, 0.296875},
    {0.484375, 0.203125},
    {0.484375, 0.046875},
    {0.359375, -0.078125},
    {0.046875, -0.078125},
    {-0.140625, -0.046875},
    {0.109375, 0.265625},
    {0.171875, 0.359375},
    {0.359375, 0.390625},
    {0.546875, 0.296875},
    {0.453125, 0.109375},
    {0.359375, 0.015625},
    {0.078125, -0.015625},
    {-0.140625, 0.015625},
    {-0.015625, 0.296875},
    {0.171875, 0.421875},
    {0.390625, 0.421875},
    {0.546875, 0.265625},
    {0.515625, 0.140625},
    {0.328125, 0.046875},
    {0.171875, 0.046875},
    {-0.140625, 0.140625},
    {0.046875, 0.390625},
  }
  local greenShadowOffsets =
  {
    {-0.109375, 0.203125},
    {0.140625, 0.234375},
    {0.390625, 0.140625},
    {0.453125, -0.015625},
    {0.328125, -0.171875},
    {0.046875, -0.234375},
    {-0.171875, -0.140625},
    {-0.234375, 0.046875},
    {-0.078125, 0.296875},
    {0.171875, 0.359375},
    {0.421875, 0.296875},
    {0.546875, 0.109375},
    {0.453125, -0.046875},
    {0.140625, -0.140625},
    {-0.140625, 0.015625},
    {-0.046875, 0.234375},
    {-0.046875, 0.359375},
    {0.171875, 0.421875},
    {0.421875, 0.359375},
    {0.546875, 0.140625},
    {0.453125, 0.015625},
    {0.171875, -0.046875},
    {-0.171875, 0.078125},
    {-0.203125, 0.265625},
    {0.015625, 0.421875},
    {0.203125, 0.421875},
    {0.484375, 0.328125},
    {0.359375, 0.140625},
    {0.421875, 0.046875},
    {0.015625, 0.046875},
    {-0.171875, 0.171875},
    {-0.109375, 0.390625},
  }
  if (shadowOffset == nil) then
    shadowOffset = mainOffset
  end
  local result =
  {
    wire =
    {
      red = {redWireOffsets[connectorNumber+1][1] + mainOffset[1] - 0.015625, redWireOffsets[connectorNumber+1][2] + mainOffset[2] - 0.015625},
      green = {greenWireOffsets[connectorNumber+1][1] + mainOffset[1] - 0.015625, greenWireOffsets[connectorNumber+1][2] + mainOffset[2] - 0.015625},
    },
    shadow =
    {
      red = {redShadowOffsets[connectorNumber+1][1] + shadowOffset[1] - 0.015625, redShadowOffsets[connectorNumber+1][2] + shadowOffset[2] - 0.015625},
      green = {greenShadowOffsets[connectorNumber+1][1] + shadowOffset[1] - 0.015625, greenShadowOffsets[connectorNumber+1][2] + shadowOffset[2] - 0.015625},
    }
  }
  return result
end
------------------- INSRTER -------------------
inserter_circuit_connector_sprites =
{
    connector_main =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-inserter-main.png",
      priority = "low",
      width = 15,
      height = 12,
      shift = {-0.203125 + 0, 0.125 + -0.09375},
    },
    connector_shadow =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-inserter-shadow.png",
      priority = "low",
      flags = { "shadow" },
      width = 18,
      height = 18,
      shift = {-0.03125 + 0, 0.1875 + -0.09375},
    },
    led_red =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-inserter-led-red.png",
      priority = "low",
      width = 6,
      height = 5,
      shift = {-0.15625 + 0, 0.171875 + -0.09375},
    },
    led_green =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-inserter-led-green.png",
      priority = "low",
      width = 6,
      height = 5,
      shift = {-0.15625 + 0, 0.171875 + -0.09375},
    },
    led_blue =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-inserter-led-blue.png",
      priority = "low",
      width = 5,
      height = 5,
      shift = {-0.265625 + 0, 0.078125 + -0.09375},
    },

    logistic_animation =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-logistic-animation.png",
      priority = "low",
      blend_mode = "additive",
      line_length = 4,
      width = 43,
      height = 43,
      frame_count = 15,
      animation_speed = 0.5,
      shift = {0.015625 - 0.265625 + 0, -0.234375 + 0.078125 + -0.09375},
    },

    led_light =
    {
      intensity = 0.8,
      size = 0.9,
    },

    blue_led_light_offset = {-0.28125, -0.03125},
    red_green_led_light_offset = {-0.15625, 0.0625},
}

inserter_circuit_wire_connection_point =
{
  shadow =
  {
    red = {-0.1875, 0.21875},
    green = {-0.1875, 0.25},
  },
  wire =
  {
    red = {-0.375, 0.03125},
    green = {-0.375, 0.0625},
  }
}

inserter_circuit_wire_max_distance = 9

if not data.is_demo then
  inserter_default_stack_control_input_signal = {type = "virtual", name = "signal-S"}
else
  inserter_default_stack_control_input_signal = {type = "virtual", name = "signal-black"}
end

------------------- TRANSPORT BELT -------------------
transport_belt_connector_frame_sprites =
{
  frame_main_h =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-h.png",
    priority = "low",
    width = 34,
    height = 38,
    shift = {0, -0.0625},
  },
  frame_main_ne =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-ne.png",
    priority = "low",
    width = 35,
    height = 34,
    shift = {-0.015625, 0},
  },
  frame_main_nw =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-nw.png",
    priority = "low",
    width = 34,
    height = 34,
    shift = {0, 0},
  },
  frame_main_se =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-se.png",
    priority = "low",
    width = 34,
    height = 39,
    shift = {0, -0.078125},
  },
  frame_main_sw =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-sw.png",
    priority = "low",
    width = 34,
    height = 39,
    shift = {0, -0.078125},
  },
  frame_main_v =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-v.png",
    priority = "low",
    width = 34,
    height = 34,
    shift = {0, 0},
  },
  frame_main_x =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-x.png",
    priority = "low",
    width = 34,
    height = 34,
    shift = {0, 0},
  },
  frame_shadow_h =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-shadow-h.png",
    priority = "low",
    width = 37,
    height = 34,
    shift = {0.078125, 0},
  },
  frame_shadow_ne =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-shadow-ne.png",
    priority = "low",
    width = 39,
    height = 34,
    shift = {0.109375, 0},
  },
  frame_shadow_nw =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-shadow-nw.png",
    priority = "low",
    width = 40,
    height = 34,
    shift = {0.09375, 0},
  },
  frame_shadow_se =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-shadow-se.png",
    priority = "low",
    width = 39,
    height = 34,
    shift = {0.109375, 0},
  },
  frame_shadow_sw =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-shadow-sw.png",
    priority = "low",
    width = 39,
    height = 34,
    shift = {0.109375, 0},
  },
  frame_shadow_v =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-shadow-v.png",
    priority = "low",
    width = 39,
    height = 34,
    shift = {0.109375, 0},
  },
  frame_shadow_x =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-shadow-x.png",
    priority = "low",
    width = 39,
    height = 34,
    shift = {0.109375, 0},
  },
  frame_main_scanner =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-scanner.png",
    priority = "low",
    blend_mode = "additive",
    width = 10,
    height = 31,
    frame_count = 8,
    shift = {0, 0.015625},
  },

  frame_main_scanner_movement_speed = 0.032258064516129,

  frame_main_scanner_horizontal_start_shift = {-0.25, -0.125 + 1/32},
  frame_main_scanner_horizontal_end_shift = {0.25, -0.125 + 1/32},
  frame_main_scanner_horizontal_y_scale = 0.70,
  frame_main_scanner_horizontal_rotation = 0,

  frame_main_scanner_vertical_start_shift = {0, -0.3125},
  frame_main_scanner_vertical_end_shift = {0, 0.1875} ,
  frame_main_scanner_vertical_y_scale = 0.75,
  frame_main_scanner_vertical_rotation = 0.25,

  frame_main_scanner_cross_horizontal_start_shift = {-0.3125, -0.0625},
  frame_main_scanner_cross_horizontal_end_shift = {0.3125, -0.0625} ,
  frame_main_scanner_cross_horizontal_y_scale = 0.60,
  frame_main_scanner_cross_horizontal_rotation = 0,

  frame_main_scanner_cross_vertical_start_shift = {0, -0.3125},
  frame_main_scanner_cross_vertical_end_shift = {0, 0.1875} ,
  frame_main_scanner_cross_vertical_y_scale = 0.75,
  frame_main_scanner_cross_vertical_rotation = 0.25,


  frame_main_scanner_nw_ne =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-scanner-nw-ne.png",
    priority = "low",
    blend_mode = "additive",
    line_length = 8,
    width = 28,
    height = 24,
    frame_count = 32,
    shift = {-0.03125, -0.0625},
  },

  frame_main_scanner_sw_se =
  {
    filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-scanner-sw-se.png",
    priority = "low",
    blend_mode = "additive",
    line_length = 8,
    width = 29,
    height = 28,
    frame_count = 32,
    shift = {0.015625, -0.09375},
  },
}

transport_belt_circuit_wire_connection_point =
{
  shadow =
  {
    red = {0.703125, -0.296875},
    green = {0.703125, -0.203125},
  },
  wire =
  {
    red = {0.4375, -0.59375},
    green = {0.4375, -0.46875},
  }
}
transport_belt_circuit_wire_max_distance = 9
transport_belt_circuit_connector_sprites = get_circuit_connector_sprites({0.1875, -0.5}, {0.3125, -0.34375}, 2)

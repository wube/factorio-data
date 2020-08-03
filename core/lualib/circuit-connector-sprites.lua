
local function make_circuit_connector_sprites(template, index, main_offset, shadow_offset, show_shadow)
  local function get_frame(animation, extra_shift, frame)
    return
    {
      filename = animation.filename,
      priority = animation.priority,
      flags = animation.flags,
      draw_as_shadow = animation.draw_as_shadow,
      width = animation.width,
      height = animation.height,
      scale = animation.scale,
      x = animation.width * (frame % (animation.line_length or animation.frame_count)),
      y = animation.height * (math.floor(frame / (animation.line_length or animation.frame_count))),
      shift = util.add_shift(animation.shift, extra_shift)
    }
  end

  local result = {}
  for k,t in pairs(template) do
    if t.filename then
      result[k] = get_frame(t, main_offset, index)
      if t.hr_version then
        result[k].hr_version = get_frame(t.hr_version, main_offset, index)
      end
    end
  end

  if show_shadow and shadow_offset and template.connector_shadow then
    result.connector_shadow = get_frame(template.connector_shadow, shadow_offset, index)
  else
    result.connector_shadow = nil
  end

  result.led_light =
  {
    intensity = 0.8,
    size = 0.9
  }

  local light_offset = util.add_shift(main_offset, template.light_offset_hotfix)
  result.blue_led_light_offset = template.light_offsets[index + 1] and util.add_shift(light_offset, template.light_offsets[index + 1].b)
  result.red_green_led_light_offset = template.light_offsets[index + 1] and util.add_shift(light_offset, template.light_offsets[index + 1].rg)

  return result
end

local function make_circuit_connector_points(template, index, main_offset, shadow_offset)
  local result = {}

  index = index + 1

  local offset = util.add_shift(main_offset, template.wire_offset_hotfix)
  result.wire =
  {
    red = util.add_shift(offset, template.wire_offsets[index].red),
    green = util.add_shift(offset, template.wire_offsets[index].green)
  }

  if shadow_offset then
    offset = util.add_shift(shadow_offset, template.wire_shadow_offset_hotfix)
    result.shadow =
    {
      red = util.add_shift(offset, template.wire_shadow_offsets[index].red),
      green = util.add_shift(offset, template.wire_shadow_offsets[index].green)
    }
  end

  return result
end

local function make_circuit_connector_definitions(template, definitions)
  local _sprites = {}
  local _points = {}

  for k, d in pairs(definitions) do
    if d.variation then
      table.insert(_sprites, make_circuit_connector_sprites(template, d.variation, d.main_offset, d.shadow_offset, d.show_shadow))
      table.insert(_points, make_circuit_connector_points(template, d.variation, d.main_offset, d.shadow_offset))
    end
  end

  if #definitions == 1 then
    return { sprites = _sprites[1], points = _points[1] }
  else
    return { sprites = _sprites, points = _points }
  end
end

default_circuit_wire_max_distance = 9

circuit_connector_definitions =
{
  create = make_circuit_connector_definitions
}

require ("circuit-connector-generated-definitions")

circuit_connector_definitions["programmable-speaker"] = circuit_connector_definitions.create
(
  universal_connector_template,
  {
    { variation = 18, main_offset = util.by_pixel(0, -8), shadow_offset = util.by_pixel(4.5, -7), show_shadow = true }
  }
)

------------------- INSERTER -------------------

inserter_circuit_wire_max_distance = 9

if not data.is_demo then
  inserter_default_stack_control_input_signal = {type = "virtual", name = "signal-S"}
else
  inserter_default_stack_control_input_signal = {type = "virtual", name = "signal-black"}
end

------------------- TRANSPORT BELT -------------------

circuit_connector_definitions["belt"] = circuit_connector_definitions.create
(
  belt_connector_template,
  {
    { variation = 0 },
    { variation = 1 },
    { variation = 2 },
    { variation = 3 },
    { variation = 4 },
    { variation = 5 },
    { variation = 6 }
  }
)

for i, _ in ipairs(belt_connector_template.wire_offsets) do
  circuit_connector_definitions["belt"].points[i] = make_circuit_connector_points(belt_connector_template, i - 1, {0,0}, {0,0})
end

transport_belt_connector_frame_sprites =
{
  frame_main = belt_frame_connector_template.frame_main,
  frame_shadow = belt_frame_connector_template.frame_shadow,
  frame_back_patch = belt_frame_connector_template.back_patch,
  frame_main_scanner = belt_frame_connector_template.frame_main_scanner
}

local belt_ccm = transport_belt_connector_frame_sprites

belt_ccm.frame_main_scanner_movement_speed = 0.032258064516129

belt_ccm.frame_main_scanner_horizontal_start_shift = {-0.25, -0.125 + 1/32}
belt_ccm.frame_main_scanner_horizontal_end_shift = {0.25, -0.125 + 1/32}
belt_ccm.frame_main_scanner_horizontal_y_scale = 0.70
belt_ccm.frame_main_scanner_horizontal_rotation = 0

belt_ccm.frame_main_scanner_vertical_start_shift = {0, -0.3125}
belt_ccm.frame_main_scanner_vertical_end_shift = {0, 0.1875}
belt_ccm.frame_main_scanner_vertical_y_scale = 0.75
belt_ccm.frame_main_scanner_vertical_rotation = 0.25

belt_ccm.frame_main_scanner_cross_horizontal_start_shift = {-0.3125, -0.0625}
belt_ccm.frame_main_scanner_cross_horizontal_end_shift = {0.3125, -0.0625}
belt_ccm.frame_main_scanner_cross_horizontal_y_scale = 0.60
belt_ccm.frame_main_scanner_cross_horizontal_rotation = 0

belt_ccm.frame_main_scanner_cross_vertical_start_shift = {0, -0.3125}
belt_ccm.frame_main_scanner_cross_vertical_end_shift = {0, 0.1875}
belt_ccm.frame_main_scanner_cross_vertical_y_scale = 0.75
belt_ccm.frame_main_scanner_cross_vertical_rotation = 0.25

belt_ccm.frame_main_scanner_nw_ne =
{
  filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-scanner-nw-ne.png",
  priority = "low",
  blend_mode = "additive",
  line_length = 8,
  width = 28,
  height = 24,
  frame_count = 32,
  shift = {-0.03125, -0.0625}
}

belt_ccm.frame_main_scanner_sw_se =
{
  filename = "__base__/graphics/entity/transport-belt/connector/transport-belt-connector-frame-main-scanner-sw-se.png",
  priority = "low",
  blend_mode = "additive",
  line_length = 8,
  width = 29,
  height = 28,
  frame_count = 32,
  shift = {0.015625, -0.09375}
}

transport_belt_circuit_wire_max_distance = 9

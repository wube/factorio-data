local util = require("util")

local function create_leg_sprite_layer_definition(unit_scale, row, additions, sprite_definition)
  if not sprite_definition then
    return nil
  end
  local tab = util.table.deepcopy(sprite_definition)
  tab.x = 0
  tab.y = tab.height * (row - 1)
  tab.scale = (tab.scale or 1.0) * unit_scale
  if tab.shift then
    tab.shift[1] = tab.shift[1] * unit_scale
    tab.shift[2] = tab.shift[2] * unit_scale
  end
  tab.draw_as_shadow = additions.draw_as_shadow
  tab.apply_runtime_tint = additions.apply_runtime_tint
  tab.variation_count = nil
  tab.surface = "gleba"
  tab.usage = "enemy"
  return tab
end

local function scale_graphics_properties(graphics_properties, scale)
  local tab = util.table.deepcopy(graphics_properties)

  tab.middle_offset_from_top = (tab.middle_offset_from_top or 0) * scale
  tab.middle_offset_from_bottom = (tab.middle_offset_from_bottom or 0) * scale

  tab.top_end_length = (tab.top_end_length or 0) * scale
  tab.bottom_end_length = (tab.bottom_end_length or 0) * scale

  return tab
end

local function create_leg_part_special(unit_scale, key, graphics_definitions)
  local tab = scale_graphics_properties(graphics_definitions.graphics_properties, unit_scale)
  for layer_name, layer_definitions in pairs(graphics_definitions.layers) do
    for _, v in pairs(layer_definitions) do
      if v[key] then
        tab[layer_name] = create_leg_sprite_layer_definition(unit_scale, v.row, v, graphics_definitions[v.key])
      end
    end
  end
  return tab
end

local function create_leg_part_shadow_graphics(unit_scale, graphics_definitions)
  return create_leg_part_special(unit_scale, "draw_as_shadow", graphics_definitions)
end

local function create_leg_part_water_reflection_graphics(unit_scale, graphics_definitions)
  return create_leg_part_special(unit_scale, "draw_as_water_reflection", graphics_definitions)
end

local function create_leg_part_graphics(unit_scale, graphics_definitions)
  local tab = scale_graphics_properties(graphics_definitions.graphics_properties, unit_scale)
  for layer_name, layer_definitions in pairs(graphics_definitions.layers) do
    for _, v in pairs(layer_definitions) do
      if (not v.draw_as_shadow) and (not v.draw_as_water_reflection) then
        tab[layer_name] = tab[layer_name] or { layers = {} }
        table.insert(tab[layer_name].layers, create_leg_sprite_layer_definition(unit_scale, v.row, v, graphics_definitions[v.key]))
      end
    end
  end
  return tab
end

function get_leg_joint_rotation_offsets(scale)
  return 0
end

function create_leg_graphics_set(unit_scale, graphics_definitions)
  local leg_graphics_set =
  {
    -- upper
    upper_part = create_leg_part_graphics(unit_scale, graphics_definitions.leg_upper_part),
    upper_part_shadow = create_leg_part_shadow_graphics(unit_scale, graphics_definitions.leg_upper_part),
    upper_part_water_reflection = create_leg_part_water_reflection_graphics(unit_scale, graphics_definitions.leg_upper_part),

    -- knee
    joint_turn_offset = get_leg_joint_rotation_offsets(unit_scale),
    joint_render_layer = graphics_definitions.joint_render_layer,
    joint =
    {
      layers =
      {
        create_leg_sprite_layer_definition(unit_scale, 1, {}, graphics_definitions.leg_joint),
        create_leg_sprite_layer_definition(unit_scale, 1, {}, graphics_definitions.leg_joint_tint)
      }
    },
    joint_shadow = create_leg_sprite_layer_definition(unit_scale, 2, { draw_as_shadow = true }, graphics_definitions.leg_joint),
    --joint_reflection = -- not implemented yet

    -- lower
    lower_part = create_leg_part_graphics(unit_scale, graphics_definitions.leg_lower_part),
    lower_part_shadow = create_leg_part_shadow_graphics(unit_scale, graphics_definitions.leg_lower_part),
    lower_part_water_reflection = create_leg_part_water_reflection_graphics(unit_scale, graphics_definitions.leg_lower_part),
  }

  -- foot
  if(graphics_definitions.foot) then
    leg_graphics_set.foot =
    {
      layers =
      {
        create_leg_sprite_layer_definition(unit_scale, 1, {}, graphics_definitions.foot),
        create_leg_sprite_layer_definition(unit_scale, 1, {}, graphics_definitions.foot_tint),
      }
    }
    leg_graphics_set.foot_shadow = create_leg_sprite_layer_definition(unit_scale, 1, { draw_as_shadow = true }, graphics_definitions.foot_shadow)
  --leg_graphics_set.foot_reflection = -- not implemented yet
  end
  return leg_graphics_set
end

function get_leg_hit_the_ground_trigger()
  return {
    {
      type = "create-trivial-smoke",
      smoke_name = "smoke-building",
      repeat_count = 4,
      starting_frame_deviation = 5,
      offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}},
      speed_from_center = 0.03
    }
  }
end

data:extend({
  {
    type = "trivial-smoke",
    name = "stomper-stomp",
    color = util.premul_color{1,1,1, 1},
    start_scale = 8,
    end_scale = 8,
    duration = 89,
    fade_away_duration = 30,
    affected_by_wind = false,
    cyclic = false,
    render_layer = "lower-object-above-shadow",
    animation =
    {
      filename = "__space-age__/graphics/entity/stomper/smash-effect.png",
      --flags = { "smoke" },
      frame_sequence = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
      16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,
      16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,
      16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,
      16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16, --17*4 hang frames
      17,18,19,21}, -- 21+ hang frames
      line_length = 21,
      width = 256,
      height = 224,
      frame_count = 21,
      shift = {-0.0, -0.8},
      priority = "low",
      animation_speed = 1
    }
  }})

function get_leg_hit_the_ground_when_attacking_trigger(stomp_radius, stomp_damage_modifier, sound)
  return {
    { type = "invoke-tile-trigger" },
    {
      type = "create-trivial-smoke",
      smoke_name = "stomper-stomp",
      repeat_count = 1,
      offsets = {{0, 0.5}},
      offset_deviation = {{-0.0, -0.0}, {0.0, 0.0}},
      speed = {0, 0},
      initial_height = 0.0,
      speed_from_center = 0.000,
      speed_from_center_deviation = 0.000,
    },
    {
      type = "nested-result",
      action =
      {
        type = "area",
        radius = stomp_radius,
        force = "enemy",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = { amount = 25 * stomp_damage_modifier, type = "impact"}
            },
            {
              type = "play-sound",
              sound = sound,-- only on hit
            }
          }
        }
      }
    }
  }
end

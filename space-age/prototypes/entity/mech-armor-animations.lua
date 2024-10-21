local idle_sequence =
{
   1, 2, 3, 4, 4, 3, 2, 1, 1, 2,
   3, 4, 4, 3, 2, 1, 1, 2, 3, 4,
   5, 6, 7, 8, 9,10,11,12,13,14,
  15,16,17,18,19,20,21,22
}

local function mech_anim(name, table, light)

  table.scale = table.scale or 0.5
  local mask_table = {}
  local light_table = {}
  local shadow_table = {}

  for k,v in pairs(table) do
    light_table[k] = v
    mask_table[k] = v
    shadow_table[k] = v
  end
  mask_table.apply_runtime_tint = true
  shadow_table.draw_as_shadow = true
  local base_path = "__space-age__/graphics/entity/mech-armor/"
  local anim =
  {
    layers = {
      util.sprite_load(base_path .. name, table),
      util.sprite_load(base_path .. name .. "-mask", mask_table),
      util.sprite_load(base_path .. name .. "-shadow", shadow_table),
    }
  }

  light = light or false
  if light then
    light_table.blend_mode = "additive"
    light_table.draw_as_light = true
    anim.layers[4] = util.sprite_load(base_path .. name .. "-light", light_table)
  end

  return anim
end

local idle_anim = mech_anim("mech-idle",
{
  frame_count = 22,
  animation_speed = 0.16,
  frame_sequence = idle_sequence,
  direction_count = 8,
  usage = "player",
})

local run_anim = mech_anim("mech-run",
{
  frame_count = 22,
  direction_count = 40,
  animation_speed = 0.37,
  usage = "player",
})

local mining_anim = mech_anim("mech-mining",
{
  frame_count = 27,
  animation_speed = 0.45,
  direction_count = 8,
  usage = "player",
})

local take_off = mech_anim("mech-uplift",
{
  frame_count = 16,
  animation_speed = 0.6,
  direction_count = 8,
  usage = "player",
}, true)

local landing = mech_anim("mech-descend",
{
  frame_count = 16,
  animation_speed = 0.6,
  direction_count = 8,
  usage = "player",
}, true)

local idle_air = mech_anim("mech-idle-air",
{
  frame_count = 5,
  animation_speed = 0.2,
  --frame_sequence = idle_air_sequence,
  direction_count = 8,
  usage = "player",
}, true)

local corpse = mech_anim("mech-corpse",
{
  frame_count = 2,
  animation_speed = 1,
  usage = "player",
}, false)

table.insert(data.raw.character.character.animations,
{
  armors = {"mech-armor"},
  idle_with_gun = idle_anim,
  mining_with_tool = mining_anim,
  running_with_gun = run_anim,
  idle_with_gun_in_air = idle_air,
  take_off = take_off,
  landing = landing,
  smoke_cycles_per_tick = 0.25,
  extra_smoke_cycles_per_tile = 1.5,
  smoke_in_air =
  {
    {
      name = "mech-armor-smoke",
      deviation = {0.2, 0.2},
      frequency = 5,
      position = {0.25, 1.0},
      has_8_directions = true,
      north_position = {0, 1.0 + 0.15},
      north_east_position = {-0.5303, 0.8838},
      east_position = {-0.9, 0.75},
      south_east_position = {-0.8838 + 0.5, -0.5303 + 0.5},
      south_position = {0, 1.0 - 0.5},
      south_west_position = {0.5303, -0.8838 + 0.5},
      west_position = {1, 0.75},
      north_west_position = {0.8838 - 0.5, 0.5303 + 0.5},
      starting_frame = 0,
      starting_frame_deviation = 60,
      starting_vertical_speed = -0.1,
      starting_vertical_speed_deviation = 0.04,
      height = 1
    }
  }
})

table.insert(data.raw['character-corpse']['character-corpse'].pictures, corpse)
data.raw['character-corpse']['character-corpse'].armor_picture_mapping["mech-armor"] = #data.raw['character-corpse']['character-corpse'].pictures

local tile_graphics = {}

tile_graphics.water_particle_tints =
{
  primary = {0.278, 0.396, 0.272, 0.314},
  secondary = {0.226, 0.341, 0.337, 0.314}
}

tile_graphics.deepwater_particle_tints =
{
  primary = {0.226, 0.341, 0.337, 0.314},
  secondary = {0.278, 0.396, 0.272, 0.314}
}

tile_graphics.shallow_water_particle_tints =
{
  primary = {0.194, 0.360, 0.396, 0.314},
  -- secondary = {0.194, 0.360, 0.396, 0.314}
}

tile_graphics.mud_water_particle_tints =
{
  primary = {0.174, 0.341, 0.376, 0.314},
  -- secondary = {0.174, 0.341, 0.376, 0.314}
}

tile_graphics.green_water_particle_tints =
{
  primary = {0.278, 0.396, 0.272, 0.314},
  secondary = {0.145, 0.220, 0.082, 0.196}
}

tile_graphics.gleba_lowland_particle_tints = tile_graphics.water_particle_tints
tile_graphics.gleba_shallow_water_particle_tints = tile_graphics.shallow_water_particle_tints
tile_graphics.gleba_mud_water_particle_tints = tile_graphics.mud_water_particle_tints

tile_graphics.lava_particle_tints =
{
  primary = { 167, 59, 27 },
  secondary = { 167, 59, 27 },
}

tile_graphics.fulgora_oil_ocean_particle_tints =
{
  primary = { 74, 42, 43, 255 },
  secondary = { 212, 160, 122 },
}

tile_graphics.patch_for_inner_corner_of_transition_between_transition =
{
  filename = "__base__/graphics/terrain/water-transitions/water-patch.png",
  scale = 0.5,
  width = 64,
  height = 64
}

tile_graphics.generic_masked_tile_transitions1 =
{
  spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
  layout =
  {
    scale = 0.5,
    inner_corner_count = 8,
    outer_corner_count = 8,
    side_count = 8,
    u_transition_count = 1,
    o_transition_count = 1,
    u_transition_line_length = 1,
    o_transition_line_length = 2,
    outer_corner_x = 576,
    side_x = 1152,
    u_transition_x = 1728,
    o_transition_x = 2304,
    mask = { y_offset = 0 }
  }
}

tile_graphics.generic_texture_on_concrete_transition =
{
  mask_layout =
  {
    inner_corner =
    {
      spritesheet = "__base__/graphics/terrain/concrete/hazard-concrete-inner-corner-mask.png",
      count = 1,
      scale = 0.5
    },
    outer_corner =
    {
      spritesheet = "__base__/graphics/terrain/concrete/hazard-concrete-outer-corner-mask.png",
      count = 1,
      scale = 0.5
    },
    side =
    {
      spritesheet = "__base__/graphics/terrain/concrete/hazard-concrete-side-mask.png",
      count = 1,
      scale = 0.5
    },
    u_transition =
    {
      spritesheet = "__base__/graphics/terrain/concrete/hazard-concrete-u-mask.png",
      count = 1,
      scale = 0.5
    },
    o_transition =
    {
      spritesheet = "__base__/graphics/terrain/concrete/hazard-concrete-o-mask.png",
      count = 1,
      scale = 0.5
    }
  }
}

local tile_spritesheet_layout = {}
tile_graphics.tile_spritesheet_layout = tile_spritesheet_layout

tile_spritesheet_layout.transition_16_16_16_4_8_short =
{
  scale = 0.5,
  inner_corner_count = 16,
  outer_corner_count = 16,
  side_count = 16,
  u_transition_count = 4,
  o_transition_count = 8,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.transition_3_3_3_1_0_only_u_tall =
{
  scale = 0.5,
  inner_corner_count = 3,
  outer_corner_count = 3,
  side_count = 3,
  u_transition_count = 1,
  o_transition_count = 0,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  u_transition_tile_height = 2,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.transition_3_3_3_1_0 =
{
  scale = 0.5,
  inner_corner_count = 3,
  outer_corner_count = 3,
  side_count = 3,
  u_transition_count = 1,
  o_transition_count = 0,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  inner_corner_tile_height = 2,
  outer_corner_tile_height = 2,
  side_tile_height = 2,
  u_transition_tile_height = 2,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.transition_4_4_8_1_1 =
{
  scale = 0.5,
  inner_corner_count = 4,
  outer_corner_count = 4,
  side_count = 8,
  u_transition_count = 1,
  o_transition_count = 1,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  inner_corner_tile_height = 2,
  outer_corner_tile_height = 2,
  side_tile_height = 2,
  u_transition_tile_height = 2,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.transition_8_8_8_2_4 =
{
  scale = 0.5,
  inner_corner_count = 8,
  outer_corner_count = 8,
  side_count = 8,
  u_transition_count = 2,
  o_transition_count = 4,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  inner_corner_tile_height = 2,
  outer_corner_tile_height = 2,
  side_tile_height = 2,
  u_transition_tile_height = 2,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.transition_8_8_8_4_4 =
{
  scale = 0.5,
  inner_corner_count = 8,
  outer_corner_count = 8,
  side_count = 8,
  u_transition_count = 4,
  o_transition_count = 4,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  inner_corner_tile_height = 2,
  outer_corner_tile_height = 2,
  side_tile_height = 2,
  u_transition_tile_height = 2,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.transition_16_16_16_4_4 =
{
  scale = 0.5,
  inner_corner_count = 16,
  outer_corner_count = 16,
  side_count = 16,
  u_transition_count = 4,
  o_transition_count = 4,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  inner_corner_tile_height = 2,
  outer_corner_tile_height = 2,
  side_tile_height = 2,
  u_transition_tile_height = 2,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.transition_16_16_16_4_8 =
{
  scale = 0.5,
  inner_corner_count = 16,
  outer_corner_count = 16,
  side_count = 16,
  u_transition_count = 4,
  o_transition_count = 8,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
  inner_corner_tile_height = 2,
  outer_corner_tile_height = 2,
  side_tile_height = 2,
  u_transition_tile_height = 2,
  overlay    = { x_offset = 0 },
  mask       = { x_offset = 2176 },
  background = { x_offset = 1088 }
}

tile_spritesheet_layout.simple_3_3_3_1_0_three_way_edge_mask =
{
  spritesheet = "__base__/graphics/terrain/masks/sand-water-edge-3-way-transition.png",
  scale = 0.5,
  tile_height = 1,
  x = 0,
  count = 0,
  inner_corner_count = 3,
  outer_corner_count = 3,
  side_count = 3,
  u_transition_count = 1,
  o_transition_count = 0,
  inner_corner_y = 0,
  outer_corner_y = 576,
  side_y = 1152,
  u_transition_y = 1728,
  o_transition_y = 2304,
}

tile_spritesheet_layout.simple_white_mask =
{
  spritesheet = "__core__/graphics/white-square.png",
  x = 0,
  y = 0,
  count = 1,
  scale = 32
}

return tile_graphics

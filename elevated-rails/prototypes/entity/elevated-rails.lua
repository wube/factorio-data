require ("__elevated-rails__.prototypes.entity.elevated-rail-pictures")

local hit_effects = require("__base__.prototypes.entity.hit-effects")

curved_rail_ending_shifts = function()
  local px = 1.0/64
  return
    {
      {-px, 0}, {0, px},
      {px, 0}, {0, px},
      {0, -px}, {-px, 0},
      {0, px}, {-px, 0},
      {px, 0}, {0, -px},
      {-px, 0}, {0, -px},
      {0, px}, {px, 0},
      {0, -px}, {px, 0}
    }
end

rail_8shifts_vector = function(dx, dy)
  return
    {
      {  dx,  dy },
      { -dx,  dy },
      { -dy,  dx },
      { -dy, -dx },
      { -dx, -dy },
      {  dx, -dy },
      {  dy, -dx },
      {  dy,  dx }
    }
end

local degrees = function(count) return (1 / 360) * count end

data:extend(
{
  {
    type = "rail-ramp",
    name = "rail-ramp",
    icon = "__elevated-rails__/graphics/icons/rail-ramp.png",
    collision_box = {{-1.8, -7.8}, {1.8, 7.8}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    drawing_box_vertical_extension = 2,
    flags = {"placeable-neutral", "player-creation"},
    tile_buildability_rules =
    {
      {
        area = {{-1.8, 4.2}, {1.8, 7.8}},
        required_tiles = {layers = {ground_tile = true}},
        colliding_tiles = {layers = {water_tile = true}}, -- extra condition as a workaround because oil-ocean-shallow has ground-tile and i want bottom of ramp to require solid ground
        remove_on_collision = true
      }
    },
    minable = {mining_time = 0.2, result = "rail-ramp", count = 1},
    max_health = 2000,
    corpse = "rail-ramp-remnants",
    dying_explosion =
    {
      {
        name = "rail-ramp-explosion-lower",
        offset = {0.0, 5.2}
      },
      {
        name = "rail-ramp-explosion-middle",
        offset = {0.0, 2.1}
      },
      {
        name = "rail-ramp-explosion-middle",
        offset = {0.0, -2.5}
      },
      {
        name = "rail-ramp-explosion-higher",
        offset = {0, -6}
      }
    },
     resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      },
      {
        type = "laser",
        percent = 70
      }
    },
    damaged_trigger_effect = hit_effects.wall(),
    pictures = rails_ramp_pictures(),
    fence_pictures = rails_ramp_fences_pictures();
    extra_planner_penalty = 0.5,
    support_range = 9,
    -- removes_soft_decoratives = true
  },
  {
    type = "elevated-straight-rail",
    name = "elevated-straight-rail",
    factoriopedia_alternative = "straight-rail",
    order = "b[elevated-rail]-a[elevated-straight-rail]",
    icon = "__elevated-rails__/graphics/icons/elevated-rail.png",
    collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 1},
    max_health = 200,
    corpse = "elevated-rail-remnants",
    dying_explosion =
    {
      name = "elevated-rail-explosion"
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      }
    },
    -- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    damaged_trigger_effect = hit_effects.wall(),
    pictures = elevated_rail_pictures("straight"),
    fence_pictures = elevated_rail_fences_pictures("straight"),
    placeable_by = {item = "rail", count = 1},
    extra_planner_goal_penalty = -4,
  },
  {
    type = "elevated-half-diagonal-rail",
    name = "elevated-half-diagonal-rail",
    factoriopedia_alternative = "half-diagonal-rail",
    order = "b[elevated-rail]-b[elevated-half-diagonal-rail]",
    deconstruction_alternative = "elevated-straight-rail",
    icon = "__elevated-rails__/graphics/icons/elevated-half-diagonal-rail.png",
    collision_box = {{-0.75, -2.236}, {0.75, 2.236}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    tile_height = 2,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 2},
    extra_planner_goal_penalty = -4,
    max_health = 200,
    corpse = "elevated-rail-remnants",
    dying_explosion =
    {
      {
        name = "elevated-rail-explosion",
        offset = {0.9, 2.2}
      },
      {
        name = "elevated-rail-explosion"
      },
      {
        name = "elevated-rail-explosion",
        offset = {-1.2, -2}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      }
    },
    -- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    damaged_trigger_effect = hit_effects.wall(),
    pictures = elevated_rail_pictures("half-diagonal"),
    fence_pictures = elevated_rail_fences_pictures("half-diagonal"),
    placeable_by = {item = "rail", count = 2},
    extra_planner_penalty = 0
  },
  {
    type = "elevated-curved-rail-a",
    name = "elevated-curved-rail-a",
    factoriopedia_alternative = "curved-rail-a",
    order = "b[elevated-rail]-c[elevated-curved-rail-a]",
    deconstruction_alternative = "elevated-straight-rail",
    icon = "__elevated-rails__/graphics/icons/elevated-curved-rail.png",
    collision_box = {{-0.75, -2.516}, {0.75, 2.516}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 3},
    max_health = 200,
    corpse = "elevated-rail-remnants",
    dying_explosion =
    {
      {
        name = "elevated-rail-explosion",
        offset = {0.9, 2.2}
      },
      {
        name = "elevated-rail-explosion"
      },
      {
        name = "elevated-rail-explosion",
        offset = {-1.2, -2}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      }
    },
    -- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    damaged_trigger_effect = hit_effects.wall(),
    pictures = elevated_rail_pictures("curved-a"),
    fence_pictures = elevated_rail_fences_pictures("curved-a"),
    placeable_by = {item = "rail", count = 3},
    extra_planner_penalty = 0.5,
    deconstruction_marker_positions = rail_8shifts_vector(-0.248, -0.533)
  },
  {
    type = "elevated-curved-rail-b",
    name = "elevated-curved-rail-b",
    factoriopedia_alternative = "curved-rail-b",
    order = "b[elevated-rail]-d[elevated-curved-rail-b]",
    deconstruction_alternative = "elevated-straight-rail",
    icon = "__elevated-rails__/graphics/icons/elevated-curved-rail-b.png",
    collision_box = {{-0.75, -2.441}, {0.75, 2.441}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "rail", count = 3},
    max_health = 200,
    corpse = "elevated-rail-remnants",
    dying_explosion =
    {
      {
        name = "elevated-rail-explosion",
        offset = {0.9, 2.2}
      },
      {
        name = "elevated-rail-explosion"
      },
      {
        name = "elevated-rail-explosion",
        offset = {-1.2, -2}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      }
    },
    -- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    damaged_trigger_effect = hit_effects.wall(),
    pictures = elevated_rail_pictures("curved-b"),
    fence_pictures = elevated_rail_fences_pictures("curved-b"),
    placeable_by = {item = "rail", count = 3},
    extra_planner_penalty = 0.5,
    deconstruction_marker_positions = rail_8shifts_vector(-0.309, -0.155)
  },
  {
    type = "rail-support",
    name = "rail-support",
    icon = "__elevated-rails__/graphics/icons/rail-support.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-16-way", "snap-to-rail-support-spot"},
    minable = {mining_time = 0.5, result = "rail-support"},
    max_health = 1000,
    corpse = "rail-support-remnants",
    collision_box = {{-1.39, -1.39}, {1.39, 1.39}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    elevated_selection_boxes =
    {
      {{-1, -4}, {1, -1.5}, 0.0},    -- north
      {{-1, -4}, {1, -1.5}, 0.0625 + degrees(8)}, -- north-north-east
      {{-1, -4}, {1, -1.5}, 0.125},  -- north-east
      {{-1, -4.25}, {1, -1.25}, 0.1875 - degrees(3)},  -- east-north-east
      {{-1.75, -3.75}, {1.75, -2.00}},   -- east
      {{-1, -4.25}, {1, -1.25}, 0.3125 + degrees(8)}, -- east-south-east
      {{-1, -4.25}, {1, -1.25}, 0.375},  -- south-east
      {{-1, -4}, {1, -1.5}, 0.4375 - degrees(8)}, -- south-south-east
    },
    drawing_box_vertical_extension = 0.5,
    support_range = 11,
    snap_to_spots_distance = 3,
    dying_explosion = {"rail-support-explosion"},
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      },
      {
        type = "laser",
        percent = 70
      }
    },
    graphics_set =
    {
      structure =
      {
        layers =
        {
          util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/elevated-rail-pylon",
                           {
                             priority = "high",
                             direction_count = 8,
                             back_equals_front = true,
                             scale = 0.5
                           }),
          util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/elevated-rail-pylon-shadow",
                           {
                             priority = "high",
                             direction_count = 8,
                             back_equals_front = true,
                             draw_as_shadow = true,
                             scale = 0.5
                           }),
        }
      },

      underwater_structure = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/elevated-rail-pylon-underwater",
                                              {
                                                direction_count = 8,
                                                back_equals_front = true,
                                                scale = 0.5
                                              }),

      water_reflection =
      {
        pictures = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/elevated-rail-pylon-reflection",
                                    {
                                      priority = "extra-high",
                                      variation_count = 8,
                                      scale = 0.5
                                    }),
        rotate = false,
        -- orientation_to_variation = true
      }
    }
  }
}
)

data.raw["rail-chain-signal"]["rail-chain-signal"].elevated_picture_set = require("__elevated-rails__/graphics/entity/elevated-rail-chain-signal/rail-chain-signal-elevated")
data.raw["rail-signal"]["rail-signal"].elevated_picture_set = require("__elevated-rails__/graphics/entity/elevated-rail-signal/rail-signal-elevated")

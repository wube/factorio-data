local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local function ashland_tree_stateless_visualisation(positions)
  return
  {
    min_count = 1,
    max_count = 4,
    offset_x = { -0.05, 0.05 }, -- will be random from range -0.05 to 0.05
    offset_y = { -0.05, 0.05 },
    positions = positions,

    render_layer = "object",
    adjust_animation_speed_by_base_scale = true,
    scale = { 0.2, 0.6 },

    light =
    {
      intensity = 0.8,
      size = 5 / 0.4,
      color = {1,1,1},
      flicker_interval = 20,
      flicker_min_modifier = 0.8,
      flicker_max_modifier = 1.2,
      offset_flicker = true
    },

    animation =
    {
      {
        filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
        line_length = 10,
        width = 84,
        height = 130,
        frame_count = 90,
        animation_speed = 0.25,
        scale = 0.55,
        tint = {r=0.9,g=0.9,b=0.9,a=0.5},
        shift = { 0, -0.7 },
        draw_as_glow = true
      },
      {
        filename = "__base__/graphics/entity/fire-flame/fire-flame-02.png",
        line_length = 10,
        width = 82,
        height = 106,
        frame_count = 90,
        animation_speed = 0.25,
        scale = 0.55,
        tint = {r=0.9,g=0.9,b=0.9,a=0.5},
        shift = { 0, -0.7 },
        draw_as_glow = true
      },
      {
        filename = "__base__/graphics/entity/fire-flame/fire-flame-03.png",
        line_length = 10,
        width = 84,
        height = 124,
        frame_count = 90,
        animation_speed = 0.25,
        scale = 0.55,
        tint = {r=0.9,g=0.9,b=0.9,a=0.5},
        shift = { 0, -0.7 },
        draw_as_glow = true
      },
    },

    -- nested visualisations inherit parent position as their position of origin
    nested_visualisations =
    {
      {
        count = 30,
        period = 120,
        particle_tick_offset = 120 / 30, -- offsets start of the simulation interval from the previous particle for each particle
        probability = 0.5,
        scale = { 0.5, 1 },
        begin_scale = 0.5,
        end_scale = 1.5,

        offset_x = { -0.2, 0.2 },
        offset_y = { -0.2, 0.2 },

        speed_x = { -1 / 120, 1 / 120 },
        speed_y = { -1 / 120, 0 / 120 },
        speed_z = 8 / 120,

        movement_slowdown_factor_z = 0.985,

        render_layer = "smoke",
        affected_by_wind = true,

        fade_in_progress_duration = 0.2 / 3,
        fade_out_progress_duration = 0.8 / 3,

        animation =
        {
          width = 253,
          height = 210,
          line_length = 8,
          frame_count = 60,
          scale = 0.25,
          tint = {r = 0.1, g = 0.1, b = 0.1, a = 0.1}, --util.premul_color{0.3, 0.3, 0.3, 0.1},
          priority = "high",
          flags = { "smoke" },
          animation_speed = 0.25,
          filename = "__base__/graphics/entity/fire-smoke/fire-smoke.png",
        }
      },
      --[[ Demo of blood particle effect
      {
        count = 140,
        period = 240,
        --particle_tick_offset = 240 / 140 * 0.5,

        speed_x = { -3 / 120, 3 / 120 },
        speed_y = { -3 / 120, 3 / 120 },
        speed_z = { 3 / 120, 15 / 120 },

        offset_x = { -0.2, 0.2 },
        offset_y = { -0.2, 0.2 },

        acceleration_z = -0.1 / 120,
        fade_out_progress_duration = 0.4,
        --movement_slowdown_factor_z = 0.985,

        animation =
        {
          filename = "__base__/graphics/particle/blood-particle/blood-particle.png",
          line_length = 12,
          width = 32,
          height = 24,
          frame_count = 12,
          scale = 0.5,
        },
        shadow =
        {
          filename = "__base__/graphics/particle/blood-particle/blood-particle.png",
          line_length = 12,
          draw_as_shadow = true,
          width = 32,
          height = 24,
          frame_count = 12,
          scale = 0.5,
        }
      }, --]]
    }
  }
end

local function make_offsets_on_tree(origin_x, origin_y, pixel_coords)
  local result = {}
  for i,coord in pairs(pixel_coords) do
    table.insert(result, { (coord[1] - origin_x) / 64, (coord[2] - origin_y) / 64 }) -- assumes high res -> 64 pixels per tile
  end
  return result
end

local ashland_lichen_tree_pictures = {
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_00",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_00",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_01",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_01",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_02",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_02",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_03",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_03",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_04",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_04",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_05",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_05",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_06",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_06",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_07",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_07",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_08",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_08",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_09",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_09",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_10",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_10",{ scale = 0.5, draw_as_shadow = true}),
    }
  },
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree_11",{ scale = 0.5}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-shadow_11",{ scale = 0.5, draw_as_shadow = true}),
    }
  }
}

local function first_x(set, x)
  local select = {}
  for i = 1, math.min(#set, x) do
    select[i] = set[i]
  end
  return select
end

data:extend(
{
  {
    type = "tree",
    name = "ashland-lichen-tree",
    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "carbon", amount = 2}
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-ashland-lichen-tree", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-ashland-lichen-tree", 5, 0.4),
    corpse = "ashland-lichen-tree-stump",
    remains_when_mined = "ashland-lichen-tree-stump",
    max_health = 50,
    collision_box = {{-0.5, -0.6}, {0.5, 0.4}},
    selection_box = {{-0.9, -2.4}, {0.9, 0.3}},
    subgroup = "trees",
    order = "a[tree]-b[vulcanus]-a[ashland-lichen-tree]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_ashland_lichen_tree,
    autoplace =
    {
      order = "b[tree]-b[normal]",
      --control = "trees", -- makes it appear on Nauvis
      probability_expression = "vulcanus_tree"
    },
    pictures = ashland_lichen_tree_pictures,
  },
  {
    type = "tree",
    name = "ashland-lichen-tree-flaming",
    icon = "__space-age__/graphics/icons/ashland-lichen-tree-flaming.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "carbon", amount = 2}
      }
    },
    resistances = {
      {
        type = "fire",
        percent = 100
      }
    },
    corpse = "ashland-lichen-tree-stump",
    remains_when_mined = "ashland-lichen-tree-stump",
    max_health = 50,
    collision_box = {{-0.5, -0.6}, {0.5, 0.4}},
    selection_box = {{-0.9, -2.4}, {0.9, 0.3}},
    subgroup = "trees",
    order = "a[tree]-b[vulcanus]-b[ashland-lichen-tree-flaming]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_ashland_lichen_tree_flaming,
    autoplace =
    {
      order = "b[tree]-a[flaming]",
      --control = "trees", -- makes it appear on Nauvis
      probability_expression = "vulcanus_tree / 16"
    },
    remains_when_mined = "fire-flame-on-tree",
    dying_trigger_effect =
    {
      type = "create-fire",
      entity_name = "fire-flame-on-tree",
      initial_ground_flame_count = 1
    },
    pictures = first_x(ashland_lichen_tree_pictures, 5),
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/tree/tree-fire.ogg",
        volume = 0.7,
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {2.5, 100.0}}},
        }
      },
      audible_distance_modifier = 0.7,
      max_sounds_per_type = 3,
    },
    stateless_visualisation_variations =
    {
      ashland_tree_stateless_visualisation(make_offsets_on_tree(155, 177, {{155, 177}, {141, 114}, {169, 91}, {167, 150}, {201, 81}, {220, 59}, {240, 45}, {102, 83}, {119, 62}, {105, 23}})),
      ashland_tree_stateless_visualisation(make_offsets_on_tree(116, 166, {{116, 152}, {100, 131}, {81, 112}, {62, 112}, {74, 86}, {68, 56}, {73, 26}})),
      ashland_tree_stateless_visualisation(make_offsets_on_tree(108, 180, {{122, 164}, {127, 140}, {159, 133}, {118, 118}, {113, 87}, {127, 63}, {134, 33}, {145, 14}})),
      ashland_tree_stateless_visualisation(make_offsets_on_tree(96, 207, {{97, 193}, {98, 170}, {128, 145}, {75, 156}, {51, 138}, {43, 112}, {32, 88}, {29, 61}, {26, 27}})),
      ashland_tree_stateless_visualisation(make_offsets_on_tree(147, 208, {{132, 185}, {123, 157}, {154, 157}, {175, 139}, {159, 114}, {152, 87}, {164, 55}, {177, 26}, {129, 130}, {125, 100}, {121, 74}, {102, 78}, {87, 59}, {65, 44}, {55, 27}})),
    }
  },
  {
    type = "corpse",
    name = "ashland-lichen-tree-stump",
    localised_name = {"entity-name.tree-stump"},
    --icon = "__base__/graphics/icons/" .. type_name .. "-stump.png",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    hidden_in_factoriopedia = true,
    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    subgroup = "remnants",
    order="d[remnants]-b[tree]-z",
    animation =
    {

      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_00",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_01",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_02",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_03",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_04",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_05",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_06",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_07",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_08",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_09",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_10",{ scale = 0.5, direction_count = 1}),
      util.sprite_load("__space-age__/graphics/entity/plant/ashland-trees/ashland-tree-stump_11",{ scale = 0.5, direction_count = 1}),
    }
  }
})

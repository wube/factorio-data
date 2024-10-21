local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

-- Initialize the core patch sets in a predictable order
resource_autoplace.initialize_patch_set("crude-oil", false, "aquilo")
resource_autoplace.initialize_patch_set("lithium-brine", false, "aquilo")
resource_autoplace.initialize_patch_set("fluorine-vent", false, "aquilo")

local function create_tiles()
  return {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-inner-explosion",
          offsets = {{0.5, 0.5}}
        },
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-outer-explosion",
          offsets = {{0.5, 0.5}}
        }
      }
    }
  }
end

data.raw.resource["crude-oil"].created_effect = create_tiles("snow-flat")

local function resource(resource_parameters, autoplace_parameters)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__space-age__/graphics/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
    autoplace = autoplace_parameters.probability_expression ~= nil and
    {
      --control = resource_parameters.name,
      order = resource_parameters.order,
      probability_expression = autoplace_parameters.probability_expression,
      richness_expression = autoplace_parameters.richness_expression
    }
    or resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      autoplace_control_name = resource_parameters.autoplace_control_name,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end

data:extend({
  -- Usually earlier order takes priority, but there's some special
  -- case buried in the code about resources removing other things
  -- (though maybe there shouldn't be, and we should just place things in a different order).
  -- Trees are "a", and resources will delete trees when placed.
  -- Oil is "c" so won't be placed if another resource is already there.
  -- "d" is available for another resource, but isn't used for now.

  resource(
    {
      name = "tungsten-ore",
      order = "b",
      map_color = {r = 98/256, g = 86/256, b = 150/256, a = 1.000},
      mining_time = 5,
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 150/256, g = 150/256, b = 180/256, a = 1.000},
      category = "hard-solid",
      factoriopedia_simulation = simulations.factoriopedia_tungsten_ore,
    },
    {
      probability_expression = 0
    }
  ),

  resource(
    {
      name = "calcite",
      order = "b",
      map_color = {0.8, 0.7, 0.7},
      mining_time = 1,
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 0.99, g = 1.0, b = 0.92, a = 1.000},
      factoriopedia_simulation = simulations.factoriopedia_calcite,
    },
    {
      probability_expression = 0
    }
  ),

  {
    type = "resource",
    name = "sulfuric-acid-geyser",
    icon = "__space-age__/graphics/icons/sulfuric-acid-geyser.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="a-b-a",
    infinite = true,
    highlight = true,
    minimum = 60000,
    normal = 300000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    draw_stateless_visualisation_under_building = false,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "sulfuric-acid",
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      }
    },
    walking_sound = sounds.oil,
    working_sound =
    {
      sound =
      {
        category = "world-ambient", variations = sound_variations("__space-age__/sound/world/resources/sulfuric-acid-geyser", 1, 0.3),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 0.0}, to = {2.0, 100.0}}}
        }
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.3,
    },
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      --control = "sulfuric-acid-geyser",
      order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
      probability_expression = 0
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/sulfuric-acid-geyser/sulfuric-acid-geyser",
        {
          priority = "high",
          frame_count = 4,
          scale = 0.5,
        })
      }
    },
    stateless_visualisation =
    {
      -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
      {
        count = 1,
        render_layer = "smoke",
        animation =
        {
          filename = "__space-age__/graphics/entity/sulfuric-acid-geyser/sulfuric-acid-geyser-gas-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.3,
          shift = util.by_pixel(-6, -89),
          scale = 1,
          tint = util.multiply_color({r=0.72, g=0.79, b=0.43}, 0.3)
        }
      },
      {
        count = 1,
        render_layer = "smoke",
        animation =
        {
           filename = "__space-age__/graphics/entity/sulfuric-acid-geyser/sulfuric-acid-geyser-gas-inner.png",
           frame_count = 47,
           line_length = 16,
           width = 40,
           height = 84,
           animation_speed = 0.4,
           shift = util.by_pixel(-4, -30),
           scale = 1,
           tint = util.multiply_color({r=1, g=0.84, b=0}, 0.5)
        }
      }
    },
    map_color = {0.78, 0.78, 0.1},
    map_grid = false
  },
  resource(
    {
      name = "scrap",
      order = "c",
      map_color = {0.9, 0.9, 0.9},
      mining_time = 0.5,
      walking_sound = sounds.ore,
      resource_patch_search_radius = 12,
      mining_visualisation_tint = {r = 0.77, g = 0.77, b = 0.9, a = 1.000}, -- #fae1a4ff
      factoriopedia_simulation = simulations.factoriopedia_scrap,
    },
    {
      probability_expression = 0
    }
  ),

  {
    type = "resource",
    name = "lithium-brine",
    icon = "__space-age__/graphics/icons/lithium-brine.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="a-b-a",
    highlight = true,
    normal = 50000,
    resource_patch_search_radius = 16,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "lithium-brine",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    walking_sound = sounds.oil,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
      --control = "lithium-brine",
      order="a[resources]-b[lithium]",
      --default_enabled = false,
      probability_expression = "aquilo_lithium_brine_probability",
      richness_expression = "aquilo_lithium_brine_richness"
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/lithium-brine/lithium-brine",
        {
          priority = "extra-high",
          frame_count = 4,
          scale = 0.5
        })
      }
    },

    draw_stateless_visualisation_under_building = false,
    stateless_visualisation =
    {
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = util.multiply_color({r=0.9, g=1, b=0.9}, 1),
          scale = 0.5
          --shift = util.by_pixel( 0.5, -54.0)
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = util.multiply_color({r=0.4, g=0.6, b=0.4}, 0.5),
          scale = 0.5
          --shift = util.by_pixel( 0.5, -54.0)
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, -40),
          scale = 0.5,
          tint = util.multiply_color({r=0.9, g=1, b=0.9}, 0.1),
        }
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -14),
          scale = 0.5,
          tint = util.multiply_color({r=0.4, g=0.6, b=0.4}, 0.1),
        }
      }
    },

    map_color = {0.7, 1.0, 0.6},
    map_grid = false,
    created_effect = create_tiles("snow-lumpy")
  },
  {
    type = "resource",
    name = "fluorine-vent",
    icon = "__space-age__/graphics/icons/fluorine-vent.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="b",
    infinite = true,
    highlight = true,
    minimum = 20000,
    normal = 100000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 16,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "fluorine",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    walking_sound = sounds.oil,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
      --control = "fluorine-vent",
      order="a[resources]-a[fluorine]",
      --default_enabled = false,
      probability_expression = "aquilo_flourine_vent_probability",
      richness_expression = "aquilo_flourine_vent_richness"
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/fluorine-vent/fluorine-vent",
        {
          priority = "extra-high",
          frame_count = 4,
          scale = 0.5
        })
      }
    },
    draw_stateless_visualisation_under_building = false,
    stateless_visualisation =
    {
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0.25, g=0.5, b=0.5,a= 1},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = {r=0, g=0.9, b=1,a= 0.35},
          scale = 0.75,
          shift = {0,-0.23}
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, 24 -152),
          scale = 1.5,
          tint = util.multiply_color({r=0.5, g=1, b=1}, 0.1)
        }
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 24 -78),
          scale = 1.5,
          tint = util.multiply_color({r=0, g=0.9, b=1}, 0.1)
        }
      }
    },
    map_color = {0.0, 0.8, 1.0},
    map_grid = false,
    created_effect = create_tiles("snow-patchy")
  }
})
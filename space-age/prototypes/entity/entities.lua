require ("sound-util")
require ("circuit-connector-sprites")
require ("util")
require ("__space-age__.prototypes.entity.circuit-network")
require ("__space-age__.prototypes.entity.space-platform-hub-cockpit")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local biochamber_pictures = require("__space-age__.prototypes.entity.biochamber-pictures")

data:extend({
  {
    type = "container",
    name = "factorio-logo-11tiles",
    icon = "__space-age__/graphics/icons/factorio-space-age-logo-11tiles.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1},
    max_health = 666,
    collision_box = {{-5.5+0.15, -1+0.15}, {5.5-0.15, 1-0.15}},
    selection_box = {{-5.5, -1}, {5.5, 1}},
    inventory_size = 1,
    picture =
    {
      filename = "__space-age__/graphics/entity/factorio-space-age-logo/factorio-space-age-logo-11tiles.png",
      priority = "very-low",
      width = 768,
      height = 256,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        decrease = 0,
        percent = 100
      },
      {
        type = "physical",
        decrease = 0,
        percent = 100
      },
      {
        type = "impact",
        decrease = 0,
        percent = 0
      },
      {
        type = "explosion",
        decrease = 0,
        percent = 100
      },
      {
        type = "acid",
        decrease = 0,
        percent = 100
      },
      {
        type = "laser",
        decrease = 0,
        percent = 100
      },
      {
        type = "electric",
        decrease = 0,
        percent = 100
      },
    },
  },
  {
    type = "assembling-machine",
    name = "biochamber",
    icon = "__space-age__/graphics/icons/biochamber.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "biochamber"},
    fast_replaceable_group = "biochamber",
    max_health = 300,
    corpse = "biochamber-remnants",
    dying_explosion = "biochamber-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["biochamber"],
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    effect_receiver = { base_effect = { productivity = 0.5 }},

    graphics_set = require("__space-age__.prototypes.entity.biochamber-pictures").graphics_set,
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.7},
      max_sounds_per_type = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 2,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"nutrients"},
      effectivity = 1,
      burner_usage = "nutrients",
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = -1 },
      light_flicker = require("__space-age__.prototypes.entity.biochamber-pictures").light_flicker
    },
    energy_usage = "500kW",
    heating_energy = "100kW",
    crafting_categories = {"organic", "organic-or-hand-crafting", "organic-or-assembling", "organic-or-chemistry"},
    fluid_boxes_off_when_no_fluid_recipe = true,
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
    production_health_effect = nil
  },

  {
    type = "space-platform-hub",
    name = "space-platform-hub",
    icon = "__space-age__/graphics/icons/space-platform-hub.png",
    flags = {"player-creation", "not-deconstructable"},
    subgroup = "space-platform",
    order = "b[space-platform-hub]",
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    max_health = 1000,
    weight = 40000,
    inventory_size = 59,
    dump_container = "crash-site-chest-1",
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["space-platform-hub"],
    default_speed_signal = {type = "virtual", name = "signal-V"},
    default_damage_taken_signal = {type = "virtual", name = "signal-D"},
    platform_repair_speed_modifier = 0.1,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 0
      }
    },
    graphics_set =
    {
      connections = require("__space-age__.graphics.entity.cargo-hubs.connections.platform-connections"),
      picture =
      {
        {
          render_layer = "lower-object-above-shadow",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-0-A",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-0-B",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-0-C",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-0-D",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "lower-object-overlay",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-1-A",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-1-B",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-1-C",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "object-under",
          layers =
          {
          util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-2",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "object",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-3",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-shadow",
            {
              scale = 0.5,
              shift = {8, 0},
              draw_as_shadow = true
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-emission-A",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-emission-B",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hubs/platform-hub-emission-C",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            }),
          }
        },
        {
          render_layer = "cargo-hatch",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-lower-hatch-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        },
        {
          render_layer = "above-inserters",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-upper-hatch-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            })
          }
        }
      },
      animation = cockpit_animation()
    },
    cargo_station_parameters =
    {
      hatch_definitions =
      {
        platform_upper_hatch({0.5, -3.5} , 2.25, 3, -0.5, procession_graphic_catalogue_types.hatch_emission_in_1),
        platform_upper_hatch({2, -3.5}   , 2.25, 3, -0.5, procession_graphic_catalogue_types.hatch_emission_in_2),
        platform_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.hatch_emission_in_3),
        platform_lower_hatch({-1.75, 0}  , 2   , 3, 0   , procession_graphic_catalogue_types.hatch_emission_out_1),
        platform_lower_hatch({-0.5, 0.5} , 1.5 , 3, 0   , procession_graphic_catalogue_types.hatch_emission_out_2),
        platform_lower_hatch({-2, 1}     , 1   , 3, 0   , procession_graphic_catalogue_types.hatch_emission_out_3),
      },
      giga_hatch_definitions =
      {
        platform_upper_giga_hatch({0,1,2}),
        platform_lower_giga_hatch({3,4,5}),
      }
    },
    persistent_ambient_sounds =
    {
      base_ambience = { filename = "__space-age__/sound/wind/base-wind-space-platform.ogg", volume = 0.8 },
      wind = { filename = "__space-age__/sound/wind/wind-space-platform.ogg", volume = 0.8 },
      crossfade =
      {
        order = { "wind", "base_ambience" },
        curve_type = "cosine",
        from = { control = 0.35, volume_percentage = 0.0 },
        to = { control = 2, volume_percentage = 100.0 }
      }
    },
    surface_render_parameters =
    {
      shadow_opacity = 0.5,
      space_dust_background =
      {
        animation_speed = 1,
        noise_texture =
        {
          filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
          size = 4096,
          premul_alpha = false
        },
        asteroid_texture =
        {
          filename = "__space-age__/graphics/space/asteroidTexture.png",
          size = 1024
        },
        asteroid_normal_texture =
        {
          filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
          size = 1024
        },
      },
      space_dust_foreground =
      {
        animation_speed = 1,
        noise_texture =
        {
          filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
          size = 4096,
          premul_alpha = false
        },
        asteroid_texture =
        {
          filename = "__space-age__/graphics/space/asteroidTexture.png",
          size = 1024
        },
        asteroid_normal_texture =
        {
          filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
          size = 1024
        },
      },
    }
  },
  {
    type = "cargo-bay",
    name = "cargo-bay",
    flags = {"placeable-player", "player-creation"},
    icon = "__space-age__/graphics/icons/cargo-bay.png",
    corpse = "cargo-bay-remnants",
    dying_explosion = "electric-furnace-explosion",
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2, -2}, {2, 2}},
    max_health = 1000,
    minable = {mining_time = 1, result = "cargo-bay"},
    inventory_size_bonus = 20,
    hatch_definitions =
    {
      shared_bay_hatch({-0.32, -1.5}, procession_graphic_catalogue_types.hatch_emission_bay)
    },
    graphics_set =
    {
      water_reflection =
      {
        pictures =
        {
          filename = "__space-age__/graphics/entity/cargo-hubs/bays/planet-bay-reflections.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          shift = util.by_pixel(0, 100),
          variation_count = 1,
          scale = 4
        },
        rotate = false,
        orientation_to_variation = false
      },
      connections = require("__base__.graphics.entity.cargo-hubs.connections.planet-connections"),
      picture =
      {
        {
          render_layer = "lower-object-above-shadow",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-0",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        },
        {
          render_layer = "object",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/planet-cargo-bay-3",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-shadow",
            {
              scale = 0.5,
              shift = {3, 0.5},
              draw_as_shadow = true
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-emission",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            })
          }
        },
        {
          render_layer = "cargo-hatch",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/planet-cargo-bay-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        }
      }
    },
    platform_graphics_set =
    {
      connections = require("__space-age__.graphics.entity.cargo-hubs.connections.platform-connections"),
      picture =
      {
        {
          render_layer = "lower-object-above-shadow",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-0",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        },
        {
          render_layer = "object",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/platform-cargo-bay-3",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-shadow",
            {
              scale = 0.5,
              shift = {3, 0.5},
              draw_as_shadow = true
            }),
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/bays/shared-cargo-bay-emission",
            {
              scale = 0.5,
              shift = {0, -1},
              draw_as_glow = true,
              blend_mode = "additive"
            })
          }
        },
        {
          render_layer = "cargo-hatch",
          layers =
          {
            util.sprite_load("__space-age__/graphics/entity/cargo-hubs/hatches/platform-cargo-bay-occluder",
            {
              scale = 0.5,
              shift = {0, -1}
            }),
          }
        }
      }
    }
  },
  {
    type = "asteroid-collector",
    name = "asteroid-collector",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    icon = "__space-age__/graphics/icons/asteroid-collector.png",
    factoriopedia_simulation = simulations.factoriopedia_asteroid_collector,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_mask = {layers={is_object = true, is_lower_object = true, transport_belt = true}},
    tile_buildability_rules =
    {
      {area = {{-1.4, -0.4}, {1.4, 1.4}}, required_tiles = {layers = {ground_tile = true}}, colliding_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
      {area = {{-1.4, -4.4}, {1.4, -0.6}}, required_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
    },
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 0
      }
    },
    arm_color_gradient =
    {
      {215, 212, 212},
      {229, 227, 229},
      {235, 235, 235},
      {240, 240, 243},
      {229, 245, 245},
      {253, 248, 253},
      {201, 198, 203},
      {204, 201, 202},
      {216, 212, 218},
      {223, 223, 224},
      {227, 212, 235},
      {245, 245, 245},
      {202, 197, 195},
      {245, 245, 245},
      {216, 223, 231},
      {255, 245, 255},
      {224, 219, 221},
      {224, 222, 249},
      {219, 216, 224},
      {231, 226, 238},
      {223, 223, 224},
      {255, 255, 255}
    },    
    tile_height = 3,
    tile_width = 3,
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "asteroid-collector",
    collection_radius = 7.5,
    collection_box_offset = 5.0,
    deposit_radius = 1.5,
    minimal_arm_swing_segment_retraction = 6,
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    munch_sound =
    {
      variations = sound_variations("__space-age__/sound/entity/asteroid-collector/asteroid-munch", 7, 0.8),
      aggregation = {max_count = 2, remove = true, count_already_playing = true},
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.4, volume_percentage = 0.0}, to = {2, 100.0}}},
      }
    },
    arm_extend_sound =
    {
      variations = sound_variations("__space-age__/sound/entity/asteroid-collector/arm-extend", 5, 0.7),
      aggregation = {max_count = 1, remove = true, count_already_playing = true},
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {3, 100.0}}},
      }
    },
    arm_retract_sound =
    {
      variations = sound_variations("__space-age__/sound/entity/asteroid-collector/arm-retract", 5, 0.7),
      aggregation = {max_count = 1, remove = true, count_already_playing = true},
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {3, 100.0}}},
      }
    },
    deposit_sound =
    {
      variations = sound_variations("__space-age__/sound/entity/asteroid-collector/asteroid-deposit", 5, 0.5),
      aggregation = {max_count = 2, remove = true, count_already_playing = true},
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {3, 100.0}}},
      }
    },
    passive_energy_usage = "200J",
    arm_energy_usage = "1kJ",
    arm_slow_energy_usage = "300J",
    energy_usage_quality_scaling = 0.1,
    head_collection_radius = 0.6,
    arm_count_base = 1,
    arm_count_quality_scaling = 1,
    arm_speed_base = 0.2,
    arm_speed_quality_scaling = 0.05,
    arm_angular_speed_cap_base = 0.2,
    arm_angular_speed_cap_quality_scaling = 0.05,
    tether_size = 0.35,
    unpowered_arm_speed_scale = 0.3;
    held_items_offset = 0.6,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
      --drain = "0.4kW"
    },
    inventory_size = 39,
    inventory_size_quality_increase = 5;
    arm_inventory_size = 5,
    arm_inventory_size_quality_increase = 0,
    max_health = 300,
    minable = {mining_time = 0.2, result = "asteroid-collector"},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    circuit_connector = circuit_connector_definitions["asteroid-collector"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    graphics_set = require("__space-age__.prototypes.entity.asteroid-collector-pictures"),
    radius_visualisation_picture =
    {
      filename = "__space-age__/graphics/entity/asteroid-collector/asteroid-collector-radius-visualization.png",
      size = 10
    }
  },
  {
    type = "assembling-machine",
    name = "crusher",
    icon = "__space-age__/graphics/icons/crusher.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "crusher"},
    fast_replaceable_group = "crusher",
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    circuit_wire_max_distance = 9,
    circuit_connector = circuit_connector_definitions["crusher"],
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    selection_box = {{-1, -1.5}, {1, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    module_slots = 2,
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.3}}
    },
    icon_draw_specification = {shift = {0, -0.45}},
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"crushing"},
    crafting_speed = 1,
    energy_usage = "540kW",
    heating_energy = "200kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/crusher/crusher-loop.ogg",
        volume = 0.8
      },
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      max_sounds_per_type = 3
    },
    graphics_set = require("__space-age__.prototypes.entity.crusher-pictures"),
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/crusher/crusher-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 40-32),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "thruster",
    name = "thruster",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    icon = "__space-age__/graphics/icons/thruster.png",
    collision_box = {{-1.7, -2.2}, {1.7, 2.2}},
    collision_mask = {layers={item=true, object=true, train=true, is_lower_object = true, is_object = true}},
    selection_box = {{-2, -2.5}, {2, 5.5}},
    tile_buildability_rules =
    {
      {area = {{-1.8, -2.3}, {1.8, 2.3}}, required_tiles = {layers={ground_tile=true}}, colliding_tiles = {layers={empty_space=true}}, remove_on_collision = true},
      {area = {{-1.8, 2.7}, {1.8, 90.3}}, required_tiles = {layers={empty_space=true}}, remove_on_collision = true},
    },
    max_health = 300,
    minable = {mining_time = 0.1, result = "thruster"},
    fast_replaceable_group = "thruster",
    impact_category = "metal",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 0
      }
    },
    min_performance = {fluid_volume = 0.1, fluid_usage = 0.1, effectivity = 1},
    max_performance = {fluid_volume = 0.8, fluid_usage = 2, effectivity = 0.51},
    fuel_fluid_box =
    {
      filter = "thruster-fuel",
      production_type = "input",
      -- pipe_covers = pipecoverspictures(),
      draw_only_when_connected = true,
      volume = 1000,
      pipe_connections =
      {
        {flow_direction = "input-output", direction = defines.direction.west, position = {-1.5, -2}, enable_working_visualisations = { "pipe-4" } },
        {flow_direction = "input-output", direction = defines.direction.east, position = { 1.5,  0}, enable_working_visualisations = { "pipe-2" } },
      }
    },
    oxidizer_fluid_box =
    {
      filter = "thruster-oxidizer",
      production_type = "input",
      -- pipe_covers = pipecoverspictures(),
      draw_only_when_connected = true,
      volume = 1000,
      pipe_connections =
      {
        {flow_direction = "input-output", direction = defines.direction.east, position = { 1.5, -2}, enable_working_visualisations = { "pipe-1" }},
        {flow_direction = "input-output", direction = defines.direction.west, position = {-1.5,  0}, enable_working_visualisations = { "pipe-3" }},
      }
    },
    placeable_position_visualization =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      size = 64,
      scale = 0.5,
      x = 3 * 64
    },

    graphics_set =
    {
      animation = util.sprite_load("__space-age__/graphics/entity/thruster/thruster",
                  {
                    animation_speed = 0.5,
                    frame_count = 64,
                    scale = 0.5,
                    shift = {0,3}
                  }),

      integration_patch_render_layer = "floor",
      integration_patch = util.sprite_load("__space-age__/graphics/entity/thruster/thruster-bckg",
                          {
                            scale = 0.5,
                            shift = {0,3}
                          }),

      working_visualisations =
      {
        {
          always_draw = true,
          name = "pipe-1",
          enabled_by_name = true,
          animation =
          {
            filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-1.png",
            width = 384,
            height = 832,
            shift = util.by_pixel(0, 95),
            scale = 0.5
          }
        },
        {
          always_draw = true,
          name = "pipe-2",
          enabled_by_name = true,
          animation =
          {
            filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-2.png",
            width = 384,
            height = 832,
            shift = util.by_pixel(0, 96),
            scale = 0.5
          }
        },
        {
          always_draw = true,
          name = "pipe-3",
          enabled_by_name = true,
          animation =
          {
            filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-3.png",
            width = 384,
            height = 832,
            shift = util.by_pixel(0, 96),
            scale = 0.5
          }
        },
        {
          always_draw = true,
          name = "pipe-4",
          enabled_by_name = true,
          animation =
          {
            filename = "__space-age__/graphics/entity/thruster/thruster-pipe-connection-4.png",
            width = 384,
            height = 832,
            shift = util.by_pixel(0, 95),
            scale = 0.5
          }
        },

        {
          -- effect = "flicker",
			    fadeout = true,
			    animation = util.sprite_load("__space-age__/graphics/entity/thruster/thruster-light",
				              {
				                animation_speed = 0.5,
				                frame_count = 64,
				                blend_mode = "additive",
				                draw_as_glow = true,
				                scale = 0.5,
				                shift = {0,3}
				              }),
        },
      },
      flame_effect =
      {
        filename = "__space-age__/graphics/entity/thruster/thruster-flame.png",
        width = 384,
        height = 832
      },
      flame_position = {0, 5.5},
      flame_half_height = 0,
      flame_effect_height = 1000 / 32,
      flame_effect_width = 384 / 64,
      flame_effect_offset = 50 / 32,
    },

    plumes =
    {
      min_probability = 0.08,
      max_probability = 1,
      min_y_offset = -4,
      max_y_offset = 0,
      stateless_visualisations =
      {
        {
          offset_x = { -0.1, 0.1 },
          offset_y = { 10.5, 10.5 },
          offset_z = { 0.0 , 0.0 },

          speed_x = { -0.014, 0.014 },
          speed_y = { 0.5, 0.7 },
          speed_z = { -0.014, 0.014 },

          probability = 0.3,
          count = 3,
          age_discrimination = -10,
          period = 200,
          fade_in_progress_duration = 0.25,
          fade_out_progress_duration = 0.6,
          spread_progress_duration = 0.375,
          begin_scale = 0.25,
          end_scale = 1.25,
          affected_by_wind = false,
          render_layer = "smoke",
          can_lay_on_the_ground = false,
          animation =
          {
            width = 253,
            height = 210,
	          scale = 0.5,
            line_length = 8,
            frame_count = 60,
            shift = {0, 0},
            priority = "high",
            animation_speed = 0.25,
            tint = {r = 1, b = 0.95, g = 0.97, a = 0.5},
            filename = "__space-age__/graphics/entity/thruster/thruster-smoke.png",
            flags = { "smoke" }
          }
        },
        {
          offset_x = { -0.2, 0.2 },
          offset_y = { 14.5, 14.5 },
          offset_z = { 0.0 , 0.0 },

          speed_x = { -0.014, 0.014 },
          speed_y = { 0.55, 0.65 },
          speed_z = { -0.014, 0.014 },

          probability = 0.5,
          period = 60,
          age_discrimination = -6,
          fade_in_progress_duration = 0.5,
          fade_out_progress_duration = 0.5,
          begin_scale = 0.5,
          end_scale = 1.25,
          affected_by_wind = false,
          render_layer = "smoke",
          can_lay_on_the_ground = false,
          animation =
          {
            width = 2024/8,
            height = 1216/8,
            line_length = 8,
            frame_count = 60,
            shift = {0, 0},
            priority = "high",
            animation_speed = 0.25,
            tint = {r = 0.75, b = 0.75, g = 0.75, a = 1},
            filename = "__space-age__/graphics/entity/thruster/thruster-smoke-glow.png",
            flags = { "smoke" },
            draw_as_glow = true
          }
        },
        {
          offset_x = { -0.25, 0.25 },
          offset_y = { 13.0, 13.0 },
          offset_z = { 0.0 , 0.0 },

          speed_x = { -0.014, 0.014 },
          speed_y = { 0.5, 0.7 },
          speed_z = { -0.014, 0.014 },

          probability = 0.2,
          count = 2,
          period = 200,
          --age_discrimination = 0,
          fade_in_progress_duration = 0.3,
          fade_out_progress_duration = 0.7,
          begin_scale = 0.5,
          end_scale = 3.0,
          affected_by_wind = false,
          render_layer = "smoke",
          can_lay_on_the_ground = false,
          animation =
          {
            width = 253,
            height = 210,
            line_length = 8,
            frame_count = 60,
            shift = {0, 0},
            priority = "high",
            animation_speed = 0.1,
            tint = {r = 1, b = 0.95, g = 0.97, a = 1.0},
            filename = "__space-age__/graphics/entity/thruster/thruster-smoke.png",
            flags = { "smoke" }
          }
        }
      }
    },
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      main_sounds =
      {
        {
          sound =
          {
            filename = "__space-age__/sound/entity/platform-thruster/thruster-burner.ogg",
            volume = 0.3,
            speed_smoothing_window_size = 60,
            advanced_volume_control = {attenuation = "exponential"},
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {multiplier = 2.0},
          match_speed_to_activity = true,
          activity_to_speed_modifiers = {multiplier = 1.2},
          audible_distance_modifier = 0.8
        },
      },
      sound_accents =
      {
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-mechanic-stop", 5, 0.5),
            advanced_volume_control =
            {
              fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 3, 100.0 } } },
            }
          },
          frame = 25,
          audible_distance_modifier = 0.3,
        },
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-mechanic-move", 5, 0.3),
            advanced_volume_control =
            {
              fades = { fade_in = { curve_type = "S-curve", from = { control = 0.5, volume_percentage = 0.0 }, to = { 3, 100.0 } } },
            }
          },
          frame = 52,
          audible_distance_modifier = 0.3,
        },
      },
      max_sounds_per_type = 2,
      use_doppler_shift = false,
      extra_sounds_ignore_limit = true,
      activate_sound = { variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-engine-activate", 3, 0.3) },
      deactivate_sound = { variations = sound_variations("__space-age__/sound/entity/platform-thruster/thruster-engine-deactivate", 3, 0.3) },
    },
  },
  {
    type = "assembling-machine",
    name = "foundry",
    icon = "__space-age__/graphics/icons/foundry.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "foundry"},
    fast_replaceable_group = "foundry",
    max_health = 350,
    corpse = "foundry-remnants",
    dying_explosion = "foundry-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    heating_energy = "300kW",
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1.3,
    effect_receiver = { base_effect = { productivity = 0.5 }},
    module_slots = 4,
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"metallurgy", "pressing", "crafting-with-fluid-or-metallurgy", "metallurgy-or-assembling"},
    crafting_speed = 4,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "2500kW",
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0, maximum = 20 },
    graphics_set = require("__space-age__.prototypes.entity.foundry-pictures").graphics_set,
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/foundry/foundry.ogg", volume = 0.5
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      sound_accents =
      {
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-out.ogg", volume = 0.9 }, frame = 2, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-close.ogg", volume = 0.65 }, frame = 18, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-clamp.ogg", volume = 0.45 }, frame = 39, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-stop.ogg", volume = 0.7 }, frame = 43, audible_distance_modifier = 0.4 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-fire-whoosh", 3, 0.8 )}, frame = 64, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-metal-clunk.ogg", volume = 0.65 }, frame = 64, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-open.ogg", volume = 0.65 }, frame = 74, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-in.ogg", volume = 0.75 }, frame = 106, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-smoke-puff.ogg", volume = 0.8 }, frame = 106, audible_distance_modifier = 0.3 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-pour", 2, 0.7 )}, frame = 110 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-rocks.ogg", volume = 0.65 }, frame = 120, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-blade.ogg", volume = 0.7 }, frame = 126 },
      },
      audible_distance_modifier = 0.6,
      max_sounds_per_type = 2
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -2} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    water_reflection =
    {
      pictures = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-reflection",
      {
          scale = 5,
          shift = {0,2}
      }),
      rotate = false
    }
  },
  {
    type = "agricultural-tower",
    name = "agricultural-tower",
    icon = "__space-age__/graphics/icons/agricultural-tower.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "agricultural-tower"},
    fast_replaceable_group = "agricultural-tower",
    max_health = 500,
    corpse = "agricultural-tower-remnants",
    dying_explosion = "agricultural-tower-explosion",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    input_inventory_size = 3,
    radius_visualisation_picture =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    radius = 3,
    crane = require("__space-age__.prototypes.entity.agricultural-tower-crane"),
    planting_procedure_points =
    {
      {0.0, 0.0, 0.75},
      {0.0, 0.0, 0.0},
      {0.0, 0.05, -0.05},
      {0.0353553, 0.0353553, -0.1},
      {0.05, 0.0, -0.15},
      {0.0353553, -0.0353553, -0.2},
      {0.0, -0.05, -0.25},
      {-0.0353553, -0.0353553, -0.3},
      {-0.05, 0.0, -0.35},
      {-0.0353553, 0.0353553, -0.4},
      {0.0, 0.0, -0.45},
      {0.0, 0.0, 0.0}
    },
    harvesting_procedure_points =
    {
      {0.0, 0.0, 1.0}
    },
    drawing_box_vertical_extension = 2.5,
    heating_energy = "100kW",
    energy_usage = "100kW",
    crane_energy_usage = "100kW",
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-hub-loop.ogg", volume = 0.7},
      max_sounds_per_type = 4,
      audible_distance_modifier = 0.7,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    central_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-loop.ogg", volume = 0.3},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-stop.ogg", volume = 0.5}
    },
    central_orienting_sound_source = "hub",
    arm_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-stop.ogg", volume = 0.6}
    },
    arm_extending_sound_source = "arm_central_joint",
    grappler_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-stop.ogg", volume = 0.4}
    },
    grappler_orienting_sound_source = "grappler-hub",
    grappler_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-loop.ogg", volume = 0.4},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-stop.ogg", volume = 0.45}
    },
    grappler_extending_sound_source = "grappler-hub",
    planting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-planting", 5, 0.7),
    harvesting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting", 6, 0.6),
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 2000
      }
    },
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { spores = 4 } -- necessary so attack groups find the entity
    },
    circuit_connector = circuit_connector_definitions["agricultural-tower"],
    circuit_wire_max_distance = 30,
    graphics_set =
    {
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            priority = "high",
            animation_speed = 0.25,
            frame_count = 64,
            scale = 0.5
          }),
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-shadow",
          {
            priority = "high",
            frame_count = 1,
            repeat_count = 64,
            draw_as_shadow = true,
            scale = 0.5
          })
        }
      },
      recipe_not_set_tint = { primary = {r = 0.6, g = 0.6, b =  0.5, a = 1}, secondary = {r = 0.6, g =  0.6, b = 0.5, a = 1} },
      working_visualisations =
      {
        {
          always_draw = true,
          fog_mask = { rect = {{-30, -30}, {30, -2.75}}, falloff = 1 },
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            frame_count = 1,
            scale = 0.5
          }),
        },

        {
          --constant_speed = true,
          always_draw = true,
          apply_recipe_tint = "primary",
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-plant-mask",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            tint_as_overlay = true,
            scale = 0.5
          }),
        },
        {
          --constant_speed = true,
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-light",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            blend_mode = "additive",
            scale = 0.5
          }),
        },
        {
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 6, shift = {-0.45, -0.25}, color = {r = 1, g = 1, b = 1}}
        },
        {
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 16, shift = {-1.2, -0.5}, color = {r = 1, g = 1, b = 1}}
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 36,
          shift = util.by_pixel(0, 20),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
  {
    type = "assembling-machine",
    name = "captive-biter-spawner",
    icon = "__space-age__/graphics/icons/captive-biter-spawner.png",
    subgroup = "agriculture",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable", "not-deconstructable"},
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    create_ghost_on_death = false,
    max_health = 350,
    show_recipe_icon = false,
    impact_category = "organic",
    production_health_effect =
    {
      not_producing = -1 / 60, -- 5 hp per second
      producing = 1 / 60 -- 5 hp per second
    },
    ignore_output_full = true,
    alert_icon_shift = util.by_pixel(0, -12),
    icon_draw_specification = {shift = {0, -0.3}},
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-explosion",
          entity_name = "captive-spawner-explosion-1"
        }
      }
    },
    dying_explosion = "captive-spawner-explosion-2",
    dying_trigger_effect =
    {
      type = "create-entity",
      entity_name = "biter-spawner",
      as_enemy = true,
      ignore_no_enemies_mode = true,
      protected = true
    },
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 1000
      }
    },
    fast_replaceable_group = "captive-biter-spawner",
    graphics_set =
    {
      animation = {
        layers = {
          util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-anim",{
            frame_count = 32,
            scale = 0.5,
            animation_speed = 0.4,
          }),
          util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-shadow",{
            frame_count = 32,
            scale = 0.5,
            animation_speed = 0.4,
            draw_as_shadow = true,
          })
        }
      },
      working_visualisations = {
        {
          fadeout = true,
          animation = util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-fluids",{
            frame_count = 32,
            scale = 0.5,
            tint = {0.25,0.44,0,1},
            animation_speed = 0.4,
          })
        },
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6 },
      sound_accents =
      {
        {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-push", 3, 0.3)}, frame = 1, audible_distance_modifier = 0.6},
        {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-pull", 3, 0.3)}, frame = 17, audible_distance_modifier = 0.6},
      },
    },
    crafting_categories = {"captive-spawner-process"},
    fixed_recipe = "biter-egg",
    crafting_speed = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"food"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = -1 },
      burner_usage = "food",
      light_flicker =
      {
        minimum_intensity = 0,
        maximum_intensity = 0,
        derivation_change_frequency = 0,
        derivation_change_deviation = 0,
        border_fix_speed = 0,
        minimum_light_size = 0,
        light_intensity_to_size_coefficient = 0,
        color = {0, 0, 0, 1}
      }
    },
    energy_usage = "100kW",
    module_slots = 0,
    allowed_effects = {},
    enable_logistic_control_behavior = false
  },
  {
    type = "lab",
    name = "biolab",
    icon = "__space-age__/graphics/icons/biolab.png",
    minable = {mining_time = 0.5, result = "biolab"},
    subgroup = "production-machine",
    order = "z-z[z-lab]",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 350,
    impact_category = "organic",
    alert_icon_shift = util.by_pixel(0, -12),
    icon_draw_specification = {shift = {0, -0.3}},
    corpse = "biolab-remnants",
    dying_explosion = "biolab-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 1000
      }
    },
    damaged_trigger_effect = hit_effects.entity(),
    on_animation = {
      layers = {
        util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
          frame_count = 32,
          scale = 0.5,
          animation_speed = 0.2,
        }),
        util.sprite_load("__space-age__/graphics/entity/biolab/biolab-lights",{
          frame_count = 32,
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
          animation_speed = 0.2,
        }),
        util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
          frame_count = 32,
          scale = 0.5,
          animation_speed = 0.2,
          draw_as_shadow = true,
        })
      }
    },
    off_animation = {
      layers = {
        util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
          frame_count = 32,
          scale = 0.5,
          animation_speed = 0.2,
        }),
        util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
          frame_count = 32,
          scale = 0.5,
          animation_speed = 0.2,
          draw_as_shadow = true,
        })
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biolab/biolab-loop.ogg", volume = 0.7},
      sound_accents =
      {
        {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-push", 3, 0.3)}, frame = 1, audible_distance_modifier = 0.6},
        {sound = {variations = sound_variations("__space-age__/sound/entity/biolab/biolab-beaker", 7, 0.8)}, frame = 1, audible_distance_modifier = 0.4},
        {sound = {variations = sound_variations("__space-age__/sound/entity/biolab/biolab-centrifuge", 4, 0.7)}, frame = 14, audible_distance_modifier = 0.3},
        {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-pull", 3, 0.3)}, frame = 17, audible_distance_modifier = 0.6},
      },
      max_sounds_per_type = 2,
    },
    researching_speed = 2,
    inputs =
    {
      "automation-science-pack",
      "logistic-science-pack",
      "military-science-pack",
      "chemical-science-pack",
      "production-science-pack",
      "utility-science-pack",
      "space-science-pack",
      "metallurgic-science-pack",
      "agricultural-science-pack",
      "electromagnetic-science-pack",
      "cryogenic-science-pack",
      "promethium-science-pack"
    },
    science_pack_drain_rate_percent = 50,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 8 }
    },
    energy_usage = "300kW",
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    icons_positioning =
    {
      {inventory_index = defines.inventory.lab_modules, shift = {0, 1.6}},
      {inventory_index = defines.inventory.lab_input, shift = {0, 0.4}, max_icons_per_row = 6, separation_multiplier = 1/1.1}
    }
  },

  {
    type = "assembling-machine",
    name = "electromagnetic-plant",
    icon = "__space-age__/graphics/icons/electromagnetic-plant.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "electromagnetic-plant"},
    fast_replaceable_group = "electromagnetic-plant",
    max_health = 350,
    corpse = "electromagnetic-plant-remnants",
    dying_explosion = "electromagnetic-plant-explosion",
    icon_draw_specification = {shift = {0, -0.25}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["electromagnetic-plant"],
    heating_energy = "100kW",
    effect_receiver = { base_effect = { productivity = 0.5 }},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 200,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.west, position = {-1.5, 0.5} }}
      },
      {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 200,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.east, position = {1.5, -0.5} }}
      },
      {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.south, position = {0.5, 1.5} }}
      },
      {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        secondary_draw_orders = { north = -1 },
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.north, position = {-0.5, -1.5} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    forced_symmetry = "horizontal",
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0, maximum = 10},
    graphics_set = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").graphics_set,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = space_age_sounds.electromagnetic_plant,
    crafting_speed = 2,
    crafting_categories = {"electromagnetics", "electronics", "electronics-with-fluid", "electronics-or-assembling"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "2000kW",
    module_slots = 5,
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 1}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    water_reflection = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").water_reflection,
  },

  {
    type = "lightning-attractor",
    name = "lightning-rod",
    efficiency = 0.2,
    range_elongation = 15.0,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "500MJ",
      usage_priority = "primary-output",
      output_flow_limit = "500MJ",
      drain = "2.5MJ"
    },
    icon = "__space-age__/graphics/icons/lightning-rod.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "lightning-rod"},
    max_health = 100,
    corpse = "lightning-rod-remnants",
    dying_explosion = "medium-electric-pole-explosion",
    factoriopedia_simulation = simulations.factoriopedia_lightning_rod,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "electric",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    lightning_strike_offset = {0, -4.1},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    drawing_box_vertical_extension = 4.3,
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    working_sound =
    {
      main_sounds =
      {
        {
          sound = {filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-charge.ogg", volume = 0.5},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 2, inverted = true},
        },
        {
          sound = {filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-discharge.ogg", volume = 0.5},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 1},
        }
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5,
    },
    chargable_graphics = require("__space-age__.prototypes.entity.lightning-rod-graphics"),
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/lightning-rod/lightning-rod.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "lightning-attractor",
    name = "lightning-collector",
    efficiency = 0.4,
    range_elongation = 25.0,
    icon = "__space-age__/graphics/icons/lightning-collector.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "lightning-collector"},
    max_health = 200,
    corpse = "lightning-collector-remnants",
    dying_explosion = "substation-explosion",
    factoriopedia_simulation = simulations.factoriopedia_lightning_collector,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1000MJ",
      usage_priority = "primary-output",
      output_flow_limit = "1000MJ",
      drain = "2.5MJ"
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "electric",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    lightning_strike_offset = {0, -4.8},
    damaged_trigger_effect = hit_effects.entity({{-0.5, -2.5}, {0.5, 0.5}}),
    drawing_box_vertical_extension = 4.5,
    impact_category = "metal",
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,

    chargable_graphics = require("__space-age__.prototypes.entity.lightning-collector-graphics"),
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/lightning-collector/lightning-collector-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    },

    working_sound =
    {
      main_sounds =
      {
        {
          sound = {filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-charge.ogg", volume = 0.7},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 2, inverted = true},
        },
        {
          sound = {filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-discharge.ogg", volume = 0.8},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 1},
        }
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5,
    },
  },
  {
    type = "assembling-machine",
    name = "cryogenic-plant",
    icon = "__space-age__/graphics/icons/cryogenic-plant.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "cryogenic-plant"},
    fast_replaceable_group = "cryogenic-plant",
    max_health = 350,
    corpse = "cryogenic-plant-remnants",
    dying_explosion = "cryogenic-plant-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["cryogenic-plant"],
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    heating_energy = "100kW",
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 8,
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.95}, max_icons_per_row = 4}
    },
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"cryogenics", "chemistry-or-cryogenics", "cryogenics-or-assembling"},
    crafting_speed = 2,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "1500kW",
    graphics_set = require("__space-age__.prototypes.entity.cryogenic-plant-pictures").graphics_set,
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/cryogenic-plant/cryogenic-plant.ogg", volume = 0.8
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      fade_in_ticks = 4,
      fade_out_ticks = 30,
      sound_accents =
      {
        { sound = { variations = sound_variations("__space-age__/sound/entity/cryogenic-plant/cp-smoke-mask-puff", 2, 0.35 )}, frame = 11, audible_distance_modifier = 0.8 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/cryogenic-plant/cp-smoke-mask-puff", 2, 0.3 )}, frame = 130, audible_distance_modifier = 0.8 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-rise.ogg", volume = 0.9 }, frame = 14, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-fall.ogg", volume = 0.7 }, frame = 62, audible_distance_modifier = 0.3},
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-rise.ogg", volume = 0.9 }, frame = 110, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim3-bubbles-fall.ogg", volume = 0.7 }, frame = 158, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim5-gears.ogg", volume = 0.25 }, frame = 51, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim5-gears.ogg", volume = 0.2 }, frame = 151, audible_distance_modifier = 0.4 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/cryogenic-plant/cp-anim6-open", 2, 0.6 )}, frame = 3, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-close.ogg", volume = 0.7 }, frame = 33, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-slide-down.ogg", volume = 0.55 }, frame = 42, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-slide-up.ogg", volume = 0.6 }, frame = 126, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/cryogenic-plant/cp-anim6-slide-stop.ogg", volume = 0.4 }, frame = 146, audible_distance_modifier = 0.4 },
      },
      max_sounds_per_type = 2
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-2, 2} }}
      },
      {
        production_type = "input",
        pipe_picture =  require("__space-age__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
        pipe_picture_frozen =  require("__space-age__.prototypes.entity.cryogenic-plant-pictures").pipe_picture_frozen,
        always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {0, 2} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {2, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-2, -2} }}
      },
      {
        production_type = "output",
        pipe_picture =  require("__space-age__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
        pipe_picture_frozen =  require("__space-age__.prototypes.entity.cryogenic-plant-pictures").pipe_picture_frozen,
        always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {2, -2} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    water_reflection =
    {
      pictures = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-reflection",
      {
          scale = 5,
          shift = {0,2}
      }),
      rotate = false,
    }
  },
  {
    type = "reactor",
    name = "heating-tower",
    icon  = "__space-age__/graphics/icons/heating-tower.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "heating-tower"},
    max_health = 500,
    corpse = "heating-tower-remnants",
    dying_explosion = "heating-tower-explosion",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 10
      }
    },
    consumption = "40MW",
    neighbour_bonus = 0,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      emissions_per_minute = {pollution = 100},
      effectivity = 2.5,
      fuel_inventory_size = 2,
      burnt_inventory_size = 2,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.7,
        maximum_intensity = 0.95
      }
    },
    collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,

    picture =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-main", {
         scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-shadow", {
          scale = 0.5,
          draw_as_shadow = true
        })
      }
    },

    working_light_picture =
    {
      layers = {
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-working-fire", {
          frame_count = 24,
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true,
          animation_speed = 0.333
        }),
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-working-light", {
          frame_count = 1,
          repeat_count = 24,
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true
        })
      }
    },

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "5MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 50,
      connections =
      {
        {
          position = {0, -1},
          direction = defines.direction.north
        },
        {
          position = {1, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 1},
          direction = defines.direction.south
        },
        {
          position = {-1, 0},
          direction = defines.direction.west
        },
      },

    heat_picture = apply_heat_pipe_glow(
      util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-glow", {
        scale = 0.5,
        blend_mode = "additive"
      }))
    },

    connection_patches_connected =
    {
      sheet = util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes", {
        scale = 0.5,
        variation_count = 4
      })
    },

    connection_patches_disconnected =
    {
      sheet = util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-disconnected", {
        scale = 0.5,
        variation_count = 4
      })
    },

    heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow(
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-heat", {
        scale = 0.5,
        variation_count = 4
      }))
    },

    heat_connection_patches_disconnected =
    {
      sheet = apply_heat_pipe_glow(
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-heat-disconnected", {
        scale = 0.5,
        variation_count = 4
      }))
    },

    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity//heating-tower/heating-tower-loop.ogg", volume = 0.5},
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["heating-tower"]
  },

  scaled_cliff(
    {
      mod_name = "__space-age__",
      name = "cliff-vulcanus",
      map_color = {144, 119, 87},
      suffix = "vulcanus",
      subfolder = "vulcanus",
      scale = 1.0,
      has_lower_layer = true,
      sprite_size_multiplier = 2,
      factoriopedia_simulation = simulations.factoriopedia_cliff_vulcanus
    }
  ),
  scaled_cliff(
    {
      mod_name = "__space-age__",
      name = "cliff-gleba",
      map_color = {144, 119, 87},
      suffix = "gleba",
      subfolder = "gleba",
      scale = 1.0,
      has_lower_layer = true,
      sprite_size_multiplier = 2,
      factoriopedia_simulation = simulations.factoriopedia_cliff_gleba
    }
  ),
  scaled_cliff(
    {
      mod_name = "__space-age__",
      name = "cliff-fulgora",
      map_color = {144, 119, 87},
      suffix = "fulgora",
      subfolder = "fulgora",
      scale = 1.0,
      collision_mask =
      {
        layers =
        { -- collision_mask: Allow over oil ocean but not water
          player=true, -- collide with things the player does
          floor=true, -- also collide with floor layer to not allow belts
          cliff = true,
          is_object=true,
          is_lower_object=true,
        -- it can't collide with object layer becuase of the other oil ocean masks, the same as rail-support
        },
        not_colliding_with_itself=true,
      },
      has_lower_layer = true,
      sprite_size_multiplier = 2,
      factoriopedia_simulation = simulations.factoriopedia_cliff_fulgora
    }
  ),
  {
    type = "trivial-smoke",
    name = "aquilo-snow-smoke",
    duration = 600,
    fade_in_duration = 200,
    fade_away_duration = 200,
    spread_duration= 400,
    start_scale = 1,
    end_scale = 1,
    color = {0.8, 1, 0.9},
    cyclic = true,
    affected_by_wind = true,
    --movement_slow_down_factor = 0.0001,
    animation =
    {
      width = 64,
      height = 64,
      line_length = 16,
      frame_count = 16,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.0001,
      filename = "__space-age__/graphics/entity/snow/snow.png",
      flags = { "smoke" }
    },
    --vertical_speed_slowdown = 0.001
  },
  {
    type = "trivial-smoke",
    name = "gleba-raindrops",
    duration = 30,
    fade_in_duration = 10,
    fade_away_duration = 10,
    spread_duration = 30,
    start_scale = 1,
    end_scale = 0.8,
    --color = {0.8, 1, 0.9},
    cyclic = true,
    affected_by_wind = false,
    --movement_slow_down_factor = 0,
    --vertical_speed_slowdown = 0,
    animation =
    {
      width = 256,
      height = 256,
      line_length = 2,
      frame_count = 4,
      priority = "high",
      animation_speed = 0.0001,
      scale = 0.5,
      filename = "__space-age__/graphics/entity/rain/rain.png",
      flags = { "smoke" }
    }
  }

})

data:extend({
  {
    type = "fusion-generator",
    name = "fusion-generator",
    factoriopedia_description = {"factoriopedia-description.fusion-generator"},
    icon = "__space-age__/graphics/icons/fusion-generator.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "fusion-generator"},
    max_health = 1000,
    impact_category = "metal",
    corpse = "fusion-generator-remnants",
    dying_explosion = "fusion-generator-explosion",
    -- alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.4, -2.4}, {1.4, 2.4}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "fusion-generator",
    graphics_set = require ("__space-age__.prototypes.entity.fusion-system-pictures").generator_graphics_set,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/fusion/fusion-generator.ogg",
        volume = 0.15,
        speed_smoothing_window_size = 60,
        advanced_volume_control = {attenuation = "exponential"}
      },
      use_doppler_shift = false,
      match_speed_to_activity = true,
      activity_to_speed_modifiers = {multiplier = 1.2},
      match_volume_to_activity = true,
      audible_distance_modifier = 0.8,
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0 },

    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output",
      output_flow_limit = "50MW", -- This is used to define max power output. 50MW at normal quality
    },
    max_fluid_usage = 2/second, -- at normal quality

    input_fluid_box =
    {
      production_type = "input",
      --pipe_covers = pipecoverspictures(),
      volume = 10,
      filter = "fusion-plasma",
      pipe_connections =
      {
        { flow_direction="input",  direction = defines.direction.south, position = {-1,  2}, connection_category = {"fusion-plasma"} },
        { flow_direction="input",  direction = defines.direction.south, position = { 1,  2}, connection_category = {"fusion-plasma"} },
        { flow_direction="output", direction = defines.direction.north, position = { 0, -2}, connection_category = {"fusion-plasma"} },
        { flow_direction="output", direction = defines.direction.west,  position = {-1,  0}, connection_category = {"fusion-plasma"} },
        { flow_direction="output", direction = defines.direction.east,  position = { 1,  0}, connection_category = {"fusion-plasma"} },
        { flow_direction="output", direction = defines.direction.west,  position = {-1, -1}, connection_category = {"fusion-plasma"} },
        { flow_direction="output", direction = defines.direction.east,  position = { 1, -1}, connection_category = {"fusion-plasma"} },
      },
    },
    output_fluid_box =
    {
      production_type = "output",
      pipe_covers = pipecoverspictures(),
      volume = 100,
      filter = "fluoroketone-hot",
      pipe_connections =
      {
        { flow_direction="output", direction = defines.direction.north, position = {-1, -2} },
        { flow_direction="output", direction = defines.direction.north, position = {1, -2} },
      }
    }
  },
  {
    type = "fusion-reactor",
    name = "fusion-reactor",
    factoriopedia_description = {"factoriopedia-description.fusion-reactor"},
    icon = "__space-age__/graphics/icons/fusion-reactor.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "fusion-reactor"},
    max_health = 1000,
    impact_category = "metal",
    corpse = "fusion-reactor-remnants",
    dying_explosion = "fusion-reactor-explosion",
    -- alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3, -3}, {3, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "fusion-reactor",
    neighbour_connectable =
    {
      connections =
      {
        { location = { position = { -1.5, -3   }, direction = defines.direction.north }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  1.5, -3   }, direction = defines.direction.north }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  3,   -1.5 }, direction = defines.direction.east  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  3,    1.5 }, direction = defines.direction.east  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = {  1.5,  3   }, direction = defines.direction.south }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = { -1.5,  3   }, direction = defines.direction.south }, category = "fusion-reactor-plasma",  neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = { -3,    1.5 }, direction = defines.direction.west  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
        { location = { position = { -3,   -1.5 }, direction = defines.direction.west  }, category = "fusion-reactor-coolant", neighbour_category = {"fusion-reactor-plasma", "fusion-reactor-coolant"} },
      }
    },

    two_direction_only = true,
    graphics_set = require ("__space-age__.prototypes.entity.fusion-system-pictures").reactor_graphics_set,
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/fusion/fusion-reactor.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 1.44)},
      use_doppler_shift = false,
      match_volume_to_activity = true,
      max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0 },

    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,

    energy_source =
    {
      type = "electric",
      usage_priority = "primary-input",
    },
    power_input = "10MW", -- at normal quality
    max_fluid_usage = 4/second, -- at normal quality

    burner =
    {
      type = "burner",
      fuel_categories = {"fusion"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 0 },
      light_flicker =
      {
        color = {1,0,0.7},
        minimum_intensity = 0.0,
        maximum_intensity = 0.1,
      }
    },
    input_fluid_box =
    {
      production_type = "input",
      volume = 1000,
      filter = "fluoroketone-cold",
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.west, position = {-2.5, -1.5} },
        { flow_direction = "input-output", direction = defines.direction.west, position = {-2.5,  1.5} },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2.5, -1.5} },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2.5,  1.5} },
      },
    },
    output_fluid_box =
    {
      production_type = "output",
      volume = 10,
      filter = "fusion-plasma",
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.south, position = {-1.5,  2.5}, connection_category = {"fusion-plasma"} },
        { flow_direction = "input-output", direction = defines.direction.south, position = { 1.5,  2.5}, connection_category = {"fusion-plasma"} },
        { flow_direction = "input-output", direction = defines.direction.north, position = {-1.5, -2.5}, connection_category = {"fusion-plasma"} },
        { flow_direction = "input-output", direction = defines.direction.north, position = { 1.5, -2.5}, connection_category = {"fusion-plasma"} },
      }
    }
  }
})

data:extend({
  {
    type = "inserter",
    name = "stack-inserter",
    icon = "__space-age__/graphics/icons/stack-inserter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    stack_size_bonus = 4,
    bulk = true,
    grab_less_to_match_belt_stack = true,
    wait_for_full_hand = true,
    enter_drop_mode_if_held_stack_spoiled = true,
    max_belt_stack_size = 4,
    minable = { mining_time = 0.1, result = "stack-inserter" },
    max_health = 160,
    corpse = "stack-inserter-remnants",
    dying_explosion = "stack-inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = hit_effects.entity(),
    starting_distance = 0.85,
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    energy_per_movement = "40kJ",
    energy_per_rotation = "40kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    heating_energy = "50kW",
    extension_speed = 0.1,
    rotation_speed = 0.04,
    filter_count = 5,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "inserter",
    open_sound = sounds.inserter_open,
    close_sound = sounds.inserter_close,
    working_sound = sounds.inserter_fast,
    hand_base_picture =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-base.png",
      priority = "extra-high",
      width = 32,
      height = 136,
      scale = 0.25
    },
    hand_closed_picture =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-closed.png",
      priority = "extra-high",
      width = 112,
      height = 164,
      scale = 0.25
    },
    hand_open_picture =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-open.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 32,
      height = 132,
      scale = 0.25
    },
    hand_closed_shadow =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 112,
      height = 164,
      scale = 0.25
    },
    hand_open_shadow =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    platform_picture =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    platform_frozen =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/frozen/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    },
    hand_base_frozen =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      x = 134 * 2,
      width = 134,
      height = 136,
      scale = 0.25
    },
    hand_closed_frozen =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      x = 134,
      width = 134,
      height = 164,
      scale = 0.25
    },
    hand_open_frozen =
    {
      filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-arm-frozen.png",
      priority = "extra-high",
      width = 134,
      height = 164,
      scale = 0.25
    },
    circuit_connector = circuit_connector_definitions["inserter"],
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  },
  {
    type = "simple-entity",
    name = "wube-logo-space-platform",
    icon =  "__base__/graphics/icons/water-wube.png",
    render_layer = "above-tiles",
    hidden_in_factoriopedia = true,
    collision_mask = {layers={}} ,
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    picture = {
      filename = "__space-age__/graphics/entity/wube-logo-space-platform/wube-logo-space-platform.png",
      priority = "extra-high",
      width = 320,
      height = 320,
      scale = 0.5
    }
  }
})

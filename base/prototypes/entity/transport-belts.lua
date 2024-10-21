require ("circuit-connector-sprites")
local meld = require("meld")
local hit_effects = require ("prototypes.entity.hit-effects")
local sounds = require("prototypes.entity.sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local basic_belt_animation_set =
{
  animation_set =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 16,
    direction_count = 20
  },

  --east_index = 1,
  --west_index = 2,
  --north_index = 3,
  --south_index = 4,

  --east_to_north_index = 5,
  --north_to_east_index = 6,

  --west_to_north_index = 7,
  --north_to_west_index = 8,

  --south_to_east_index = 9,
  --east_to_south_index = 10,

  --south_to_west_index = 11,
  --west_to_south_index = 12,

  --starting_south_index = 13,
  --ending_south_index = 14,

  --starting_west_index = 15,
  --ending_west_index = 16,

  --starting_north_index = 17,
  --ending_north_index = 18,

  --starting_east_index = 19,
  --ending_east_index = 20,
}

local fast_belt_animation_set =
{
  animation_set =
  {
    filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 32,
    direction_count = 20
  }
}

local express_belt_animation_set =
{
  animation_set =
  {
    filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 32,
    direction_count = 20
  }
}

belt_reader_gfx = -- not local
{
  belt_reader =
  {
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-top",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "object"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-base",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "transport-belt-reader"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-middle",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "floor-mechanics"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-under-middle",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "transport-belt-endings"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-bottom",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "floor"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-shadow",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4,
      }),
      render_layer = "floor"
    },
    -- More belt reader layers (with possibly different render layer) should go here
  }
}

meld(basic_belt_animation_set, belt_reader_gfx)
meld(fast_belt_animation_set, belt_reader_gfx)
meld(express_belt_animation_set, belt_reader_gfx)

data:extend
{
  {
    type = "transport-belt",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "transport-belt"},
    max_health = 150,
    corpse = "transport-belt-remnants",
    dying_explosion = "transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/transport-belt.ogg", volume = 0.17 },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "underground-belt",
    next_upgrade = "fast-transport-belt",
    speed = 0.03125,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "transport-belt",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "fast-transport-belt"},
    max_health = 160,
    corpse = "fast-transport-belt-remnants",
    dying_explosion = "fast-transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/fast-transport-belt.ogg", volume = 0.3 },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "fast-underground-belt",
    next_upgrade = "express-transport-belt",
    speed = 0.0625,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "transport-belt",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "express-transport-belt"},
    max_health = 170,
    corpse = "express-transport-belt-remnants",
    dying_explosion = "express-transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-transport-belt.ogg", volume = 0.3 },
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = express_belt_animation_set,
    related_underground_belt = "express-underground-belt",
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },

  {
    type = "underground-belt",
    name = "underground-belt",
    icon = "__base__/graphics/icons/underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "underground-belt"},
    max_health = 150,
    corpse = "underground-belt-remnants",
    dying_explosion = "underground-belt-explosion",
    factoriopedia_simulation = simulations.factoriopedia_underground_belt,
    max_distance = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    working_sound =
    {
      sound = { filename = "__base__/sound/underground-belt.ogg", volume = 0.2 },
      max_sounds_per_type = 2,
      audible_distance_modifier = 0.5,
      persistent = true,
      use_doppler_shift = false
    },
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "fast-underground-belt",
    speed = 0.03125,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }

      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y= 192*2,
          scale = 0.5
        }

      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }

  },

  {
    type = "underground-belt",
    name = "fast-underground-belt",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "fast-underground-belt"},
    max_health = 160,
    corpse = "fast-underground-belt-remnants",
    dying_explosion = "fast-underground-belt-explosion",
    factoriopedia_simulation = simulations.factoriopedia_fast_underground_belt,
    max_distance = 7,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/fast-underground-belt.ogg", volume = 0.27 },
      max_sounds_per_type = 2,
      audible_distance_modifier = 0.5,
      persistent = true,
      use_doppler_shift = false
    },
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "express-underground-belt",
    speed = 0.0625,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          scale = 0.5
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "underground-belt",
    name = "express-underground-belt",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "express-underground-belt"},
    max_health = 170,
    corpse = "express-underground-belt-remnants",
    dying_explosion = "express-underground-belt-explosion",
    factoriopedia_simulation = simulations.factoriopedia_express_underground_belt,
    max_distance = 9,
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-underground-belt.ogg", volume = 0.35 },
      max_sounds_per_type = 2,
      audible_distance_modifier = 0.5,
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          scale = 0.5
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "splitter",
    name = "splitter",
    icon = "__base__/graphics/icons/splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "splitter"},
    max_health = 170,
    corpse = "splitter-remnants",
    dying_explosion = "splitter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "transport-belt",
    next_upgrade = "fast-splitter",
    speed = 0.03125,
    belt_animation_set = basic_belt_animation_set,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.splitter,
    related_transport_belt = "transport-belt",
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 160,
        height = 70,
        shift = util.by_pixel(7, 0),
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 84,
        shift = util.by_pixel(4, 13),
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 164,
        height = 64,
        shift = util.by_pixel(4, 0),
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 86,
        shift = util.by_pixel(6, 12),
        scale = 0.5
      }
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 104,
        shift = util.by_pixel(4, -20),
        scale = 0.5
      },
      south = util.empty_sprite(),
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 96,
        shift = util.by_pixel(6, -18),
        scale = 0.5
      }
    }
  },
  {
    type = "splitter",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "fast-splitter"},
    max_health = 180,
    corpse = "fast-splitter-remnants",
    dying_explosion = "fast-splitter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    next_upgrade = "express-splitter",
    speed = 0.0625,
    working_sound = sounds.fast_splitter,
    related_transport_belt = "fast-transport-belt",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 160,
        height = 70,
        shift = util.by_pixel(7, 0),
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 84,
        shift = util.by_pixel(4, 13),
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 164,
        height = 64,
        shift = util.by_pixel(4, 0),
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 86,
        shift = util.by_pixel(6, 12),
        scale = 0.5
      }
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-east-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 104,
        shift = util.by_pixel(4, -20),
        scale = 0.5
      },
      south = util.empty_sprite(),
      west =
      {
        filename = "__base__/graphics/entity/fast-splitter/fast-splitter-west-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 96,
        shift = util.by_pixel(6, -18),
        scale = 0.5
      }
    }
  },
  {
    type = "splitter",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "express-splitter"},
    max_health = 190,
    corpse = "express-splitter-remnants",
    dying_explosion = "express-splitter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.09375,
    working_sound = sounds.express_splitter,
    related_transport_belt = "express-transport-belt",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 160,
        height = 70,
        shift = util.by_pixel(7, 0),
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 84,
        shift = util.by_pixel(4, 13),
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 164,
        height = 64,
        shift = util.by_pixel(4, 0),
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 94,
        height = 86,
        shift = util.by_pixel(5, 12),
        scale = 0.5
      }
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-east-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 104,
        shift = util.by_pixel(4, -20),
        scale = 0.5
      },
      south = util.empty_sprite(),
      west =
      {
        filename = "__base__/graphics/entity/express-splitter/express-splitter-west-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 94,
        height = 96,
        shift = util.by_pixel(5, -18),
        scale = 0.5
      }
    }
  },
  {
    type = "loader",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "loader"},
    max_health = 170,
    filter_count = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.loader,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.03125,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    circuit_connector = circuit_connector_definitions["loader-1x2"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
  {
    type = "loader-1x1",
    name = "loader-1x1",
    icon = "__base__/graphics/icons/loader.png",
    hidden = true,
    subgroup = "other",
    max_health = 170,
    filter_count = 5,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    container_distance = 1,
    speed = 0.03125,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    }
  },
  {
    type = "loader",
    name = "fast-loader",
    icon = "__base__/graphics/icons/fast-loader.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "fast-loader"},
    max_health = 170,
    filter_count = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.fast_loader,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = fast_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.0625,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    circuit_connector = circuit_connector_definitions["loader-1x2"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
  {
    type = "loader",
    name = "express-loader",
    icon = "__base__/graphics/icons/express-loader.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "express-loader"},
    max_health = 170,
    filter_count = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.express_loader,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = express_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.09375,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    circuit_connector = circuit_connector_definitions["loader-1x2"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  }
}

data:extend
{
  {
    type = "linked-belt",
    name = "linked-belt",
    icon = "__base__/graphics/icons/linked-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "linked-belt"},
    max_health = 160,
    corpse = "underground-belt-remnants",
    dying_explosion = "underground-belt-explosion",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = data.raw["underground-belt"]["underground-belt"].working_sound,
    resistances = data.raw["underground-belt"]["underground-belt"].resistances,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "linked-belts",
    speed = 0.03125,
    structure_render_layer = "object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch = data.raw["underground-belt"]["underground-belt"].structure.back_patch,
      front_patch = data.raw["underground-belt"]["underground-belt"].structure.front_patch,
    },
    -- clone/blueprint connection work only if both input and output have them and they are contained in the same blueprint/clone
    allow_clone_connection = true,
    allow_blueprint_connection = true,
    allow_side_loading = false
  },
  {
    type = "lane-splitter",
    name = "lane-splitter",
    icons =
    {
      {
        icon = "__base__/graphics/icons/splitter.png"
      },
      {
        icon = "__base__/graphics/icons/signal/signal_1.png",
        icon_size = 64,
        scale = 0.25,
        shift = {8, -8}
      },
    },
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "lane-splitter"},
    max_health = 170,
    corpse = "splitter-remnants",
    dying_explosion = "splitter-explosion",
    icon_draw_specification = {scale = 0.35},
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    fast_replaceable_group = "transport-belt",
    -- next_upgrade = "fast-lane-splitter",
    speed = 0.03125,
    belt_animation_set = basic_belt_animation_set,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.splitter,
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 160,
        height = 70,
        shift = util.by_pixel(3.5, 0),
        scale = 0.25
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 84,
        shift = util.by_pixel(2, 7.5),
        scale = 0.25
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 164,
        height = 64,
        shift = util.by_pixel(2, 0),
        scale = 0.25
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 86,
        shift = util.by_pixel(3, 6),
        scale = 0.25
      }
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 104,
        shift = util.by_pixel(2, -10),
        scale = 0.25
      },
      south = util.empty_sprite(),
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 96,
        shift = util.by_pixel(3, -9),
        scale = 0.25
      }
    }
  }
}

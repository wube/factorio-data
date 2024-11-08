local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")

--lithium
local lithium_rock_tint = {1, 1, 1}
local lithium_rock_rectange = nil --{{0, 0}, {1, 1}}
local lithium_rock_map_colour = {168, 188, 211}

data:extend{
  {
    name = "aqulio-ice-decal-blue",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
     collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    --collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    --walking_sound = sounds.pebble,
    autoplace = {
      order = "d[decal]-a",
      probability_expression = "min(1, random_penalty{x = x, y = y, seed = 1, source = 1, amplitude = 1/0.1} + aquilo_high_frequency_peaks / 2 )",
      tile_restriction = {"snow-crests", "snow-lumpy", "snow-patchy"}
    },
    pictures = {
      {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-01.png",
        priority = base_decorative_sprite_priority,
        width =  590,
        height =  334,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-02.png",
        priority = base_decorative_sprite_priority,
        width =  395,
        height =  365,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-03.png",
        priority = base_decorative_sprite_priority,
        width =  607,
        height =  360,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-04.png",
        priority = base_decorative_sprite_priority,
        width =  846,
        height =  310,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-05.png",
        priority = base_decorative_sprite_priority,
        width =  520,
        height =  316,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-06.png",
        priority = base_decorative_sprite_priority,
        width =  358,
        height =  363,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-07.png",
        priority = base_decorative_sprite_priority,
        width =  342,
        height =  228,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-08.png",
        priority = base_decorative_sprite_priority,
        width =  517,
        height =  429,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-09.png",
        priority = base_decorative_sprite_priority,
        width =  872,
        height =  372,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-10.png",
        priority = base_decorative_sprite_priority,
        width =  402,
        height =  261,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-11.png",
        priority = base_decorative_sprite_priority,
        width =  579,
        height =  317,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-12.png",
        priority = base_decorative_sprite_priority,
        width =  445,
        height =  292,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-ice-decal-blue/aqulio-ice-decal-blue-13.png",
        priority = base_decorative_sprite_priority,
        width =  508,
        height =  383,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        }

    }
  },
  {
    name = "aqulio-snowy-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    --collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    --walking_sound = sounds.pebble,
    autoplace = {
      order = "d[decal]-b",
      probability_expression = "min(1, random_penalty{x = x, y = y, seed = 1, source = 1, amplitude = 1/0.1} + 0.3 -aquilo_high_frequency_peaks / 2)",
      tile_restriction = {"ice-smooth", "ice-rough"}
    },
    pictures = {
      {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-01.png",
        priority = base_decorative_sprite_priority,
        width =  759,
        height =  396,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-02.png",
        priority = base_decorative_sprite_priority,
        width =  907,
        height =  548,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-03.png",
        priority = base_decorative_sprite_priority,
        width =  678,
        height =  307,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-04.png",
        priority = base_decorative_sprite_priority,
        width =  563,
        height =  476,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-05.png",
        priority = base_decorative_sprite_priority,
        width =  479,
        height =  348,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-06.png",
        priority = base_decorative_sprite_priority,
        width =  585,
        height =  320,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-07.png",
        priority = base_decorative_sprite_priority,
        width =  468,
        height =  373,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-08.png",
        priority = base_decorative_sprite_priority,
        width =  558,
        height =  509,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-09.png",
        priority = base_decorative_sprite_priority,
        width =  570,
        height =  428,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-10.png",
        priority = base_decorative_sprite_priority,
        width =  736,
        height =  378,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-11.png",
        priority = base_decorative_sprite_priority,
        width =  513,
        height =  473,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-12.png",
        priority = base_decorative_sprite_priority,
        width =  529,
        height =  279,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-13.png",
        priority = base_decorative_sprite_priority,
        width =  376,
        height =  380,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-14.png",
        priority = base_decorative_sprite_priority,
        width =  421,
        height =  372,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-15.png",
        priority = base_decorative_sprite_priority,
        width =  724,
        height =  383,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-16.png",
        priority = base_decorative_sprite_priority,
        width =  389,
        height =  364,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
        {
        filename =  "__space-age__/graphics/decorative/aquilo-ice/aqulio-snowy-decal/aqulio-snowy-decal-17.png",
        priority = base_decorative_sprite_priority,
        width =  817,
        height =  379,
        tint = {1,1,1},
        scale = 0.5,
        shift = {0.0, 0.0}
        },
    }
  },
  {
    name = "floating-iceberg-large",
    type = "optimized-decorative",
    order = "a[aquilo]-b[decorative]",
    collision_box = {{-2, -2}, {2, 2}},
    collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true},
    render_layer = "object",
    --walking_sound = sounds.pebble,
    autoplace = {
      order = "a[rock]-a[huge]",
      probability_expression = "icebergs * 0.015",
    },
    pictures = {
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-1",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-2",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-3",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-4",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-3",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-4",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-4",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
    },

    stateless_visualisation = {
      animation = {
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-1",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-2",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-3",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-4",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-5",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-6",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-7",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),

      }
    }
  },
  {
    name = "floating-iceberg-small",
    type = "optimized-decorative",
    order = "a[aquilo]-b[decorative]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true},
    render_layer = "object",
    --walking_sound = sounds.pebble,
    autoplace = {
      order = "a[rock]-c[medium]",
      probability_expression = "icebergs * 0.02",
    },
    pictures = {--[[
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-1",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),]]
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-2",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-3",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-4",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-3",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-4",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-4",
      { scale = 0.005, multiply_shift = 0.5, shift = {0, 0}, }),
    },

    stateless_visualisation = {
      animation = {--[[
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-1",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),]]
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-2",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-3",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-4",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-small-5",
      { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
      }
    }
  },
  {
    name = "lithium-iceberg-huge",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/lithium-iceberg-big.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-k[lithium-iceberg]-d[big]",
    collision_mask =
    {
      layers=
      {
        item=true,
        object=true,
        player=true,
        water_tile=true
      },
    },
    collision_box = {{-1.85, -1.25}, {1.85, 1.25}},
    selection_box = {{-1.85, -1.25}, {1.85, 1.25}},
    drawing_box_vertical_extension = 2,
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 1500,
    autoplace = {order = "a[rock]-a[huge]", probability_expression = "(aquilo_high_frequency_peaks - 0.8) * 0.1"},
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "iron-ore-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "ice-platform",  amount_min = 2, amount_max = 4},
        {type = "item", name = "ice", amount_min = 6, amount_max = 10},
        {type = "item", name = "lithium", amount_min = 2, amount_max = 5}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "play-sound",
                  sound = sound_variations("__space-age__/sound/particles/ice-particles", 5, 0.35),
                }
              }
            }
          }
        }
      }
    },
    resistances =
    {
      {
        type = "poison",
        percent = 100
      }
    },
    map_color = lithium_rock_map_colour,
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = sound_variations("__space-age__/sound/mining/mined-iceberg", 4, 0.7),
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-iceberg", 7, 0.5),
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-huge/lithium-iceberg-huge-2.png",
        width = 444,
        height = 310,
        scale = 0.5,
        shift = {0.65,-0.75}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-huge/lithium-iceberg-huge-5.png",
        width = 444,
        height = 310,
        scale = 0.5,
        shift = {1.15,-0.75}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-huge/lithium-iceberg-huge-7.png",
        width = 444,
        height = 310,
        scale = 0.5,
        shift = {0.95,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-huge/lithium-iceberg-huge-11.png",
        width = 444,
        height = 310,
        scale = 0.5,
        shift = {0.65,-0.75}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-huge/lithium-iceberg-huge-12.png",
        width = 444,
        height = 310,
        scale = 0.5,
        shift = {0.65,-0.75}
      },
    }
  },
  {
    name = "lithium-iceberg-big",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/lithium-iceberg-big.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-k[lithium-iceberg]-d[big]",
    collision_mask =
    {
      layers=
      {
        item=true,
        object=true,
        player=true,
        water_tile=true
      },
    },
    collision_box = {{-1.0, -0.75}, {1.0, 0.75}},
    selection_box = {{-1.0, -0.75}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {order = "a[rock]-b[big]", probability_expression = "(aquilo_high_frequency_peaks - 0.7) * 0.8"},
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "iron-ore-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "ice-platform", amount = 1},
        {type = "item", name = "ice", amount_min = 3, amount_max = 7},
        {type = "item", name = "lithium", amount_min = 1, amount_max = 3}
      },
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "play-sound",
                  sound = sound_variations("__space-age__/sound/particles/ice-particles", 5, 0.35),
                }
              }
            }
          }
        }
      }
    },
    resistances =
    {
      {
        type = "poison",
        percent = 100
      }
    },
    map_color = lithium_rock_map_colour,
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = sound_variations("__space-age__/sound/mining/mined-iceberg", 4, 0.7),
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-iceberg", 7, 0.5),
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-1.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0.1,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-2.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-3.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-4.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-5.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0.75,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-6.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-7.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0.1,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-8.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,0.05}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-9.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0.2,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-10.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {-0.3,-0.25}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-11.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.35}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-12.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0.4,-0.35}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-13.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.35}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-14.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.35}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-big/lithium-iceberg-big-15.png",
        width = 230,
        height = 154,
        scale = 0.5,
        shift = {0,-0.25}
      },
    }
  },
  {
    name = "lithium-iceberg-medium",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-k[lithium-iceberg]-c[medium]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    render_layer = "decorative",
    autoplace = {probability_expression = "(aquilo_high_frequency_peaks - 0.6) * 0.9"},
    trigger_effect = decorative_trigger_effects.medium_rock(),
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-1.png",
        priority = base_decorative_sprite_priority,
        width = 114,
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-1.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-2.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-3.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-4.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-5.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-6.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-7.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-8.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-9.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-10.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-11.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-12.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-13.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-14.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-medium/lithium-iceberg-medium-15.png",
        priority = base_decorative_sprite_priority,
        width = 114,  
        height = 88,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },
  {
    name = "lithium-iceberg-small",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-k[lithium-iceberg]-b[small]",
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace = {probability_expression = "(aquilo_high_frequency_peaks - 0.35) * 0.7"},
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-1.png",
        priority = base_decorative_sprite_priority,
        scale = 0.5,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-2.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-3.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-4.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-5.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-6.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-7.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-8.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-9.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-10.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-small/lithium-iceberg-small-11.png",
        priority = base_decorative_sprite_priority,
        width = 90,
        height = 56,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
    }
  },
  {
    name = "lithium-iceberg-tiny",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-k[lithium-iceberg]-a[tiny]",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace = {probability_expression = "(aquilo_high_frequency_peaks - 0.2) * 0.5"},
    trigger_effect = decorative_trigger_effects.tiny_rock(),
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-1.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-2.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-3.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-4.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-5.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-6.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-7.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-8.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-9.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-10.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-11.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
      {
        filename = "__space-age__/graphics/decorative/lithium-iceberg-tiny/lithium-iceberg-tiny-12.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 28,
        scale = 0.5,
        shift = {0.0390625, 0.0234375}
      },
    }
  },
  {
    name = "snow-drift-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.375, -2.3125}, {3.25, 2.3125}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 255,
    autoplace =
    {
      order = "d[decal]-c",
      probability_expression = "min(1, random_penalty{x = x, y = y, seed = 1, source = 1, amplitude = 1/0.1} + 0.3 -aquilo_high_frequency_peaks / 2)"
    },
    pictures =
    {
      --lightDecal
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-00.png",
        width = 400,
        height = 299,
        shift = util.by_pixel(4.5, -2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-01.png",
        width = 419,
        height = 320,
        shift = util.by_pixel(-0.75, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-02.png",
        width = 417,
        height = 287,
        shift = util.by_pixel(-1.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-03.png",
        width = 421,
        height = 298,
        shift = util.by_pixel(-0.25, 5.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-04.png",
        width = 396,
        height = 302,
        shift = util.by_pixel(6, 4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-05.png",
        width = 408,
        height = 295,
        shift = util.by_pixel(-2.5, 7.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-06.png",
        width = 417,
        height = 317,
        shift = util.by_pixel(-1.25, 3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-07.png",
        width = 419,
        height = 312,
        shift = util.by_pixel(0.75, 2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-08.png",
        width = 413,
        height = 317,
        shift = util.by_pixel(-2.25, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-09.png",
        width = 403,
        height = 310,
        shift = util.by_pixel(0.25, 1.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-10.png",
        width = 411,
        height = 307,
        shift = util.by_pixel(-0.75, 1.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-11.png",
        width = 421,
        height = 295,
        shift = util.by_pixel(-0.25, -0.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-12.png",
        width = 420,
        height = 280,
        shift = util.by_pixel(-0.5, -7),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-13.png",
        width = 403,
        height = 311,
        shift = util.by_pixel(0.75, 3.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-14.png",
        width = 418,
        height = 304,
        shift = util.by_pixel(0, 2),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-15.png",
        width = 398,
        height = 284,
        shift = util.by_pixel(-3.5, 6.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-16.png",
        width = 406,
        height = 313,
        shift = util.by_pixel(4, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-17.png",
        width = 420,
        height = 294,
        shift = util.by_pixel(0.5, 4.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-18.png",
        width = 379,
        height = 289,
        shift = util.by_pixel(0.25, 5.75),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-19.png",
        width = 401,
        height = 311,
        shift = util.by_pixel(-5.25, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-20.png",
        width = 418,
        height = 315,
        shift = util.by_pixel(0.5, 1.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-21.png",
        width = 418,
        height = 154,
        shift = util.by_pixel(1, 3),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-22.png",
        width = 421,
        height = 270,
        shift = util.by_pixel(-0.25, 1),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-23.png",
        width = 403,
        height = 290,
        shift = util.by_pixel(2.25, -2.5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-24.png",
        width = 418,
        height = 315,
        shift = util.by_pixel(-0.5, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-25.png",
        width = 414,
        height = 310,
        shift = util.by_pixel(-2, 4),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-26.png",
        width = 403,
        height = 306,
        shift = util.by_pixel(-3.75, 5),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-27.png",
        width = 416,
        height = 303,
        shift = util.by_pixel(1, 0.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-28.png",
        width = 422,
        height = 311,
        shift = util.by_pixel(0, 2.25),
        scale = 0.5
      },
      {
        filename = "__space-age__/graphics/decorative/snow-drift-decal/snow-drift-decal-29.png",
        width = 406,
        height = 292,
        shift = util.by_pixel(-3.5, 2),
        scale = 0.5
      }
    }
  }
}

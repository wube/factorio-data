local sounds = require("prototypes.entity.sounds")
local fireutil = require("prototypes.fire-util")

local crash_site_sprite_priority = "very-low"

data:extend(
{
  {
    type = "container",
    name = "crash-site-chest-1",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    max_health = 350,
    minable = { mining_time = 1 },
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.5 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.5 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-ground.png",
      priority = crash_site_sprite_priority,
      width = 220,
      height = 148,
      shift = util.by_pixel(-6, 12),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1.png",
          priority = "extra-high",
          width = 120,
          height = 76,
          shift = util.by_pixel(2, 8),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-shadow.png",
          priority = "extra-high",
          width = 210,
          height = 128,
          shift = util.by_pixel(-2, 3),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "container",
    name = "crash-site-chest-2",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    hidden = true,
    max_health = 350,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-ground.png",
      priority = crash_site_sprite_priority,
      width = 218,
      height = 186,
      shift = util.by_pixel(-10, 5),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2.png",
          priority = "extra-high",
          width = 116,
          height = 88,
          shift = util.by_pixel(0, 8),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-shadow.png",
          priority = "extra-high",
          width = 188,
          height = 126,
          shift = util.by_pixel(0, 5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
})

local wreck_flags =
{
  "placeable-player",
  "player-creation",
  "not-rotatable",
  "placeable-off-grid",
  "not-blueprintable",
  "not-deconstructable"
}

data:extend(
{
  {
    type = "container",
    name = "crash-site-spaceship",
    icon = "__base__/graphics/icons/crash-site-spaceship.png",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 600,
    alert_when_damaged = false,
    allow_copy_paste = false,
    default_status = "broken",
    resistances =
    {
      {type = "fire", percent = 100}
    },
    inventory_size = 5,
    inventory_type = "normal",
    minable =
    {
      mining_time = 2.3
    },
    collision_box = {{-8.7, -3.3}, {6.9, 4.5}},
    selection_box = {{-8.7, -3.3}, {6.9, 4.5}},
    dying_explosion = "nuke-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-ground.png",
      priority = "very-low",
      width = 1330,
      height = 786,
      shift = util.by_pixel(-50, 61),
      dice_x = 4,
      dice_y = 3,
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship.png",
          priority = "very-low",
          width = 1228,
          height = 790,
          shift = util.by_pixel(-13, 34),
          dice_x = 4,
          dice_y = 3,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-shadow.png",
          priority = "very-low",
          width = 1340,
          height = 842,
          shift = util.by_pixel(-23, 50),
          scale = 0.5,
          dice_x = 5,
          dice_y = 4,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship
  {
    type = "container",
    name = "crash-site-spaceship-wreck-big-1",
    localised_name = {"entity-name.crash-site-spaceship-wreck-big"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-big-1.png",
    default_status = "broken",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 150,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    inventory_size = 2,
    inventory_type = "normal",
    minable =
    {
      mining_time = 1.25
    },
    collision_box = {{-0.9, -0.1}, {1.4, 1.2}},
    selection_box = {{-0.9, -0.1}, {1.4, 1.2}},
    drawing_box_vertical_extension = 1.9,
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-1-ground.png",
      priority="high",
      width = 348,
      height = 136,
      shift = util.by_pixel(-27, 31),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-1.png",
          width = 234,
          height = 280,
          shift = util.by_pixel(-7, -8),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-1-shadow.png",
          width = 256,
          height = 44,
          shift = util.by_pixel(37, 26),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Big 1
  {
    type = "container",
    name = "crash-site-spaceship-wreck-big-2",
    localised_name = {"entity-name.crash-site-spaceship-wreck-big"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-big-2.png",
    default_status = "broken",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 150,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    inventory_size = 2,
    inventory_type = "normal",
    minable =
    {
      mining_time = 1.25
    },
    collision_box = {{-1.6, -1.6}, {1.3, 1.3}},
    selection_box = {{-1.6, -1.6}, {1.3, 1.3}},
    drawing_box_vertical_extension = 0.4,
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-2-ground.png",
      priority="high",
      width = 450,
      height = 296,
      shift = util.by_pixel(-52, 8),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-2.png",
          width = 242,
          height = 258,
          shift = util.by_pixel(-13, -7),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-2-shadow.png",
          width = 294,
          height = 228,
          shift = util.by_pixel(27, -12),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Big 2
  {
    type = "container",
    name = "crash-site-spaceship-wreck-medium-1",
    localised_name = {"entity-name.crash-site-spaceship-wreck-medium"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-1.png",
    default_status = "broken",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 100,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    inventory_size = 1,
    inventory_type = "normal",
    minable =
    {
      mining_time = 1
    },
    collision_box = {{-1.2, -1.0}, {1.2, 0.7}},
    selection_box = {{-1.2, -1.0}, {1.2, 0.7}},
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-1-ground.png",
      priority="high",
      width = 352,
      height = 206,
      shift = util.by_pixel(-41, 13),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-1.png",
          width = 228,
          height = 120,
          shift = util.by_pixel(-14, -4),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-1-shadow.png",
          width = 206,
          height = 114,
          shift = util.by_pixel(16, -1),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Medium 1
  {
    type = "container",
    name = "crash-site-spaceship-wreck-medium-2",
    localised_name = {"entity-name.crash-site-spaceship-wreck-medium"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-2.png",
    default_status = "broken",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 100,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    inventory_size = 1,
    inventory_type = "normal",
    minable =
    {
      mining_time = 1
    },
    collision_box = {{-1.1, -0.6}, {1.0, 1.0}},
    selection_box = {{-1.1, -0.6}, {1.0, 1.0}},
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-2-ground.png",
      priority="high",
      width = 396,
      height = 214,
      shift = util.by_pixel(-56, -1),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-2.png",
          width = 194,
          height = 150,
          shift = util.by_pixel(-15, 8),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-2-shadow.png",
          width = 196,
          height = 114,
          shift = util.by_pixel(22, 15),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Medium 2
  {
    type = "container",
    name = "crash-site-spaceship-wreck-medium-3",
    localised_name = {"entity-name.crash-site-spaceship-wreck-medium"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-3.png",
    default_status = "broken",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 100,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    inventory_size = 1,
    inventory_type = "normal",
    minable =
    {
      mining_time = 1
    },
    collision_box = {{-0.8, -1.4}, {0.7, 1.4}},
    selection_box = {{-0.8, -1.4}, {0.7, 1.4}},
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-3-ground.png",
      priority="high",
      width = 350,
      height = 284,
      shift = util.by_pixel(-44, 10),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-3.png",
          width = 224,
          height = 236,
          shift = util.by_pixel(-30, 4),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-3-shadow.png",
          width = 104,
          height = 178,
          shift = util.by_pixel(6, 0),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Medium 3
  {
    type = "simple-entity-with-owner",
    name = "crash-site-spaceship-wreck-small-1",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-1.png",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = 0.75
    },
    collision_box = {{-1.0, -1.0}, {0.8, 0.8}},
    selection_box = {{-1.0, -1.0}, {0.8, 0.8}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-1-ground.png",
      priority="high",
      width = 240,
      height = 222,
      shift = util.by_pixel(-18, 12),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-1.png",
          width = 156,
          height = 152,
          shift = util.by_pixel(-9, -1),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-1-shadow.png",
          width = 178,
          height = 122,
          shift = util.by_pixel(8, -3),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Small 1
  {
    type = "simple-entity-with-owner",
    name = "crash-site-spaceship-wreck-small-2",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-2.png",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = 0.75
    },
    collision_box = {{-0.7, 0.0}, {0.7, 0.8}},
    selection_box = {{-0.7, 0.0}, {0.7, 0.8}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-2-ground.png",
      priority="high",
      width = 232,
      height = 154,
      shift = util.by_pixel(-14, 22),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-2.png",
          width = 146,
          height = 102,
          shift = util.by_pixel(-8, 16),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-2-shadow.png",
          width = 92,
          height = 76,
          shift = util.by_pixel(7, 19),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Small 2
  {
    type = "simple-entity-with-owner",
    name = "crash-site-spaceship-wreck-small-3",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-3.png",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = 0.75
    },
    collision_box = {{-0.7, -0.8}, {1.2, 0.6}},
    selection_box = {{-0.7, -0.8}, {1.2, 0.6}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-3-ground.png",
      priority="high",
      width = 274,
      height = 172,
      shift = util.by_pixel(-8, 3),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-3.png",
          width = 164,
          height = 148,
          shift = util.by_pixel(5, -1),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-3-shadow.png",
          width = 156,
          height = 114,
          shift = util.by_pixel(9, -1),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Small 3
  {
    type = "simple-entity-with-owner",
    name = "crash-site-spaceship-wreck-small-4",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-4.png",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = 0.75
    },
    collision_box = {{-0.9, -0.8}, {1.1, 0.6}},
    selection_box = {{-0.9, -0.8}, {1.1, 0.6}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4-ground.png",
      priority="high",
      width = 256,
      height = 150,
      shift = util.by_pixel(-12, -2),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4.png",
          width = 168,
          height = 142,
          shift = util.by_pixel(1, -3),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4-shadow.png",
          width = 164,
          height = 100,
          shift = util.by_pixel(19, -5),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Small 4
  {
    type = "simple-entity-with-owner",
    name = "crash-site-spaceship-wreck-small-5",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-5.png",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = 0.75
    },
    collision_box = {{-0.8, -0.6}, {0.9, 0.2}},
    selection_box = {{-0.8, -0.6}, {0.9, 0.2}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-5-ground.png",
      priority="high",
      width = 252,
      height = 128,
      shift = util.by_pixel(-15, -6),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-5.png",
          width = 164,
          height = 120,
          shift = util.by_pixel(-6, -6),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-5-shadow.png",
          width = 148,
          height = 78,
          shift = util.by_pixel(11, -10),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  }, -- Spaceship Wreck Small 5
  {
    type = "simple-entity-with-owner",
    name = "crash-site-spaceship-wreck-small-6",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-6.png",
    flags = wreck_flags,
    hidden = true,
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = 0.75
    },
    collision_box = {{-0.4, -0.2}, {1.5, 0.8}},
    selection_box = {{-0.4, -0.2}, {1.5, 0.8}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-6-ground.png",
      priority="high",
      width = 276,
      height = 160,
      shift = util.by_pixel(-8, 9),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-6.png",
          width = 166,
          height = 114,
          shift = util.by_pixel(10, 9),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-6-shadow.png",
          width = 160,
          height = 104,
          shift = util.by_pixel(27, 11),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    }
  } -- Spaceship Wreck Small 6
})

local fire_trigger_smoke =
{
  name = "crash-site-fire-smoke",
  type = "smoke-with-trigger",
  flags = {"not-on-map"},
  hidden = true,
  show_when_smoke_off = true,
  affected_by_wind = false,
  cyclic = true,
  duration = 60 * 10,
  fade_away_duration = 2 * 60,

  animation = util.empty_sprite(),

  action =
  {
    type = "direct",
    probability = 0.5,
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        type = "create-fire",
        entity_name = "crash-site-fire-flame"
      }
    }
  },
  action_cooldown = 49
}

local explosion_probability = 0.05

local nice_explosions =
{
  "big-explosion",
  "massive-explosion",
  "medium-explosion"
}

local effects = {}

for k, name in pairs (nice_explosions) do
  effects[k] =
  {
    type = "create-entity",
    entity_name = name,
    probability = explosion_probability / #nice_explosions,
    offset_deviation = {{-1, -1}, {1, 1}}
  }
end

local explosion_trigger_smoke =
{
  name = "crash-site-explosion-smoke",
  type = "smoke-with-trigger",
  flags = {"not-on-map"},
  hidden = true,
  show_when_smoke_off = false,
  affected_by_wind = false,
  cyclic = true,
  duration = 60 * 10,
  animation = util.empty_sprite(),
  action =
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      target_effects = effects
    }
  },
  action_cooldown = 50
}

data:extend
{
  fire_trigger_smoke,
  explosion_trigger_smoke
}

local skip_cutscene_hotkey =
{
  type = "custom-input",
  name = "crash-site-skip-cutscene",
  linked_game_control = "confirm-message",
  key_sequence = "TAB",
  enabled_while_in_cutscene = true
}

data:extend
{
  skip_cutscene_hotkey
}

data:extend
{
  fireutil.add_basic_fire_graphics_and_effects_definitions
  {
    type = "fire",
    name = "crash-site-fire-flame",
    flags = {"placeable-off-grid", "not-on-map"},
    hidden = true,
    damage_per_tick = {amount = 1 / 60, type = "fire"},
    maximum_damage_multiplier = 1,
    damage_multiplier_increase_per_added_fuel = 0,
    damage_multiplier_decrease_per_tick = 0,
    spawn_entity = nil,
    spread_delay = 300,
    spread_delay_deviation = 180,
    maximum_spread_count = 100,
    initial_lifetime = 300,
    lifetime_increase_by = 150,
    lifetime_increase_cooldown = 4,
    maximum_lifetime = 1800,
    delay_between_initial_flames = 10
  }
}

local sounds = require ("prototypes.entity.sounds")

function productivity_module_limitation()
return
      {
        "sulfuric-acid",
        "basic-oil-processing",
        "advanced-oil-processing",
        "coal-liquefaction",
        "heavy-oil-cracking",
        "light-oil-cracking",
        "solid-fuel-from-light-oil",
        "solid-fuel-from-heavy-oil",
        "solid-fuel-from-petroleum-gas",
        "lubricant",
        "iron-plate",
        "copper-plate",
        "steel-plate",
        "stone-brick",
        "sulfur",
        "plastic-bar",
        "empty-barrel",
        "uranium-processing",
        "copper-cable",
        "iron-stick",
        "iron-gear-wheel",
        "electronic-circuit",
        "advanced-circuit",
        "processing-unit",
        "engine-unit",
        "electric-engine-unit",
        "uranium-fuel-cell",
        "explosives",
        "battery",
        "flying-robot-frame",
        "low-density-structure",
        "rocket-fuel",
        "nuclear-fuel",
        "nuclear-fuel-reprocessing",
        "rocket-control-unit",
        "rocket-part",
        "automation-science-pack",
        "logistic-science-pack",
        "chemical-science-pack",
        "military-science-pack",
        "production-science-pack",
        "utility-science-pack",
        "kovarex-enrichment-process"
      }
end

local big_wreck_item = function(n)
  return
  {
    type = "item",
    name = "crash-site-spaceship-wreck-big-"..n,
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-big-"..n..".png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "z[crash-site-spaceship]-b",
    place_result = "crash-site-spaceship-wreck-big-"..n,
    stack_size = 1,
    flags = {"hidden"}
  }
end

local medium_wreck_item = function(n)
  return
  {
    type = "item",
    name = "crash-site-spaceship-wreck-medium-"..n,
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-"..n..".png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "z[crash-site-spaceship]-c",
    place_result = "crash-site-spaceship-wreck-medium-"..n,
    stack_size = 1,
    flags = {"hidden"}
  }
end

local small_wreck_item = function(n)
  return
  {
    type = "item",
    name = "crash-site-spaceship-wreck-small-"..n,
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-"..n..".png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "z[crash-site-spaceship]-d",
    place_result = "crash-site-spaceship-wreck-small-"..n,
    stack_size = 1,
    flags = {"hidden"}
  }
end

data:extend(
{
  {
    type = "item",
    name = "stone-brick",
    icon = "__base__/graphics/icons/stone-brick.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "terrain",
    order = "a[stone-brick]",
    stack_size = 100,
    place_as_tile =
    {
      result = "stone-path",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "wood",
    icon = "__base__/graphics/icons/wood.png",
    icon_size = 64, icon_mipmaps = 4,
    fuel_value = "2MJ",
    fuel_category = "chemical",
    subgroup = "raw-resource",
    order = "a[wood]",
    stack_size = 100
  },
  {
    type = "item",
    name = "coal",
    icon = "__base__/graphics/icons/coal.png",
    icon_size = 64,
    icon_mipmaps = 4,
    dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/coal.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/coal-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/coal-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/coal-3.png", scale = 0.25, mipmap_count = 4 }
    },
    fuel_category = "chemical",
    fuel_value = "4MJ",
    subgroup = "raw-resource",
    order = "b[coal]",
    stack_size = 50
  },
  {
    type = "item",
    name = "stone",
    icon = "__base__/graphics/icons/stone.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/stone.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/stone-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/stone-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/stone-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "d[stone]",
    stack_size = 50
  },
  {
    type = "item",
    name = "iron-ore",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/iron-ore.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/iron-ore-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/iron-ore-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/iron-ore-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "e[iron-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "copper-ore",
    icon = "__base__/graphics/icons/copper-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/copper-ore.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/copper-ore-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/copper-ore-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/copper-ore-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "f[copper-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "iron-plate",
    icon = "__base__/graphics/icons/iron-plate.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "b[iron-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "copper-plate",
    icon = "__base__/graphics/icons/copper-plate.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "c[copper-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "copper-cable",
    icon = "__base__/graphics/icons/copper-cable.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "a[copper-cable]",
    stack_size = 200,
    wire_count = 1
  },
  {
    type = "item",
    name = "iron-stick",
    icon = "__base__/graphics/icons/iron-stick.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "b[iron-stick]",
    stack_size = 100
  },
  {
    type = "item",
    name = "iron-gear-wheel",
    icon = "__base__/graphics/icons/iron-gear-wheel.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "c[iron-gear-wheel]",
    stack_size = 100
  },
  {
    type = "item",
    name = "electronic-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "e[electronic-circuit]",
    stack_size = 200
  },
  {
    type = "item",
    name = "wooden-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "a[items]-a[wooden-chest]",
    place_result = "wooden-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "a[stone-furnace]",
    place_result = "stone-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "burner-mining-drill",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "extraction-machine",
    order = "a[items]-a[burner-mining-drill]",
    place_result = "burner-mining-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-mining-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "extraction-machine",
    order = "a[items]-b[electric-mining-drill]",
    place_result = "electric-mining-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "a[burner-inserter]",
    place_result = "burner-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "inserter",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "b[inserter]",
    place_result = "inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "d[fast-inserter]",
    place_result = "fast-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "filter-inserter",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "e[filter-inserter]",
    place_result = "filter-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "c[long-handed-inserter]",
    place_result = "long-handed-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "offshore-pump",
    icon = "__base__/graphics/icons/offshore-pump.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "extraction-machine",
    order = "b[fluids]-a[offshore-pump]",
    place_result = "offshore-pump",
    stack_size = 20
  },
  {
    type = "item",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-a[pipe]",
    place_result = "pipe",
    stack_size = 100
  },
  {
    type = "item",
    name = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "b[steam-power]-a[boiler]",
    place_result = "boiler",
    stack_size = 50
  },
  {
    type = "item",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "b[steam-power]-b[steam-engine]",
    place_result = "steam-engine",
    stack_size = 10
  },
  {
    type = "item",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-a[small-electric-pole]",
    place_result = "small-electric-pole",
    stack_size = 50
  },
  {
    type = "item",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "d[radar]-a[radar]",
    place_result = "radar",
    stack_size = 50
  },
  {
    type = "item",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    order = "a[light]-a[small-lamp]",
    place_result = "small-lamp",
    stack_size = 50
  },
  {
    type = "item",
    name = "pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-b[pipe-to-ground]",
    place_result = "pipe-to-ground",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "a[assembling-machine-1]",
    place_result = "assembling-machine-1",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "b[assembling-machine-2]",
    place_result = "assembling-machine-2",
    stack_size = 50
  },
  {
    type = "item",
    name = "red-wire",
    icon = "__base__/graphics/icons/red-wire.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    order = "b[wires]-a[red-wire]",
    stack_size = 200,
    wire_count = 1
  },
  {
    type = "item",
    name = "green-wire",
    icon = "__base__/graphics/icons/green-wire.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    order = "b[wires]-b[green-wire]",
    stack_size = 200,
    wire_count = 1
  },
  {
    type = "capsule",
    name = "raw-fish",
    icon = "__base__/graphics/icons/fish.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-resource",
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "consume",
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = {type = "physical", amount = -80}
                },
                {
                  type = "play-sound",
                  sound = sounds.eat_fish
                }
              }
            }
          }
        }
      }
    },
    order = "h[raw-fish]",
    stack_size = 100
  },
  {
    type = "repair-tool",
    name = "repair-pack",
    icon = "__base__/graphics/icons/repair-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "tool",
    order = "b[repair]-a[repair-pack]",
    speed = 2,
    durability = 300,
    stack_size = 100
  },
  {
    type = "item",
    name = "stone-wall",
    icon = "__base__/graphics/icons/wall.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "a[stone-wall]-a[stone-wall]",
    place_result = "stone-wall",
    stack_size = 100
  },
  {
    type = "item",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "g[lab]",
    place_result = "lab",
    stack_size = 10
  },
  {
    type = "copy-paste-tool",
    name = "copy-paste-tool",
    icon = "__base__/graphics/icons/copy-paste-tool.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"only-in-cursor", "hidden", "not-stackable"},
    subgroup = "tool",
    order = "c[automated-construction]-x",
    stack_size = 1,
    draw_label_for_cursor_render = true,
    selection_color = {1, 1, 1},
    alt_selection_color = {0, 1, 1},
    selection_mode = {"blueprint", "avoid-rolling-stock"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    -- mouse_cursor = "selection-tool-cursor"
  },
  {
    type = "copy-paste-tool",
    name = "cut-paste-tool",
    icon = "__base__/graphics/icons/cut-paste-tool.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"only-in-cursor", "hidden", "not-stackable"},
    subgroup = "tool",
    order = "c[automated-construction]-x",
    stack_size = 1,
    draw_label_for_cursor_render = true,
    selection_color = {1, 1, 1},
    alt_selection_color = {1, 1, 1},
    selection_mode = {"blueprint", "avoid-rolling-stock"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    cuts = true
  },
  {
    type = "blueprint",
    name = "blueprint",
    icon = "__base__/graphics/icons/blueprint.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-stackable", "spawnable"},
    subgroup = "tool",
    order = "c[automated-construction]-a[blueprint]",
    stack_size = 1,
    draw_label_for_cursor_render = true,
    selection_color = {57, 156, 251},
    alt_selection_color = {0.3, 0.8, 1},
    selection_count_button_color = {43, 113, 180},
    alt_selection_count_button_color = {0.3, 0.8, 1},
    selection_mode = {"blueprint"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    open_sound = {filename =  "__base__/sound/item-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/item-close.ogg", volume = 1}
  },
  {
    type = "tool",
    name = "automation-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/automation-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "a[automation-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "logistic-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/logistic-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "b[logistic-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "item",
    name = "steel-plate",
    icon = "__base__/graphics/icons/steel-plate.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "d[steel-plate]",
    stack_size = 100
  },
  {
    type = "item-with-entity-data",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "transport",
    order = "b[personal-transport]-a[car]",
    place_result = "car",
    stack_size = 1
  },
  {
    type = "item",
    name = "engine-unit",
    icon = "__base__/graphics/icons/engine-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "h[engine-unit]",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "c[electric-furnace]",
    place_result = "electric-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "solid-fuel",
    icon = "__base__/graphics/icons/solid-fuel.png",
    icon_size = 64, icon_mipmaps = 4,
    fuel_category = "chemical",
    fuel_value = "12MJ",
    fuel_acceleration_multiplier = 1.2,
    fuel_top_speed_multiplier = 1.05,
    subgroup = "raw-material",
    order = "c[solid-fuel]",
    stack_size = 50
  },
  {
    type = "item",
    name = "rocket-fuel",
    icon = "__base__/graphics/icons/rocket-fuel.png",
    icon_size = 64, icon_mipmaps = 4,
    fuel_category = "chemical",
    fuel_value = "100MJ",
    fuel_acceleration_multiplier = 1.8,
    fuel_top_speed_multiplier = 1.15,
    subgroup = "intermediate-product",
    order = "p[rocket-fuel]",
    stack_size = 10
  },
  {
    type = "item",
    name = "iron-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "a[items]-b[iron-chest]",
    place_result = "iron-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-c[big-electric-pole]",
    place_result = "big-electric-pole",
    stack_size = 50
  },
  {
    type = "item",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-b[medium-electric-pole]",
    place_result = "medium-electric-pole",
    stack_size = 50
  },
  {
    type = "capsule",
    name = "grenade",
    icon = "__base__/graphics/icons/grenade.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 15,
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "grenade",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
        }
      }
    },
    -- radius_color = { r = 0.25, g = 0.05, b = 0.25, a = 0.25 },
    subgroup = "capsule",
    order = "a[grenade]-a[normal]",
    stack_size = 100
  },
  {
    type = "item",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "b[steel-furnace]",
    place_result = "steel-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "gate",
    icon = "__base__/graphics/icons/gate.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "a[wall]-b[gate]",
    place_result = "gate",
    stack_size = 50
  },
  {
    type = "item",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "a[items]-c[steel-chest]",
    place_result = "steel-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "d[solar-panel]-a[solar-panel]",
    place_result = "solar-panel",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "locomotive",
    icon = "__base__/graphics/icons/locomotive.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-f[locomotive]",
    place_result = "locomotive",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-g[cargo-wagon]",
    place_result = "cargo-wagon",
    stack_size = 5
  },
  {
    type = "rail-planner",
    name = "rail",
    icon = "__base__/graphics/icons/rail.png",
    icon_size = 64, icon_mipmaps = 4,
    localised_name = {"item-name.rail"},
    subgroup = "train-transport",
    order = "a[train-system]-a[rail]",
    place_result = "straight-rail",
    stack_size = 100,
    straight_rail = "straight-rail",
    curved_rail = "curved-rail"
  },
  {
    type = "item",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-c[train-stop]",
    place_result = "train-stop",
    stack_size = 10
  },
  {
    type = "item",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-d[rail-signal]",
    place_result = "rail-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-e[rail-signal-chain]",
    place_result = "rail-chain-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "concrete",
    icon = "__base__/graphics/icons/concrete.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "terrain",
    order = "b[concrete]-a[plain]",
    stack_size = 100,
    place_as_tile =
    {
      result = "concrete",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "refined-concrete",
    icon = "__base__/graphics/icons/refined-concrete.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "terrain",
    order = "b[concrete]-c[refined]",
    stack_size = 100,
    place_as_tile =
    {
      result = "refined-concrete",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "hazard-concrete",
    icon = "__base__/graphics/icons/hazard-concrete.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "terrain",
    order = "b[concrete]-b[hazard]",
    stack_size = 100,
    place_as_tile =
    {
      result = "hazard-concrete-left",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "refined-hazard-concrete",
    icon = "__base__/graphics/icons/refined-hazard-concrete.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "terrain",
    order = "b[concrete]-d[refined-hazard]",
    stack_size = 100,
    place_as_tile =
    {
      result = "refined-hazard-concrete-left",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "landfill",
    icon = "__base__/graphics/icons/landfill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "terrain",
    order = "c[landfill]-a[dirt]",
    stack_size = 100,
    place_as_tile =
    {
      result = "landfill",
      condition_size = 1,
      condition = { "ground-tile" }
    }
  },
  {
    type = "item",
    name = "accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "e[accumulator]-a[accumulator]",
    place_result = "accumulator",
    stack_size = 50
  },

  {
    type = "item",
    name = "uranium-ore",
    icon = "__base__/graphics/icons/uranium-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore-1.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore-1.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore-2.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore-2.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore-3.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore-3.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      }
    },
    subgroup = "raw-resource",
    order = "g[uranium-ore]",
    stack_size = 50
  },

  {
    type = "capsule",
    name = "defender-capsule",
    icon = "__base__/graphics/icons/defender.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 20,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "defender-capsule",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "d[defender-capsule]",
    stack_size = 100
  },
  {
    type = "item",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "a[transport-belt]-a[transport-belt]",
    place_result = "transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "a[transport-belt]-b[fast-transport-belt]",
    place_result = "fast-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "a[transport-belt]-c[express-transport-belt]",
    place_result = "express-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "stack-inserter",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "f[stack-inserter]",
    place_result = "stack-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "stack-filter-inserter",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "inserter",
    order = "g[stack-filter-inserter]",
    place_result = "stack-filter-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "c[assembling-machine-3]",
    place_result = "assembling-machine-3",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-h[fluid-wagon]",
    place_result = "fluid-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",
    order = "a[train-system]-i[artillery-wagon]",
    place_result = "artillery-wagon",
    stack_size = 5
  },
  {
    type = "item",
    name = "player-port",
    icon = "__base__/graphics/icons/player-port.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "defensive-structure",
    order = "z[not-used]",
    place_result = "player-port",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "tank",
    icon = "__base__/graphics/icons/tank.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "transport",
    order = "b[personal-transport]-b[tank]",
    place_result = "tank",
    stack_size = 1
  },
  {
    type = "tool",
    name = "chemical-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/chemical-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "d[chemical-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "military-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/military-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "c[military-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "production-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/production-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "e[production-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "utility-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/utility-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "f[utility-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "space-science-pack",
    icon = "__base__/graphics/icons/space-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "g[space-science-pack]",
    stack_size = 2000,
    durability = 1,
    rocket_launch_product = {"raw-fish", 1},
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "item",
    name = "underground-belt",
    icon = "__base__/graphics/icons/underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "b[underground-belt]-a[underground-belt]",
    place_result = "underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-underground-belt",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "b[underground-belt]-b[fast-underground-belt]",
    place_result = "fast-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-underground-belt",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "b[underground-belt]-c[express-underground-belt]",
    place_result = "express-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "splitter",
    icon = "__base__/graphics/icons/splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "c[splitter]-a[splitter]",
    place_result = "splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "c[splitter]-b[fast-splitter]",
    place_result = "fast-splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "c[splitter]-c[express-splitter]",
    place_result = "express-splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "belt",
    order = "d[loader]-a[basic-loader]",
    place_result = "loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-loader",
    icon = "__base__/graphics/icons/fast-loader.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "belt",
    order = "d[loader]-b[fast-loader]",
    place_result = "fast-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-loader",
    icon = "__base__/graphics/icons/express-loader.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "belt",
    order = "d[loader]-c[express-loader]",
    place_result = "express-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "advanced-circuit",
    icon = "__base__/graphics/icons/advanced-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "f[advanced-circuit]",
    stack_size = 200
  },
  {
    type = "item",
    name = "processing-unit",
    icon = "__base__/graphics/icons/processing-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "g[processing-unit]",
    stack_size = 100
  },
  {
    type = "item",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "a[robot]-a[logistic-robot]",
    place_result = "logistic-robot",
    stack_size = 50
  },
  {
    type = "item",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "a[robot]-b[construction-robot]",
    place_result = "construction-robot",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-passive-provider",
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-passive-provider]",
    place_result = "logistic-chest-passive-provider",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-active-provider",
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-active-provider]",
    place_result = "logistic-chest-active-provider",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-storage",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-storage]",
    place_result = "logistic-chest-storage",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-buffer",
    icon = "__base__/graphics/icons/logistic-chest-buffer.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "b[storage]-d[logistic-chest-buffer]",
    place_result = "logistic-chest-buffer",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-requester",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "b[storage]-e[logistic-chest-requester]",
    place_result = "logistic-chest-requester",
    stack_size = 50
  },
  {
    type = "item",
    name = "rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "space-related",
    order = "e[rocket-silo]",
    place_result = "rocket-silo",
    stack_size = 1
  },
  {
    type = "item",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "c[signal]-a[roboport]",
    place_result = "roboport",
    stack_size = 10
  },
  {
    type = "item",
    name = "coin",
    icon = "__base__/graphics/icons/coin.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "science-pack",
    order = "y",
    stack_size = 100000
  },
  {
    type = "item",
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[substation]",
    place_result = "substation",
    stack_size = 50
  },
  {
    type = "item",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    order = "a[beacon]",
    place_result = "beacon",
    stack_size = 10
  },
  {
    type = "item",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "b[fluid]-a[storage-tank]",
    place_result = "storage-tank",
    stack_size = 50
  },
  {
    type = "item",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-c[pump]",
    place_result = "pump",
    stack_size = 50
  },
  {
    type = "upgrade-item",
    name = "upgrade-planner",
    icon = "__base__/graphics/icons/upgrade-planner.png",
    flags = {"spawnable"},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "tool",
    order = "c[automated-construction]-c[upgrade-planner]",
    stack_size = 1,
    mapper_count = 24,
    selection_color = {71, 255, 73},
    -- Not working!! it's black - selection_count_button_color = {19, 174, 20},
    alt_selection_color = {239, 153, 34},
    -- Not working!! it's black - alt_selection_count_button_color = {255, 176, 66},
    reverse_selection_color = {246, 255, 0},
    selection_mode = {"upgrade"},
    alt_selection_mode = {"cancel-upgrade"},
    reverse_selection_mode = {"downgrade"},
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed",
    reverse_selection_cursor_box_type = "not-allowed",
    open_sound = {filename =  "__base__/sound/item-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/item-close.ogg", volume = 1}
  },
  {
    type = "deconstruction-item",
    name = "deconstruction-planner",
    icon = "__base__/graphics/icons/deconstruction-planner.png",
    flags = {"spawnable"},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "tool",
    order = "c[automated-construction]-b[deconstruction-planner]",
    stack_size = 1,
    entity_filter_count = 30,
    tile_filter_count = 30,
    selection_color = {255, 24, 24},
    selection_count_button_color = {195, 52, 52},
    alt_selection_color = {239, 153, 34},
    alt_selection_count_button_color = {255, 176, 66},
    selection_mode = {"deconstruct"},
    alt_selection_mode = {"cancel-deconstruct"},
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed",
    open_sound = {filename =  "__base__/sound/item-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/item-close.ogg", volume = 1}
  },
  {
    type = "blueprint-book",
    name = "blueprint-book",
    icon = "__base__/graphics/icons/blueprint-book.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"spawnable"},
    subgroup = "tool",
    order = "c[automated-construction]-d[blueprint-book]",
    stack_size = 1,
    inventory_size = "dynamic",
    open_sound = {filename =  "__base__/sound/item-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/item-close.ogg", volume = 1}
  },
  {
    type = "item",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "extraction-machine",
    order = "b[fluids]-b[pumpjack]",
    place_result = "pumpjack",
    stack_size = 20
  },
  {
    type = "item",
    name = "oil-refinery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "d[refinery]",
    place_result = "oil-refinery",
    stack_size = 10
  },
  {
    type = "item",
    name = "chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "e[chemical-plant]",
    place_result = "chemical-plant",
    stack_size = 10
  },
  {
    type = "item",
    name = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "g[sulfur]",
    stack_size = 50
  },
  {
    type = "item",
    name = "empty-barrel",
    icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "d[empty-barrel]",
    stack_size = 10
  },
  {
    type = "item",
    name = "plastic-bar",
    icon = "__base__/graphics/icons/plastic-bar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "f[plastic-bar]",
    stack_size = 100
  },
  {
    type = "item",
    name = "electric-engine-unit",
    icon = "__base__/graphics/icons/electric-engine-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "i[electric-engine-unit]",
    stack_size = 50
  },
  {
    type = "item",
    name = "explosives",
    icon = "__base__/graphics/icons/explosives.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "j[explosives]",
    stack_size = 50
  },
  {
    type = "item",
    name = "battery",
    icon = "__base__/graphics/icons/battery.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "h[battery]",
    stack_size = 200
  },
  {
    type = "item",
    name = "flying-robot-frame",
    icon = "__base__/graphics/icons/flying-robot-frame.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "l[flying-robot-frame]",
    stack_size = 50
  },
  {
    type = "item",
    name = "low-density-structure",
    icon = "__base__/graphics/icons/low-density-structure.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "o[low-density-structure]",
    stack_size = 10
  },
  {
    type = "item",
    name = "nuclear-fuel",
    icon = "__base__/graphics/icons/nuclear-fuel.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel-light.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    fuel_category = "chemical",
    fuel_value = "1.21GJ",
    fuel_acceleration_multiplier = 2.5,
    fuel_top_speed_multiplier = 1.15,
    -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
    subgroup = "intermediate-product",
    order = "q[uranium-rocket-fuel]",
    stack_size = 1
  },
  {
    type = "item",
    name = "rocket-control-unit",
    icon = "__base__/graphics/icons/rocket-control-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "n[rocket-control-unit]",
    stack_size = 10
  },
  {
    type = "item",
    name = "rocket-part",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "intermediate-product",
    order = "q[rocket-part]",
    stack_size = 5
  },
  {
    type = "item",
    name = "satellite",
    icon = "__base__/graphics/icons/satellite.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "space-related",
    order = "m[satellite]",
    stack_size = 1,
    rocket_launch_product = {"space-science-pack", 1000}
  },
  {
    type = "item-with-entity-data",
    name = "spidertron",
    icon = "__base__/graphics/icons/spidertron.png",
    icon_tintable = "__base__/graphics/icons/spidertron-tintable.png",
    icon_tintable_mask = "__base__/graphics/icons/spidertron-tintable-mask.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-a[spider]",
    place_result="spidertron",
    stack_size = 1
  },
  {
    type = "spidertron-remote",
    name = "spidertron-remote",
    icon = "__base__/graphics/icons/spidertron-remote.png",
    icon_color_indicator_mask = "__base__/graphics/icons/spidertron-remote-mask.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-b[remote]",
    stack_size = 1
  },
  {
    -- This allows loading the selection-tool type item when mods are removed
    type = "selection-tool",
    name = "selection-tool",
    icon = "__base__/graphics/icons/blueprint.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden", "not-stackable", "spawnable"},
    subgroup = "other",
    order = "e[automated-construction]-a[blueprint]",
    stack_size = 1,
    selection_color = { r = 255, g = 255, b = 255 },
    alt_selection_color = { r = 0, g = 1, b = 0 },
    selection_mode = {"blueprint"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    --entity_filters = {"stone-furnace", "steel-furnace"},
    --entity_type_filters = {"furnace", "assembling-machine"},
    --tile_filters = {"concrete", "stone-path"},
    --entity_filter_mode = "whitelist",
    --tile_filter_mode = "whitelist",
    --alt_entity_filters = {"stone-furnace", "steel-furnace"},
    --alt_entity_type_filters = {"furnace", "assembling-machine"},
    --alt_tile_filters = {"concrete", "stone-path"},
    --alt_entity_filter_mode = "whitelist",
    --alt_tile_filter_mode = "whitelist",
    --reverse_entity_filters = {"stone-furnace", "steel-furnace"},
    --reverse_entity_type_filters = {"furnace", "assembling-machine"},
    --reverse_tile_filters = {"concrete", "stone-path"},
    --reverse_entity_filter_mode = "whitelist",
    --reverse_tile_filter_mode = "whitelist"
  },
  {
    type = "item",
    name = "electric-energy-interface",
    icons = { {icon = "__base__/graphics/icons/accumulator.png", tint = {r=1, g=0.8, b=1, a=1}} },
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "a[electric-energy-interface]-b[electric-energy-interface]",
    place_result = "electric-energy-interface",
    stack_size = 50
  },
  {
    type = "item",
    name = "heat-interface",
    icon = "__base__/graphics/icons/heat-interface.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "b[heat-interface]",
    place_result = "heat-interface",
    stack_size = 20
  },
  {
    type = "item",
    name = "nuclear-reactor",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "f[nuclear-energy]-a[reactor]",
    place_result = "nuclear-reactor",
    stack_size = 10
  },
  {
    type = "item",
    name = "uranium-235",
    icon = "__base__/graphics/icons/uranium-235.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/uranium-235.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          blend_mode = "additive",
          size = 64,
          filename = "__base__/graphics/icons/uranium-235.png",
          scale = 0.25,
          tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
          mipmap_count = 4
        }
      }
    },
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[uranium-235]",
    stack_size = 100
  },
  {
    type = "item",
    name = "uranium-238",
    icon = "__base__/graphics/icons/uranium-238.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[uranium-238]",
    stack_size = 100
  },
  {
    type = "item",
    name = "centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "production-machine",
    order = "g[centrifuge]",
    place_result = "centrifuge",
    stack_size = 50
  },
  {
    type = "item",
    name = "uranium-fuel-cell",
    icon = "__base__/graphics/icons/uranium-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/uranium-fuel-cell.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-a[uranium-fuel-cell]",
    fuel_category = "nuclear",
    burnt_result = "used-up-uranium-fuel-cell",
    fuel_value = "8GJ",
    stack_size = 50
  },
  {
    type = "item",
    name = "used-up-uranium-fuel-cell",
    icon = "__base__/graphics/icons/used-up-uranium-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[used-up-uranium-fuel-cell]",
    stack_size = 50
  },
  {
    type = "item",
    name = "heat-exchanger",
    icon = "__base__/graphics/icons/heat-boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "f[nuclear-energy]-c[heat-exchanger]",
    place_result = "heat-exchanger",
    stack_size = 50
  },
  {
    type = "item",
    name = "steam-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "f[nuclear-energy]-d[steam-turbine]",
    place_result = "steam-turbine",
    stack_size = 10
  },
  {
    type = "item",
    name = "heat-pipe",
    icon = "__base__/graphics/icons/heat-pipe.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "f[nuclear-energy]-b[heat-pipe]",
    place_result = "heat-pipe",
    stack_size = 50
  },
  {
    type = "item",
    name = "simple-entity-with-force",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[simple-entity-with-force]-f[simple-entity-with-force]",
    place_result = "simple-entity-with-force",
    stack_size = 50
  },
  {
    type = "item",
    name = "simple-entity-with-owner",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[simple-entity-with-owner]-o[simple-entity-with-owner]",
    place_result = "simple-entity-with-owner",
    stack_size = 50
  },
  {
    type = "item-with-tags",
    name = "item-with-tags",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[item-with-tags]-o[item-with-tags]",
    stack_size = 1
  },
  {
    type = "item-with-label",
    name = "item-with-label",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[item-with-label]-o[item-with-label]",
    stack_size = 1
  },
  {
    type = "item-with-inventory",
    name = "item-with-inventory",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[item-with-inventory]-o[item-with-inventory]",
    stack_size = 1,
    inventory_size = 1
  },
  {
    type = "item",
    name = "infinity-chest",
    icon = "__base__/graphics/icons/infinity-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "c[item]-o[infinity-chest]",
    stack_size = 10,
    place_result = "infinity-chest"
  },
  {
    type = "item",
    name = "infinity-pipe",
    icons =
    {{
      icon = "__base__/graphics/icons/pipe.png",
      tint = {r = 0.5, g = 0.5, b = 1}
    }},
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "d[item]-o[infinity-pipe]",
    stack_size = 10,
    place_result = "infinity-pipe"
  },
  {
    type = "item",
    name = "burner-generator",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "t[item]-o[burner-generator]",
    stack_size = 10,
    place_result = "burner-generator"
  },
  {
    type = "item",
    name = "linked-chest",
    icon = "__base__/graphics/icons/linked-chest-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "a[items]-a[linked-chest]",
    place_result = "linked-chest",
    stack_size = 10
  },
  {
    type = "item",
    name = "linked-belt",
    icon = "__base__/graphics/icons/linked-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "other",
    order = "b[items]-b[linked-belt]",
    place_result = "linked-belt",
    stack_size = 10
  },
  {
    type = "module",
    name = "speed-module",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "speed",
    tier = 1,
    order = "a[speed]-a[speed-module-1]",
    stack_size = 50,
    effect = { speed = {bonus = 0.2}, consumption = {bonus = 0.5}},
    beacon_tint =
    {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "speed-module-2",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "speed",
    tier = 2,
    order = "a[speed]-b[speed-module-2]",
    stack_size = 50,
    effect = { speed = {bonus = 0.3}, consumption = {bonus = 0.6}},
    beacon_tint =
    {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "speed-module-3",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "speed",
    tier = 3,
    order = "a[speed]-c[speed-module-3]",
    stack_size = 50,
    effect = { speed = {bonus = 0.5}, consumption = {bonus = 0.7}},
    beacon_tint =
    {
      primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
      secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "effectivity-module",
    localised_description = {"item-description.effectivity-module"},
    icon = "__base__/graphics/icons/effectivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "effectivity",
    tier = 1,
    order = "c[effectivity]-a[effectivity-module-1]",
    stack_size = 50,
    effect = { consumption = {bonus = -0.3}},
    beacon_tint =
    {
      primary = { 0, 1, 0 },
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "effectivity-module-2",
    localised_description = {"item-description.effectivity-module"},
    icon = "__base__/graphics/icons/effectivity-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "effectivity",
    tier = 2,
    order = "c[effectivity]-b[effectivity-module-2]",
    stack_size = 50,
    effect = { consumption = {bonus = -0.4}},
    beacon_tint =
    {
      primary = { 0, 1, 0 },
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "effectivity-module-3",
    localised_description = {"item-description.effectivity-module"},
    icon = "__base__/graphics/icons/effectivity-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "effectivity",
    tier = 3,
    order = "c[effectivity]-c[effectivity-module-3]",
    stack_size = 50,
    effect = { consumption = {bonus = -0.5}},
    beacon_tint =
    {
      primary = { 0, 1, 0 },
      secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "productivity-module",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "productivity",
    tier = 1,
    order = "c[productivity]-a[productivity-module-1]",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.04},
      consumption = {bonus = 0.4},
      pollution = {bonus = 0.05},
      speed = {bonus = -0.05}
    },
    limitation = productivity_module_limitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-2",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "productivity",
    tier = 2,
    order = "c[productivity]-b[productivity-module-2]",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.06},
      consumption = {bonus = 0.6},
      pollution = {bonus = 0.07},
      speed = {bonus = -0.1}
    },
    limitation = productivity_module_limitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
  {
    type = "module",
    name = "productivity-module-3",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "module",
    category = "productivity",
    tier = 3,
    order = "c[productivity]-c[productivity-module-3]",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.1},
      consumption = {bonus = 0.8},
      pollution = {bonus = 0.1},
      speed = {bonus = -0.15}
    },
    limitation = productivity_module_limitation(),
    limitation_message_key = "production-module-usable-only-on-intermediates"
  },
    {
    type = "ammo",
    name = "uranium-rounds-magazine",
    icon = "__base__/graphics/icons/uranium-rounds-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/uranium-rounds-magazine.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__base__/graphics/icons/uranium-rounds-magazine-light.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
              offsets = {{0, 1}},
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
            },
            {
              type = "damage",
              damage = { amount = 24, type = "physical"}
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-c[uranium-rounds-magazine]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "flamethrower-ammo",
    icon = "__base__/graphics/icons/flamethrower-ammo.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      {
        source_type = "default",
        category = "flamethrower",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "handheld-flamethrower-fire-stream"
          }
        }
      },
      {
        source_type = "vehicle",
        consumption_modifier = 1.125,
        category = "flamethrower",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "tank-flamethrower-fire-stream"
          }
        }
      }
    },
    magazine_size = 100,
    subgroup = "ammo",
    order = "e[flamethrower]",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "rocket",
    icon = "__base__/graphics/icons/rocket.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-a[basic]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "explosive-rocket",
    icon = "__base__/graphics/icons/explosive-rocket.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-b[explosive]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "atomic-bomb",
    icon = "__base__/graphics/icons/atomic-bomb.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/atomic-bomb.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__base__/graphics/icons/atomic-bomb-light.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    ammo_type =
    {
      range_modifier = 1.5,
      cooldown_modifier = 10,
      target_type = "position",
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "atomic-rocket",
          starting_speed = 0.05,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-c[atomic-bomb]",
    stack_size = 10
  },
  {
    type = "ammo",
    name = "piercing-shotgun-shell",
    icon = "__base__/graphics/icons/piercing-shotgun-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 16,
          action_delivery =
          {
            type = "projectile",
            projectile = "piercing-shotgun-pellet",
            starting_speed = 1,
            starting_speed_deviation = 0.1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "b[shotgun]-b[piercing]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "cannon-shell",
    icon = "__base__/graphics/icons/cannon-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-a[basic]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "explosive-cannon-shell",
    icon = "__base__/graphics/icons/explosive-cannon-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[explosive]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "uranium-cannon-shell",
    icon = "__base__/graphics/icons/uranium-cannon-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/uranium-cannon-shell.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__base__/graphics/icons/uranium-cannon-shell-light.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[uranium]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "explosive-uranium-cannon-shell",
    icon = "__base__/graphics/icons/explosive-uranium-cannon-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/explosive-uranium-cannon-shell.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__base__/graphics/icons/uranium-cannon-shell-light.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-c[uranium]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "artillery-shell",
    icon = "__base__/graphics/icons/artillery-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "artillery-shell",
      target_type = "position",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "artillery",
          projectile = "artillery-projectile",
          starting_speed = 1,
          direction_deviation = 0,
          range_deviation = 0,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "artillery-cannon-muzzle-flash"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-d[artillery]",
    stack_size = 1
  },
  {
    type = "gun",
    name = "flamethrower",
    icon = "__base__/graphics/icons/flamethrower.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "e[flamethrower]",
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      movement_slow_down_factor = 0.4,
      gun_barrel_length = 0.8,
      gun_center_shift = { 0, -1 },
      range = 15,
      min_range = 3,
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 0.7
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 0.7
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 0.7
          }
        }
      }
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "tank-machine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-b[tank-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 4,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -0.6875,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_center = {-0.15625, -0.07812},
      projectile_creation_distance = 1,
      range = 20,
      sound = sounds.heavy_gunshot
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "tank-flamethrower",
    icon = "__base__/graphics/icons/flamethrower.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "b[flamethrower]-b[tank-flamethrower]",
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      gun_barrel_length = 1.4,
      gun_center_shift = { -0.17, -1.15 },
      range = 9,
      min_range = 3,
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 1
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 1
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 1
          }
        }
      }
    },
    stack_size = 1
  },
  {
    type = "item",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "f[land-mine]",
    place_result = "land-mine",
    stack_size = 100
  },
  {
    type = "gun",
    name = "rocket-launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "d[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      movement_slow_down_factor = 0.8,
      cooldown = 60,
      projectile_creation_distance = 0.6,
      range = 36,
      projectile_center = {-0.17, 0},
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "combat-shotgun",
    icon = "__base__/graphics/icons/combat-shotgun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "b[shotgun]-a[combat]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = 30,
      movement_slow_down_factor = 0.5,
      damage_modifier = 1.2,
      projectile_creation_distance = 1.125,
      range = 15,
      sound = sounds.shotgun
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "tank-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 90,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.6,
      projectile_center = {-0.15625, -0.07812},
      range = 30,
      sound = sounds.tank_gunshot
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "artillery-wagon-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[artillery]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "artillery-shell",
      cooldown = 200,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.6,
      projectile_center = {-0.15625, -0.07812},
      range = 7 * 32,
      min_range = 1 * 32,
      projectile_creation_parameters = require("prototypes.entity.artillery-cannon-muzzle-flash-shifting"),
      sound =
      {
        switch_vibration_data =
        {
          filename = "__base__/sound/fight/artillery-shoots.bnvib",
          play_for = "everything"
        },
        game_controller_vibration_data =
        {
          low_frequency_vibration_intensity = 1,
          duration = 150,
          play_for = "everything"
        },
        variations =
        {
          filename = "__base__/sound/fight/artillery-shoots-1.ogg",
          volume = 0.7
        }
      },
      shell_particle =
      {
        name = "artillery-shell-particle",
        direction_deviation = 0.05,
        direction = 0.4,
        speed = 0.10,
        speed_deviation = 0.1,
        vertical_speed = 0.05,
        vertical_speed_deviation = 0.01,
        center = {0, -0.5},
        creation_distance = 0.5,
        creation_distance_orientation = 0.4,
        starting_frame_speed = 0.5,
        starting_frame_speed_deviation = 0.5,
        use_source_position = true,
        height = 1
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-1",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = -0.0625,
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-2",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_orientation_offset = -0.03125,
      projectile_center = {0, 0.3},
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-3",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = 0.03125,
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-4",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"hidden"},
    order = "z[spider]-a[rocket-launcher]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = 0.0625,
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 1
  },
    {
    type = "armor",
    name = "modular-armor",
    icon = "__base__/graphics/icons/modular-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "acid",
        decrease = 0,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 30,
        percent = 35
      },
      {
        type = "fire",
        decrease = 0,
        percent = 40
      }
    },
    subgroup = "armor",
    order = "c[modular-armor]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "small-equipment-grid",
    inventory_size_bonus = 10,
    open_sound = {filename =  "__base__/sound/armor-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/armor-close.ogg", volume = 1}
  },
  {
    type = "armor",
    name = "power-armor",
    icon = "__base__/graphics/icons/power-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 8,
        percent = 30
      },
      {
        type = "acid",
        decrease = 0,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 40,
        percent = 40
      },
      {
        type = "fire",
        decrease = 0,
        percent = 60
      }
    },
    subgroup = "armor",
    order = "d[power-armor]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "medium-equipment-grid",
    inventory_size_bonus = 20,
    open_sound = {filename =  "__base__/sound/armor-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/armor-close.ogg", volume = 1}
  },
  {
    type = "armor",
    name = "power-armor-mk2",
    icon = "__base__/graphics/icons/power-armor-mk2.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 10,
        percent = 40
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 60,
        percent = 50
      },
      {
        type = "fire",
        decrease = 0,
        percent = 70
      }
    },
    subgroup = "armor",
    order = "e[power-armor-mk2]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "large-equipment-grid",
    inventory_size_bonus = 30,
    open_sound = {filename =  "__base__/sound/armor-open.ogg", volume = 1},
    close_sound = {filename = "__base__/sound/armor-close.ogg", volume = 1}
  },
    {
    type = "capsule",
    name = "cluster-grenade",
    icon = "__base__/graphics/icons/cluster-grenade.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 20,
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "cluster-grenade",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "a[grenade]-b[cluster]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "poison-capsule",
    icon = "__base__/graphics/icons/poison-capsule.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "poison-capsule",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "b[poison-capsule]",
    stack_size = 100
   },
   {
    type = "capsule",
    name = "slowdown-capsule",
    icon = "__base__/graphics/icons/slowdown-capsule.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "slowdown-capsule",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "c[slowdown-capsule]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "distractor-capsule",
    icon = "__base__/graphics/icons/distractor.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "distractor-capsule",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "e[defender-capsule]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "destroyer-capsule",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "destroyer-capsule",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "f[destroyer-capsule]",
    stack_size = 100
  },
  {
    type = "capsule",
    name = "cliff-explosives",
    icon = "__base__/graphics/icons/cliff-explosives.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hide-from-bonus-gui"},
    capsule_action =
    {
      type = "destroy-cliffs",
      radius = 1.5,
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "cliff-explosives",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "terrain",
    order = "d[cliff-explosives]",
    stack_size = 20
  },
  {
    type = "ammo",
    name = "firearm-magazine",
    icon = "__base__/graphics/icons/firearm-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "bullet",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = { amount = 5 , type = "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "piercing-rounds-magazine",
    icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
              offsets = {{0, 1}},
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
            },
            {
              type = "damage",
              damage = { amount = 8, type = "physical"}
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-b[piercing-rounds-magazine]",
    stack_size = 200
  },
  {
    type = "ammo",
    name = "shotgun-shell",
    icon = "__base__/graphics/icons/shotgun-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = 12,
          action_delivery =
          {
            type = "projectile",
            projectile = "shotgun-pellet",
            starting_speed = 1,
            starting_speed_deviation = 0.1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "b[shotgun]-a[basic]",
    stack_size = 200
  },
  {
    type = "armor",
    name = "light-armor",
    icon = "__base__/graphics/icons/light-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "acid",
        decrease = 0,
        percent = 20
      },
      {
        type = "explosion",
        decrease = 2,
        percent = 20
      },
      {
        type = "fire",
        decrease = 0,
        percent = 10
      }
    },
    subgroup = "armor",
    order = "a[light-armor]",
    stack_size = 1,
    infinite = true
  },
  {
    type = "armor",
    name = "heavy-armor",
    icon = "__base__/graphics/icons/heavy-armor.png",
    icon_size = 64, icon_mipmaps = 4,
    resistances =
    {
      {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 30
      },
      {
        type = "acid",
        decrease = 0,
        percent = 40
      },
      {
        type = "fire",
        decrease = 0,
        percent = 30
      }
    },
    subgroup = "armor",
    order = "b[heavy-armor]",
    stack_size = 1,
    infinite = true
  },
  {
    type = "gun",
    name = "pistol",
    icon = "__base__/graphics/icons/pistol.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-a[pistol]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 15,
      movement_slow_down_factor = 0.2,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = 15,
      sound = sounds.light_gunshot
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "submachine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-b[submachine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 6,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = 18,
      sound = sounds.submachine_gunshot
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "vehicle-machine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-b[vehicle-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 4,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -0.6875,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 0.65,
      range = 20,
      sound = sounds.heavy_gunshot
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "shotgun",
    icon = "__base__/graphics/icons/shotgun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "b[shotgun]-a[basic]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 1.125,
      range = 15,
      min_range = 1,
      sound = sounds.shotgun
    },
    stack_size = 5
  },
    {
    type = "item",
    name = "solar-panel-equipment",
    icon = "__base__/graphics/icons/solar-panel-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "solar-panel-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a[solar-panel]",
    stack_size = 20
  },
  {
    type = "item",
    name = "fusion-reactor-equipment",
    icon = "__base__/graphics/icons/fusion-reactor-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "fusion-reactor-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-b[fusion-reactor]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "battery-equipment",
    icon = "__base__/graphics/icons/battery-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "battery-equipment",
    subgroup = "equipment",
    order = "b[battery]-a[battery-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "battery-mk2-equipment",
    localised_description = {"item-description.battery-equipment"},
    icon = "__base__/graphics/icons/battery-mk2-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "battery-mk2-equipment",
    subgroup = "equipment",
    order = "b[battery]-b[battery-equipment-mk2]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "belt-immunity-equipment",
    icon = "__base__/graphics/icons/belt-immunity-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "belt-immunity-equipment",
    subgroup = "equipment",
    order = "c[belt-immunity]-a[belt-immunity]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "exoskeleton-equipment",
    icon = "__base__/graphics/icons/exoskeleton-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "exoskeleton-equipment",
    subgroup = "equipment",
    order = "d[exoskeleton]-a[exoskeleton-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-roboport-equipment",
    icon = "__base__/graphics/icons/personal-roboport-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "personal-roboport-equipment",
    subgroup = "equipment",
    order = "e[robotics]-a[personal-roboport-equipment]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-roboport-mk2-equipment",
    localised_description = {"item-description.personal-roboport-equipment"},
    icon = "__base__/graphics/icons/personal-roboport-mk2-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "personal-roboport-mk2-equipment",
    subgroup = "equipment",
    order = "e[robotics]-b[personal-roboport-mk2-equipment]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "night-vision-equipment",
    icon = "__base__/graphics/icons/night-vision-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "night-vision-equipment",
    subgroup = "equipment",
    order = "f[night-vision]-a[night-vision-equipment]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "energy-shield-equipment",
    icon = "__base__/graphics/icons/energy-shield-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "energy-shield-equipment",
    subgroup = "military-equipment",
    order = "a[shield]-a[energy-shield-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "energy-shield-mk2-equipment",
    localised_description = {"item-description.energy-shield-equipment"},
    icon = "__base__/graphics/icons/energy-shield-mk2-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "energy-shield-mk2-equipment",
    subgroup = "military-equipment",
    order = "a[shield]-b[energy-shield-equipment-mk2]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-laser-defense-equipment",
    icon = "__base__/graphics/icons/personal-laser-defense-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "personal-laser-defense-equipment",
    subgroup = "military-equipment",
    order = "b[active-defense]-a[personal-laser-defense-equipment]",
    default_request_amount = 5,
    stack_size = 20
  },
  {
    type = "item",
    name = "discharge-defense-equipment",
    icon = "__base__/graphics/icons/discharge-defense-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "discharge-defense-equipment",
    subgroup = "military-equipment",
    order = "b[active-defense]-b[discharge-defense-equipment]-a[equipment]",
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "capsule",
    name = "discharge-defense-remote",
    icon = "__base__/graphics/icons/discharge-defense-equipment-controller.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "equipment-remote",
      equipment = "discharge-defense-equipment"
    },
    subgroup = "military-equipment",
    order = "b[active-defense]-b[discharge-defense-equipment]-b[remote]",
    stack_size = 1
  },
  {
    type = "item",
    name = "gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "b[turret]-a[gun-turret]",
    place_result = "gun-turret",
    stack_size = 50
  },
  {
    type = "item",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "b[turret]-b[laser-turret]",
    place_result = "laser-turret",
    stack_size = 50
  },
  {
    type = "item",
    name = "flamethrower-turret",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "b[turret]-c[flamethrower-turret]",
    place_result = "flamethrower-turret",
    stack_size = 50
  },
  {
    type = "item",
    name = "artillery-turret",
    icon = "__base__/graphics/icons/artillery-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "b[turret]-d[artillery-turret]-a[turret]",
    place_result = "artillery-turret",
    stack_size = 10
  },
  {
    type = "capsule",
    name = "artillery-targeting-remote",
    icon = "__base__/graphics/icons/artillery-targeting-remote.png",
    icon_size = 64, icon_mipmaps = 4,
    capsule_action =
    {
      type = "artillery-remote",
      flare = "artillery-flare"
    },
    subgroup = "defensive-structure",
    order = "b[turret]-d[artillery-turret]-b[remote]",
    stack_size = 1
  },
    {
    type = "item",
    name = "arithmetic-combinator",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    place_result="arithmetic-combinator",
    order = "c[combinators]-a[arithmetic-combinator]",
    stack_size= 50
  },
  {
    type = "item",
    name = "decider-combinator",
    icon = "__base__/graphics/icons/decider-combinator.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    place_result="decider-combinator",
    order = "c[combinators]-b[decider-combinator]",
    stack_size= 50
  },
  {
    type = "item",
    name = "constant-combinator",
    icon = "__base__/graphics/icons/constant-combinator.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    place_result="constant-combinator",
    order = "c[combinators]-c[constant-combinator]",
    stack_size= 50
  },
  {
    type = "item",
    name = "power-switch",
    icon = "__base__/graphics/icons/power-switch.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    place_result="power-switch",
    order = "d[other]-a[power-switch]",
    stack_size= 50
  },
  {
    type = "item",
    name = "programmable-speaker",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    order = "d[other]-b[programmable-speaker]",
    place_result = "programmable-speaker",
    stack_size = 50
  },
  {
    type = "mining-tool",
    name = "dummy-steel-axe",
    icon = "__base__/graphics/icons/steel-axe.png",
    icon_size = 64, icon_mipmaps = 4,
    durability = 1,
    subgroup = "tool",
    order = "a[mining]-b[steel-axe]",
    flags = {"hidden"},
    stack_size = 1
  }
}
)

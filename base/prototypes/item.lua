local sounds = require("prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

function create_item_parameter(number)
  data:extend(
  {
    {
      type = "item",
      name = "parameter-" .. number,
      icon = "__base__/graphics/icons/parameter/parameter-" .. number .. ".png",
      localised_name = {"parameter-x", tostring(number)},
      subgroup = "parameters",
      order = "a",
      parameter = true,
      stack_size = 1
    }
  })
end

for n = 0, 9 do
  create_item_parameter(n)
end

data:extend
({
  {
    type = "item",
    name = "stone-brick",
    icon = "__base__/graphics/icons/stone-brick.png",
    subgroup = "terrain",
    order = "a[stone-brick]",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    stack_size = 100,
    place_as_tile =
    {
      result = "stone-path",
      condition_size = 1,
      condition = {layers={water_tile=true}}
    }
  },
  {
    type = "item",
    name = "wood",
    icon = "__base__/graphics/icons/wood.png",
    fuel_value = "2MJ",
    fuel_category = "chemical",
    subgroup = "raw-resource",
    order = "a[wood]",
    inventory_move_sound = item_sounds.wood_inventory_move,
    pick_sound = item_sounds.wood_inventory_pickup,
    drop_sound = item_sounds.wood_inventory_move,
    stack_size = 100,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "coal",
    icon = "__base__/graphics/icons/coal.png",
    dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
    pictures =
    {
      {size = 64, filename = "__base__/graphics/icons/coal.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/coal-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/coal-2.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/coal-3.png", scale = 0.5, mipmap_count = 4}
    },
    fuel_category = "chemical",
    fuel_value = "4MJ",
    subgroup = "raw-resource",
    order = "b[coal]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2 * kg,
    random_tint_color = item_tints.yellowing_coal
  },
  {
    type = "item",
    name = "stone",
    icon = "__base__/graphics/icons/stone.png",
    pictures =
    {
      {size = 64, filename = "__base__/graphics/icons/stone.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/stone-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/stone-2.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/stone-3.png", scale = 0.5, mipmap_count = 4}
    },
    subgroup = "raw-resource",
    order = "d[stone]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "iron-ore",
    icon = "__base__/graphics/icons/iron-ore.png",
    pictures =
    {
      {size = 64, filename = "__base__/graphics/icons/iron-ore.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/iron-ore-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/iron-ore-2.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/iron-ore-3.png", scale = 0.5, mipmap_count = 4}
    },
    subgroup = "raw-resource",
    color_hint = { text = "I" },
    order = "e[iron-ore]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "copper-ore",
    icon = "__base__/graphics/icons/copper-ore.png",
    pictures =
    {
      {size = 64, filename = "__base__/graphics/icons/copper-ore.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/copper-ore-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/copper-ore-2.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/copper-ore-3.png", scale = 0.5, mipmap_count = 4}
    },
    subgroup = "raw-resource",
    color_hint = { text = "C" },
    order = "f[copper-ore]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "iron-plate",
    icon = "__base__/graphics/icons/iron-plate.png",
    subgroup = "raw-material",
    color_hint = { text = "I" },
    order = "a[smelting]-a[iron-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "copper-plate",
    icon = "__base__/graphics/icons/copper-plate.png",
    subgroup = "raw-material",
    color_hint = { text = "C" },
    order = "a[smelting]-b[copper-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100
  },
  {
    type = "item",
    name = "copper-cable",
    icon = "__base__/graphics/icons/copper-cable.png",
    subgroup = "intermediate-product",
    order = "a[basic-intermediates]-c[copper-cable]",
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    stack_size = 200,
    weight = 0.25 * kg,
    ingredient_to_weight_coefficient = 0.25
  },
  {
    type = "item",
    name = "iron-stick",
    icon = "__base__/graphics/icons/iron-stick.png",
    subgroup = "intermediate-product",
    order = "a[basic-intermediates]-b[iron-stick]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    weight = 0.5 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "iron-gear-wheel",
    icon = "__base__/graphics/icons/iron-gear-wheel.png",
    subgroup = "intermediate-product",
    order = "a[basic-intermediates]-a[iron-gear-wheel]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "electronic-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    subgroup = "intermediate-product",
    color_hint = { text = "1" },
    order = "b[circuits]-a[electronic-circuit]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 200,
    ingredient_to_weight_coefficient = 0.28
  },
  {
    type = "item",
    name = "wooden-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    subgroup = "storage",
    order = "a[items]-a[wooden-chest]",
    inventory_move_sound = item_sounds.wood_inventory_move,
    pick_sound = item_sounds.wood_inventory_pickup,
    drop_sound = item_sounds.wood_inventory_move,
    place_result = "wooden-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    subgroup = "smelting-machine",
    order = "a[stone-furnace]",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    place_result = "stone-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "burner-mining-drill",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    subgroup = "extraction-machine",
    order = "a[items]-a[burner-mining-drill]",
    inventory_move_sound = item_sounds.drill_inventory_move,
    pick_sound = item_sounds.drill_inventory_pickup,
    drop_sound = item_sounds.drill_inventory_move,
    place_result = "burner-mining-drill",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "electric-mining-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    subgroup = "extraction-machine",
    order = "a[items]-b[electric-mining-drill]",
    inventory_move_sound = item_sounds.drill_inventory_move,
    pick_sound = item_sounds.drill_inventory_pickup,
    drop_sound = item_sounds.drill_inventory_move,
    place_result = "electric-mining-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "B" },
    order = "a[burner-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "burner-inserter",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "inserter",
    icon = "__base__/graphics/icons/inserter.png",
    subgroup = "inserter",
    color_hint = { text = "Y" },
    order = "b[inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "F" },
    order = "d[fast-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "fast-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "L" },
    order = "c[long-handed-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "long-handed-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "offshore-pump",
    icon = "__base__/graphics/icons/offshore-pump.png",
    subgroup = "extraction-machine",
    order = "b[fluids]-a[offshore-pump]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "offshore-pump",
    stack_size = 20
  },
  {
    type = "item",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-a[pipe]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "pipe",
    stack_size = 100,
    weight = 5 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    subgroup = "energy",
    order = "b[steam-power]-a[boiler]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "boiler",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    subgroup = "energy",
    order = "b[steam-power]-b[steam-engine]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "steam-engine",
    stack_size = 10,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-a[small-electric-pole]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    place_result = "small-electric-pole",
    stack_size = 50
  },
  {
    type = "item",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    subgroup = "defensive-structure",
    order = "d[radar]-a[radar]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "radar",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    subgroup = "circuit-network",
    order = "a[light]-a[small-lamp]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    place_result = "small-lamp",
    stack_size = 50
  },
  {
    type = "item",
    name = "pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-b[pipe-to-ground]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "pipe-to-ground",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    subgroup = "production-machine",
    color_hint = { text = "1" },
    order = "a[assembling-machine-1]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "assembling-machine-1",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    subgroup = "production-machine",
    color_hint = { text = "2" },
    order = "b[assembling-machine-2]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "assembling-machine-2",
    stack_size = 50
  },
  {
    type = "item",
    name = "red-wire",
    icon = "__base__/graphics/icons/shortcut-toolbar/mip/new-red-wire-x56.png",
    icon_size = 56,
    flags = {"only-in-cursor", "not-stackable", "spawnable"},
    auto_recycle = false,
    subgroup = "spawnables",
    color_hint = { text = "R" },
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    stack_size = 1
  },
  {
    type = "item",
    name = "green-wire",
    icon = "__base__/graphics/icons/shortcut-toolbar/mip/new-green-wire-x56.png",
    icon_size = 56,
    flags = {"only-in-cursor", "not-stackable", "spawnable"},
    auto_recycle = false,
    subgroup = "spawnables",
    color_hint = { text = "G" },
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    stack_size = 1
  },
  {
    type = "item",
    name = "copper-wire",
    icon = "__base__/graphics/icons/shortcut-toolbar/mip/new-copper-wire-x56.png",
    icon_size = 56,
    flags = {"only-in-cursor", "not-stackable", "spawnable"},
    auto_recycle = false,
    subgroup = "spawnables",
    color_hint = { text = "C" },
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    stack_size = 1
  },
  {
    type = "item",
    name = "no-item",
    icon = "__core__/graphics/icons/mip/no-item.png",
    flags = {"not-stackable"},
    hidden = true,
    auto_recycle = false,
    subgroup = "other",
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    stack_size = 1
  },
  {
    type = "capsule",
    name = "raw-fish",
    icon = "__base__/graphics/icons/fish.png",
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
                  damage = {type = "physical", amount = -80},
                  use_substitute = false
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
    inventory_move_sound = item_sounds.raw_fish_inventory_move,
    pick_sound = item_sounds.raw_fish_inventory_pickup,
    drop_sound = item_sounds.raw_fish_inventory_move,
    stack_size = 100,
    weight = 1 * tons / 100 / 3,
    send_to_orbit_mode = "manual"
  },
  {
    type = "repair-tool",
    name = "repair-pack",
    icon = "__base__/graphics/icons/repair-pack.png",
    subgroup = "tool",
    order = "b[repair]-a[repair-pack]",
    inventory_move_sound = item_sounds.repair_pack_inventory_move,
    pick_sound = item_sounds.repair_pack_inventory_pickup,
    drop_sound = item_sounds.repair_pack_inventory_move,
    speed = 2,
    durability = 300,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "stone-wall",
    icon = "__base__/graphics/icons/wall.png",
    subgroup = "defensive-structure",
    order = "a[stone-wall]-a[stone-wall]",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    place_result = "stone-wall",
    stack_size = 100
  },
  {
    type = "item",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    subgroup = "production-machine",
    order = "z[lab]",
    inventory_move_sound = item_sounds.lab_inventory_move,
    pick_sound = item_sounds.lab_inventory_pickup,
    drop_sound = item_sounds.lab_inventory_move,
    place_result = "lab",
    stack_size = 10
  },
  {
    type = "copy-paste-tool",
    name = "copy-paste-tool",
    icon = "__base__/graphics/icons/copy-paste-tool.png",
    flags = {"only-in-cursor", "not-stackable", "spawnable"},
    auto_recycle = false,
    hidden = true,
    subgroup = "tool",
    order = "c[automated-construction]-x",
    stack_size = 1,
    draw_label_for_cursor_render = true,
    select =
    {
      border_color = {1, 1, 1},
      mode = {"blueprint", "avoid-rolling-stock", "avoid-vehicle"},
      cursor_box_type = "copy",
      started_sound = { filename = "__core__/sound/blueprint-select.ogg" },
      ended_sound = { filename = "__core__/sound/blueprint-create.ogg" }
    },
    alt_select =
    {
      border_color = {0, 1, 1},
      mode = {"blueprint"},
      cursor_box_type = "copy",
      started_sound = { filename = "__core__/sound/blueprint-select.ogg" },
      ended_sound = { filename = "__core__/sound/blueprint-create.ogg" }
    },
    pick_sound = "__base__/sound/copy-cursor.ogg"
  },
  {
    type = "copy-paste-tool",
    name = "cut-paste-tool",
    icon = "__base__/graphics/icons/cut-paste-tool.png",
    flags = {"only-in-cursor", "not-stackable", "spawnable"},
    auto_recycle = false,
    hidden = true,
    subgroup = "tool",
    order = "c[automated-construction]-x",
    stack_size = 1,
    draw_label_for_cursor_render = true,
    select =
    {
      border_color = {1, 1, 1},
      mode = {"blueprint", "deconstruct", "avoid-rolling-stock", "avoid-vehicle"},
      cursor_box_type = "copy",
      started_sound = { filename = "__core__/sound/blueprint-select.ogg" },
      ended_sound = { filename = "__core__/sound/blueprint-create.ogg" }
    },
    alt_select =
    {
      border_color = {1, 1, 1},
      mode = {"blueprint", "deconstruct"},
      cursor_box_type = "copy",
      started_sound = { filename = "__core__/sound/blueprint-select.ogg" },
      ended_sound = { filename = "__core__/sound/blueprint-create.ogg" }
    },
    pick_sound = "__base__/sound/cut-cursor.ogg",
    cuts = true
  },
  {
    type = "blueprint",
    name = "blueprint",
    icon = "__base__/graphics/icons/blueprint.png",
    flags = {"not-stackable", "spawnable"},
    subgroup = "tool",
    order = "c[automated-construction]-a[blueprint]",
    inventory_move_sound = item_sounds.planner_inventory_move,
    pick_sound = item_sounds.planner_inventory_pickup,
    drop_sound = item_sounds.planner_inventory_move,
    stack_size = 1,
    draw_label_for_cursor_render = true,
    select =
    {
      border_color = {57, 156, 251},
      count_button_color = {43, 113, 180},
      mode = {"blueprint"},
      cursor_box_type = "copy",
      started_sound = { filename = "__core__/sound/blueprint-select.ogg" },
      ended_sound = { filename = "__core__/sound/blueprint-create.ogg" }
    },
    alt_select =
    {
      border_color = {0.3, 0.8, 1},
      count_button_color = {0.3, 0.8, 1},
      mode = {"blueprint"},
      cursor_box_type = "copy",
      started_sound = { filename = "__core__/sound/blueprint-select.ogg" },
      ended_sound = { filename = "__core__/sound/blueprint-create.ogg" }
    },
    open_sound = "__base__/sound/item-open.ogg",
    close_sound = "__base__/sound/item-close.ogg"
  },
  {
    type = "tool",
    name = "automation-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/automation-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "A" },
    order = "a[automation-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "logistic-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/logistic-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "L" },
    order = "b[logistic-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "item",
    name = "steel-plate",
    icon = "__base__/graphics/icons/steel-plate.png",
    subgroup = "raw-material",
    order = "a[smelting]-c[steel-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item-with-entity-data",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    subgroup = "transport",
    order = "b[personal-transport]-a[car]",
    inventory_move_sound = item_sounds.vehicle_inventory_move,
    pick_sound = item_sounds.vehicle_inventory_pickup,
    drop_sound = item_sounds.vehicle_inventory_move,
    place_result = "car",
    stack_size = 1
  },
  {
    type = "item",
    name = "engine-unit",
    icon = "__base__/graphics/icons/engine-unit.png",
    subgroup = "intermediate-product",
    order = "c[advanced-intermediates]-a[engine-unit]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 50,
    weight = 2.5 * kg
  },
  {
    type = "item",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    subgroup = "smelting-machine",
    order = "c[electric-furnace]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "electric-furnace",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "solid-fuel",
    icon = "__base__/graphics/icons/solid-fuel.png",
    fuel_category = "chemical",
    fuel_value = "12MJ",
    fuel_acceleration_multiplier = 1.2,
    fuel_top_speed_multiplier = 1.05,
    subgroup = "raw-material",
    order = "b[chemistry]-a[solid-fuel]",
    inventory_move_sound = item_sounds.solid_fuel_inventory_move,
    pick_sound = item_sounds.solid_fuel_inventory_pickup,
    drop_sound = item_sounds.solid_fuel_inventory_move,
    stack_size = 50,
    weight = 1 * kg,
    random_tint_color = item_tints.yellowing_coal
  },
  {
    type = "item",
    name = "rocket-fuel",
    icon = "__base__/graphics/icons/rocket-fuel.png",
    fuel_category = "chemical",
    fuel_value = "100MJ",
    fuel_acceleration_multiplier = 1.8,
    fuel_top_speed_multiplier = 1.15,
    subgroup = "intermediate-product",
    order = "d[rocket-parts]-b[rocket-fuel]",
    inventory_move_sound = item_sounds.fuel_cell_inventory_move,
    pick_sound = item_sounds.fuel_cell_inventory_pickup,
    drop_sound = item_sounds.fuel_cell_inventory_move,
    stack_size = 20,
    weight = 10*kg
  },
  {
    type = "item",
    name = "iron-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    subgroup = "storage",
    order = "a[items]-b[iron-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "iron-chest",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-c[big-electric-pole]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "big-electric-pole",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-b[medium-electric-pole]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "medium-electric-pole",
    stack_size = 50
  },
  {
    type = "capsule",
    name = "grenade",
    icon = "__base__/graphics/icons/grenade.png",
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
                  },
                  {
                    type = "play-sound",
                    sound = sounds.throw_grenade
                  },
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "a[grenade]-a[normal]",
    inventory_move_sound = item_sounds.grenade_inventory_move,
    pick_sound = item_sounds.grenade_inventory_pickup,
    drop_sound = item_sounds.grenade_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "item",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    subgroup = "smelting-machine",
    order = "b[steel-furnace]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "steel-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "gate",
    icon = "__base__/graphics/icons/gate.png",
    subgroup = "defensive-structure",
    order = "a[wall]-b[gate]",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    place_result = "gate",
    stack_size = 50
  },
  {
    type = "item",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    subgroup = "storage",
    order = "a[items]-c[steel-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "steel-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    subgroup = "energy",
    order = "d[solar-panel]-a[solar-panel]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "solar-panel",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "locomotive",
    icon = "__base__/graphics/icons/locomotive.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-a[locomotive]",
    inventory_move_sound = item_sounds.locomotive_inventory_move,
    pick_sound = item_sounds.locomotive_inventory_pickup,
    drop_sound = item_sounds.locomotive_inventory_move,
    place_result = "locomotive",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-b[cargo-wagon]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.locomotive_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "cargo-wagon",
    stack_size = 5,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "rail-planner",
    name = "rail",
    icon = "__base__/graphics/icons/rail.png",
    localised_name = {"item-name.rail"},
    subgroup = "train-transport",
    order = "a[rail]-a[rail]",
    inventory_move_sound = item_sounds.train_inventory_move,
    pick_sound = item_sounds.train_inventory_pickup,
    drop_sound = item_sounds.train_inventory_move,
    place_result = "straight-rail",
    stack_size = 100,
    rails =
    {
      "straight-rail",
      "curved-rail-a",
      "curved-rail-b",
      "half-diagonal-rail"
    },
    manual_length_limit = 22.5 -- 2*(Curved-A) + 2*(Curved-B) + their planner penalty + margin
  },
  {
    type = "item",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    subgroup = "train-transport",
    order = "b[train-automation]-a[train-stop]",
    inventory_move_sound = item_sounds.train_inventory_move,
    pick_sound = item_sounds.train_inventory_pickup,
    drop_sound = item_sounds.train_inventory_move,
    place_result = "train-stop",
    stack_size = 10
  },
  {
    type = "item",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    subgroup = "train-transport",
    order = "b[train-automation]-b[rail-signal]",
    inventory_move_sound = item_sounds.rail_signal_inventory_move,
    pick_sound = item_sounds.rail_signal_inventory_pickup,
    drop_sound = item_sounds.rail_signal_inventory_move,
    place_result = "rail-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    subgroup = "train-transport",
    order = "b[train-automation]-c[rail-chain-signal]",
    inventory_move_sound = item_sounds.rail_signal_inventory_move,
    pick_sound = item_sounds.rail_signal_inventory_pickup,
    drop_sound = item_sounds.rail_signal_inventory_move,
    place_result = "rail-chain-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "concrete",
    icon = "__base__/graphics/icons/concrete.png",
    subgroup = "terrain",
    order = "b[concrete]-a[plain]",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    stack_size = 100,
    weight = 10 * kg,
    place_as_tile =
    {
      result = "concrete",
      condition_size = 1,
      condition = {layers={water_tile=true}}
    },
    random_tint_color = item_tints.bluish_concrete
  },
  {
    type = "item",
    name = "refined-concrete",
    icon = "__base__/graphics/icons/refined-concrete.png",
    subgroup = "terrain",
    order = "b[concrete]-c[refined]",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    stack_size = 100,
    weight = 10*kg,
    place_as_tile =
    {
      result = "refined-concrete",
      condition_size = 1,
      condition = {layers={water_tile=true}}
    },
    random_tint_color = item_tints.bluish_concrete
  },
  {
    type = "item",
    name = "hazard-concrete",
    icon = "__base__/graphics/icons/hazard-concrete.png",
    subgroup = "terrain",
    order = "b[concrete]-b[hazard]",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    stack_size = 100,
    weight = 10*kg,
    place_as_tile =
    {
      result = "hazard-concrete-left",
      condition_size = 1,
      condition = {layers={water_tile=true}}
    },
    random_tint_color = item_tints.bluish_concrete
  },
  {
    type = "item",
    name = "refined-hazard-concrete",
    icon = "__base__/graphics/icons/refined-hazard-concrete.png",
    subgroup = "terrain",
    order = "b[concrete]-d[refined-hazard]",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    stack_size = 100,
    weight = 10*kg,
    place_as_tile =
    {
      result = "refined-hazard-concrete-left",
      condition_size = 1,
      condition = {layers={water_tile=true}}
    },
    random_tint_color = item_tints.bluish_concrete
  },
  {
    type = "item",
    name = "landfill",
    icon = "__base__/graphics/icons/landfill.png",
    subgroup = "terrain",
    order = "c[landfill]-a[dirt]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    place_as_tile =
    {
      result = "landfill",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud"}
    },
    random_tint_color = item_tints.organic_green
  },
  {
    type = "item",
    name = "accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    subgroup = "energy",
    order = "e[accumulator]-a[accumulator]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "accumulator",
    stack_size = 50
  },

  {
    type = "item",
    name = "uranium-ore",
    icon = "__base__/graphics/icons/uranium-ore.png",
    pictures =
    {
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore.png",
            size = 64,
            scale = 0.5,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = {0.3, 0.3, 0.3, 0.3},
            size = 64,
            scale = 0.5
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore-1.png",
            size = 64,
            scale = 0.5,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore-1.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = {0.3, 0.3, 0.3, 0.3},
            size = 64,
            scale = 0.5
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore-2.png",
            size = 64,
            scale = 0.5,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore-2.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = {0.3, 0.3, 0.3, 0.3},
            size = 64,
            scale = 0.5
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__base__/graphics/icons/uranium-ore-3.png",
            size = 64,
            scale = 0.5,
            mipmap_count = 4
          },
          {
            filename = "__base__/graphics/icons/uranium-ore-3.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = {0.3, 0.3, 0.3, 0.3},
            size = 64,
            scale = 0.5
          },
        }
      }
    },
    subgroup = "raw-resource",
    order = "g[uranium-ore]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    stack_size = 50,
    weight = 5*kg
  },

  {
    type = "capsule",
    name = "defender-capsule",
    icon = "__base__/graphics/icons/defender-capsule.png",
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
    order = "d[defender]-b[capsule]",
    inventory_move_sound = item_sounds.robotic_inventory_move,
    pick_sound = item_sounds.robotic_inventory_pickup,
    drop_sound = item_sounds.robotic_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "item",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "a[transport-belt]-a[transport-belt]",
    inventory_move_sound = item_sounds.transport_belt_inventory_move,
    pick_sound = item_sounds.transport_belt_inventory_pickup,
    drop_sound = item_sounds.transport_belt_inventory_move,
    place_result = "transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    subgroup = "belt",
    color_hint = { text = "2" },
    order = "a[transport-belt]-b[fast-transport-belt]",
    inventory_move_sound = item_sounds.transport_belt_inventory_move,
    pick_sound = item_sounds.transport_belt_inventory_pickup,
    drop_sound = item_sounds.transport_belt_inventory_move,
    place_result = "fast-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    subgroup = "belt",
    color_hint = { text = "3" },
    order = "a[transport-belt]-c[express-transport-belt]",
    inventory_move_sound = item_sounds.transport_belt_inventory_move,
    pick_sound = item_sounds.transport_belt_inventory_pickup,
    drop_sound = item_sounds.transport_belt_inventory_move,
    place_result = "express-transport-belt",
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "item",
    name = "bulk-inserter",
    icon = "__base__/graphics/icons/bulk-inserter.png",
    subgroup = "inserter",
    color_hint = { text = "B" },
    order = "f[bulk-inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "bulk-inserter",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    subgroup = "production-machine",
    order = "c[assembling-machine-3]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "assembling-machine-3",
    stack_size = 50,
    weight = 40*kg,
  },
  {
    type = "item-with-entity-data",
    name = "fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-c[fluid-wagon]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "fluid-wagon",
    stack_size = 5,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item-with-entity-data",
    name = "artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    subgroup = "train-transport",
    order = "c[rolling-stock]-d[artillery-wagon]",
    inventory_move_sound = item_sounds.artillery_large_inventory_move,
    pick_sound = item_sounds.artillery_large_inventory_pickup,
    drop_sound = item_sounds.artillery_large_inventory_move,
    place_result = "artillery-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "tank",
    icon = "__base__/graphics/icons/tank.png",
    subgroup = "transport",
    order = "b[personal-transport]-b[tank]",
    inventory_move_sound = item_sounds.vehicle_inventory_move,
    pick_sound = item_sounds.vehicle_inventory_pickup,
    drop_sound = item_sounds.vehicle_inventory_move,
    place_result = "tank",
    stack_size = 1
  },
  {
    type = "tool",
    name = "chemical-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/chemical-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "C" },
    order = "d[chemical-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "military-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/military-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "M" },
    order = "c[military-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "production-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/production-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "P" },
    order = "e[production-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "utility-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/utility-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "U" },
    order = "f[utility-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "tool",
    name = "space-science-pack",
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "S" },
    order = "g[space-science-pack]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 2000,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "item",
    name = "underground-belt",
    icon = "__base__/graphics/icons/underground-belt.png",
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "b[underground-belt]-a[underground-belt]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-underground-belt",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    subgroup = "belt",
    color_hint = { text = "2" },
    order = "b[underground-belt]-b[fast-underground-belt]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "fast-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-underground-belt",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    subgroup = "belt",
    color_hint = { text = "3" },
    order = "b[underground-belt]-c[express-underground-belt]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "express-underground-belt",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "splitter",
    icon = "__base__/graphics/icons/splitter.png",
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "c[splitter]-a[splitter]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "splitter",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "lane-splitter",
    icons =
    {
      {
        icon = "__base__/graphics/icons/splitter.png"
      },
      {
        icon = "__base__/graphics/icons/signal/signal_1.png",
        scale = 0.25,
        shift = {8, -8}
      },
    },
    hidden = true,
    subgroup = "other",
    order = "b[items]-b[lane-splitter]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "lane-splitter",
    stack_size = 50,
    weight = 10*kg
  },
  {
    type = "item",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    subgroup = "belt",
    color_hint = { text = "2" },
    order = "c[splitter]-b[fast-splitter]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "fast-splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    subgroup = "belt",
    color_hint = { text = "3" },
    order = "c[splitter]-c[express-splitter]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "express-splitter",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    hidden = true,
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "d[loader]-a[basic-loader]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-loader",
    icon = "__base__/graphics/icons/fast-loader.png",
    hidden = true,
    subgroup = "belt",
    color_hint = { text = "2" },
    order = "d[loader]-b[fast-loader]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "fast-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-loader",
    icon = "__base__/graphics/icons/express-loader.png",
    hidden = true,
    subgroup = "belt",
    color_hint = { text = "3" },
    order = "d[loader]-c[express-loader]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "express-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "advanced-circuit",
    icon = "__base__/graphics/icons/advanced-circuit.png",
    subgroup = "intermediate-product",
    color_hint = { text = "2" },
    order = "b[circuits]-b[advanced-circuit]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 200,
    ingredient_to_weight_coefficient = 0.28,
  },
  {
    type = "item",
    name = "processing-unit",
    icon = "__base__/graphics/icons/processing-unit.png",
    subgroup = "intermediate-product",
    color_hint = { text = "3" },
    order = "b[circuits]-c[processing-unit]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 100,
    ingredient_to_weight_coefficient = 0.25
  },
  {
    type = "item",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    subgroup = "logistic-network",
    order = "a[robot]-a[logistic-robot]",
    inventory_move_sound = item_sounds.robotic_inventory_move,
    pick_sound = item_sounds.robotic_inventory_pickup,
    drop_sound = item_sounds.robotic_inventory_move,
    place_result = "logistic-robot",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    subgroup = "logistic-network",
    order = "a[robot]-b[construction-robot]",
    inventory_move_sound = item_sounds.robotic_inventory_move,
    pick_sound = item_sounds.robotic_inventory_pickup,
    drop_sound = item_sounds.robotic_inventory_move,
    place_result = "construction-robot",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "passive-provider-chest",
    icon = "__base__/graphics/icons/passive-provider-chest.png",
    subgroup = "logistic-network",
    color_hint = { text = "P" },
    order = "b[storage]-c[passive-provider-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "passive-provider-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "active-provider-chest",
    icon = "__base__/graphics/icons/active-provider-chest.png",
    subgroup = "logistic-network",
    color_hint = { text = "A" },
    order = "b[storage]-c[active-provider-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "active-provider-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "storage-chest",
    icon = "__base__/graphics/icons/storage-chest.png",
    subgroup = "logistic-network",
    color_hint = { text = "S" },
    order = "b[storage]-c[storage-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "storage-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "buffer-chest",
    icon = "__base__/graphics/icons/buffer-chest.png",
    subgroup = "logistic-network",
    color_hint = { text = "B" },
    order = "b[storage]-d[buffer-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "buffer-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "requester-chest",
    icon = "__base__/graphics/icons/requester-chest.png",
    subgroup = "logistic-network",
    color_hint = { text = "R" },
    order = "b[storage]-e[requester-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "requester-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    subgroup = "space-related",
    order = "a[rocket-silo]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "rocket-silo",
    weight = 10 * tons,
    stack_size = 1
  },
  {
    type = "item",
    name = "cargo-landing-pad",
    icon = "__base__/graphics/icons/cargo-landing-pad.png",
    subgroup = "space-related",
    order = "c[cargo-landing-pad]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "cargo-landing-pad",
    stack_size = 1,
    weight = 1 * tons
  },
  {
    type = "item",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    subgroup = "logistic-network",
    order = "c[signal]-a[roboport]",
    inventory_move_sound = item_sounds.roboport_inventory_move,
    pick_sound = item_sounds.roboport_inventory_pickup,
    drop_sound = item_sounds.roboport_inventory_move,
    place_result = "roboport",
    stack_size = 10,
    weight = 100*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "coin",
    icon = "__base__/graphics/icons/coin.png",
    hidden = true,
    subgroup = "science-pack",
    order = "y",
    inventory_move_sound = item_sounds.coin_inventory_move,
    pick_sound = item_sounds.coin_inventory_pickup,
    drop_sound = item_sounds.coin_inventory_move,
    stack_size = 100000
  },
  {
    type = "item",
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[substation]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "substation",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
    subgroup = "module",
    order = "a[beacon]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "beacon",
    stack_size = 20,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    subgroup = "storage",
    order = "b[fluid]-a[storage-tank]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "storage-tank",
    stack_size = 50
  },
  {
    type = "item",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-c[pump]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "pump",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "upgrade-item",
    name = "upgrade-planner",
    icon = "__base__/graphics/icons/upgrade-planner.png",
    flags = {"spawnable"},
    subgroup = "tool",
    order = "c[automated-construction]-c[upgrade-planner]",
    inventory_move_sound = item_sounds.planner_inventory_move,
    pick_sound = item_sounds.planner_inventory_pickup,
    drop_sound = item_sounds.planner_inventory_move,
    stack_size = 1,
    select =
    {
      border_color = {71, 255, 73},
      mode = {"upgrade"},
      cursor_box_type = "not-allowed",
      started_sound = { filename = "__core__/sound/upgrade-select-start.ogg" },
      ended_sound = { filename = "__core__/sound/upgrade-select-end.ogg" }
    },
    alt_select =
    {
      border_color = {239, 153, 34},
      mode = {"cancel-upgrade"},
      cursor_box_type = "not-allowed",
      started_sound = { filename = "__core__/sound/upgrade-cancel-start.ogg" },
      ended_sound = { filename = "__core__/sound/upgrade-cancel-end.ogg" }
    },
    reverse_select =
    {
      border_color = {246, 255, 0},
      mode = {"downgrade"},
      cursor_box_type = "not-allowed",
      started_sound = { filename = "__core__/sound/upgrade-select-start.ogg" },
      ended_sound = { filename = "__core__/sound/upgrade-select-end.ogg" }
    },
    open_sound = "__base__/sound/item-open.ogg",
    close_sound = "__base__/sound/item-close.ogg",
    skip_fog_of_war = true
  },
  {
    type = "deconstruction-item",
    name = "deconstruction-planner",
    icon = "__base__/graphics/icons/deconstruction-planner.png",
    flags = {"spawnable"},
    subgroup = "tool",
    order = "c[automated-construction]-b[deconstruction-planner]",
    inventory_move_sound = item_sounds.planner_inventory_move,
    pick_sound = item_sounds.planner_inventory_pickup,
    drop_sound = item_sounds.planner_inventory_move,
    stack_size = 1,
    entity_filter_count = 30,
    tile_filter_count = 30,
    select =
    {
      border_color = {255, 24, 24},
      count_button_color = {195, 52, 52},
      mode = {"deconstruct"},
      cursor_box_type = "not-allowed",
      started_sound = { filename = "__core__/sound/deconstruct-select-start.ogg" },
      ended_sound = { filename = "__core__/sound/deconstruct-select-end.ogg" }
    },
    super_forced_select =
    {
      border_color = {255, 24, 24},
      count_button_color = {195, 52, 52},
      mode = {"deconstruct"},
      cursor_box_type = "not-allowed",
      started_sound = { filename = "__core__/sound/deconstruct-select-start.ogg" },
      ended_sound = { filename = "__core__/sound/deconstruct-select-end.ogg" }
    },
    alt_select =
    {
      border_color = {239, 153, 34},
      count_button_color = {255, 176, 66},
      mode = {"cancel-deconstruct"},
      cursor_box_type = "not-allowed",
      started_sound = { filename = "__core__/sound/deconstruct-cancel-start.ogg" },
      ended_sound = { filename = "__core__/sound/deconstruct-cancel-end.ogg" },
    },
    open_sound = "__base__/sound/item-open.ogg",
    close_sound = "__base__/sound/item-close.ogg",
    skip_fog_of_war = true
  },
  {
    type = "blueprint-book",
    name = "blueprint-book",
    icon = "__base__/graphics/icons/blueprint-book.png",
    flags = {"spawnable"},
    subgroup = "tool",
    order = "c[automated-construction]-d[blueprint-book]",
    inventory_move_sound = item_sounds.blueprint_inventory_move,
    pick_sound = item_sounds.blueprint_inventory_pickup,
    drop_sound = item_sounds.blueprint_inventory_move,
    stack_size = 1,
    inventory_size = "dynamic",
    open_sound = "__base__/sound/item-open.ogg",
    close_sound = "__base__/sound/item-close.ogg"
  },
  {
    type = "item",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    subgroup = "extraction-machine",
    order = "b[fluids]-b[pumpjack]",
    inventory_move_sound = item_sounds.pumpjack_inventory_move,
    pick_sound = item_sounds.pumpjack_inventory_pickup,
    drop_sound = item_sounds.pumpjack_inventory_move,
    place_result = "pumpjack",
    stack_size = 20
  },
  {
    type = "item",
    name = "oil-refinery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    subgroup = "production-machine",
    order = "d[refinery]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "oil-refinery",
    stack_size = 10
  },
  {
    type = "item",
    name = "chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    subgroup = "production-machine",
    order = "e[chemical-plant]",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "chemical-plant",
    stack_size = 10
  },
  {
    type = "item",
    name = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    subgroup = "raw-material",
    order = "b[chemistry]-c[sulfur]",
    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
    stack_size = 50,
    weight = 1*kg
  },
  {
    type = "item",
    name = "barrel",
    icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png",
    subgroup = "intermediate-product",
    order = "a[basic-intermediates]-d[empty-barrel]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    stack_size = 10,
    weight = 1 / 200 * tons,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "plastic-bar",
    icon = "__base__/graphics/icons/plastic-bar.png",
    subgroup = "raw-material",
    order = "b[chemistry]-b[plastic-bar]",
    inventory_move_sound = item_sounds.plastic_inventory_move,
    pick_sound = item_sounds.plastic_inventory_pickup,
    drop_sound = item_sounds.plastic_inventory_move,
    stack_size = 100,
    weight = 500 * grams,
    random_tint_color = item_tints.plastic
  },
  {
    type = "item",
    name = "electric-engine-unit",
    icon = "__base__/graphics/icons/electric-engine-unit.png",
    subgroup = "intermediate-product",
    order = "c[advanced-intermediates]-b[electric-engine-unit]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 50
  },
  {
    type = "item",
    name = "explosives",
    icon = "__base__/graphics/icons/explosives.png",
    subgroup = "raw-material",
    order = "b[chemistry]-e[explosives]",
    inventory_move_sound = item_sounds.explosive_inventory_move,
    pick_sound = item_sounds.explosive_inventory_pickup,
    drop_sound = item_sounds.explosive_inventory_move,
    stack_size = 50,
    weight = 2*kg
  },
  {
    type = "item",
    name = "battery",
    icon = "__base__/graphics/icons/battery.png",
    subgroup = "raw-material",
    order = "b[chemistry]-d[battery]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 200
  },
  {
    type = "item",
    name = "flying-robot-frame",
    icon = "__base__/graphics/icons/flying-robot-frame.png",
    subgroup = "intermediate-product",
    order = "c[advanced-intermediates]-c[flying-robot-frame]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "low-density-structure",
    icon = "__base__/graphics/icons/low-density-structure.png",
    subgroup = "intermediate-product",
    order = "d[rocket-parts]-a[low-density-structure]",
    inventory_move_sound = item_sounds.low_density_inventory_move,
    pick_sound = item_sounds.low_density_inventory_pickup,
    drop_sound = item_sounds.low_density_inventory_move,
    stack_size = 50,
    weight = 5*kg
  },
  {
    type = "item",
    name = "nuclear-fuel",
    icon = "__base__/graphics/icons/nuclear-fuel.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel-light.png",
          scale = 0.5
        }
      }
    },
    fuel_category = "chemical",
    fuel_value = "1.21GJ",
    fuel_acceleration_multiplier = 2.5,
    fuel_top_speed_multiplier = 1.15,
    -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
    subgroup = "uranium-processing",
    order = "r[uranium-processing]-e[nuclear-fuel]",
    inventory_move_sound = item_sounds.fuel_cell_inventory_move,
    pick_sound = item_sounds.fuel_cell_inventory_pickup,
    drop_sound = item_sounds.fuel_cell_inventory_move,
    stack_size = 1,
    weight = 100*kg
  },
  {
    type = "item",
    name = "rocket-part",
    icon = "__base__/graphics/icons/rocket-part.png",
    hidden = true,
    auto_recycle = false,
    subgroup = "intermediate-product",
    order = "d[rocket-parts]-d[rocket-part]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 5,
    weight = (1000/50)*kg
  },
  {
    type = "item",
    name = "satellite",
    icon = "__base__/graphics/icons/satellite.png",
    subgroup = "space-related",
    order = "d[rocket-parts]-e[satellite]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 1,
    weight = 1 * tons,
    rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 1000}},
    send_to_orbit_mode = "automated"
  },
  {
    type = "item-with-entity-data",
    name = "spidertron",
    icon = "__base__/graphics/icons/spidertron.png",
    icon_tintable = "__base__/graphics/icons/spidertron-tintable.png",
    icon_tintable_mask = "__base__/graphics/icons/spidertron-tintable-mask.png",
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-a[spider]",
    inventory_move_sound = item_sounds.spidertron_inventory_move,
    pick_sound = item_sounds.spidertron_inventory_pickup,
    drop_sound = item_sounds.spidertron_inventory_move,
    place_result = "spidertron",
    weight = 1 * tons,
    stack_size = 1
  },
  {
    type = "spidertron-remote",
    name = "spidertron-remote",
    icon = "__base__/graphics/icons/spidertron-remote.png",
    icon_color_indicator_mask = "__base__/graphics/icons/spidertron-remote-mask.png",
    flags = {"not-stackable", "only-in-cursor", "spawnable"},
    auto_recycle = false,
    subgroup = "spawnables",
    inventory_move_sound = item_sounds.spidertron_inventory_move,
    pick_sound = item_sounds.spidertron_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 1,
    select =
    {
      border_color = {71, 255, 73},
      mode = {"controllable"},
      cursor_box_type = "spidertron-remote-to-be-selected",
    },
    alt_select =
    {
      border_color = {239, 153, 34},
      mode = {"controllable-add"},
      cursor_box_type = "spidertron-remote-to-be-selected",
    },
    reverse_select =
    {
      border_color = {246, 255, 0},
      mode = {"controllable-remove"},
      cursor_box_type = "not-allowed"
    }
  },
  {
    -- This allows loading the selection-tool type item when mods are removed
    type = "selection-tool",
    name = "selection-tool",
    icon = "__base__/graphics/icons/blueprint.png",
    flags = {"not-stackable", "spawnable"},
    hidden = true,
    subgroup = "other",
    order = "e[automated-construction]-a[blueprint]",
    inventory_move_sound = item_sounds.planner_inventory_move,
    pick_sound = item_sounds.planner_inventory_pickup,
    drop_sound = item_sounds.planner_inventory_move,
    stack_size = 1,
    select =
    {
      border_color = {1, 1, 1},
      mode = {"blueprint"},
      cursor_box_type = "copy",
    },
    alt_select =
    {
      border_color = {0, 1, 0},
      mode = {"blueprint"},
      cursor_box_type = "copy",
    }
  },
  {
    type = "item",
    name = "electric-energy-interface",
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = {1, 0.8, 1, 1}}},
    hidden = true,
    subgroup = "other",
    order = "a[electric-energy-interface]-b[electric-energy-interface]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "electric-energy-interface",
    stack_size = 50
  },
  {
    type = "item",
    name = "heat-interface",
    icon = "__base__/graphics/icons/heat-interface.png",
    hidden = true,
    subgroup = "other",
    order = "b[heat-interface]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "heat-interface",
    stack_size = 20
  },
  {
    type = "item",
    name = "nuclear-reactor",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    subgroup = "energy",
    order = "f[nuclear-energy]-a[reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    place_result = "nuclear-reactor",
    weight = 1 * tons,
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
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          blend_mode = "additive",
          size = 64,
          filename = "__base__/graphics/icons/uranium-235.png",
          scale = 0.5,
          tint = {0.3, 0.3, 0.3, 0.3}
        }
      }
    },
    subgroup = "uranium-processing",
    color_hint = { text = "+" },
    order = "a[uranium-processing]-b[uranium-235]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    stack_size = 100,
    weight = 50*kg
  },
  {
    type = "item",
    name = "uranium-238",
    icon = "__base__/graphics/icons/uranium-238.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-c[uranium-238]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    stack_size = 100,
    weight = 50*kg
  },
  {
    type = "item",
    name = "centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
    subgroup = "production-machine",
    order = "f[centrifuge]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "centrifuge",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "uranium-fuel-cell",
    icon = "__base__/graphics/icons/uranium-fuel-cell.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/uranium-fuel-cell.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
          scale = 0.5
        }
      }
    },
    subgroup = "uranium-processing",
    order = "b[uranium-products]-a[uranium-fuel-cell]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    fuel_category = "nuclear",
    burnt_result = "depleted-uranium-fuel-cell",
    fuel_value = "8GJ",
    stack_size = 50,
    weight = 100*kg
  },
  {
    type = "item",
    name = "depleted-uranium-fuel-cell",
    icon = "__base__/graphics/icons/depleted-uranium-fuel-cell.png",
    subgroup = "uranium-processing",
    order = "b[uranium-products]-b[depleted-uranium-fuel-cell]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    stack_size = 50,
    weight = 100*kg
  },
  {
    type = "item",
    name = "heat-exchanger",
    icon = "__base__/graphics/icons/heat-boiler.png",
    subgroup = "energy",
    order = "f[nuclear-energy]-c[heat-exchanger]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "heat-exchanger",
    stack_size = 50,
    weight = 40*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "steam-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    subgroup = "energy",
    order = "f[nuclear-energy]-d[steam-turbine]",
    inventory_move_sound = item_sounds.steam_inventory_move,
    pick_sound = item_sounds.steam_inventory_pickup,
    drop_sound = item_sounds.steam_inventory_move,
    place_result = "steam-turbine",
    stack_size = 10,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "heat-pipe",
    icon = "__base__/graphics/icons/heat-pipe.png",
    subgroup = "energy",
    order = "f[nuclear-energy]-b[heat-pipe]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "heat-pipe",
    stack_size = 50,
    weight = 20*kg,
  },
  {
    type = "item",
    name = "simple-entity-with-force",
    icon = "__base__/graphics/icons/steel-chest.png",
    hidden = true,
    subgroup = "other",
    order = "s[simple-entity-with-force]-f[simple-entity-with-force]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "simple-entity-with-force",
    stack_size = 50
  },
  {
    type = "item",
    name = "simple-entity-with-owner",
    icon = "__base__/graphics/icons/wooden-chest.png",
    hidden = true,
    subgroup = "other",
    order = "s[simple-entity-with-owner]-o[simple-entity-with-owner]",
    inventory_move_sound = item_sounds.wood_inventory_move,
    pick_sound = item_sounds.wood_inventory_pickup,
    drop_sound = item_sounds.wood_inventory_move,
    place_result = "simple-entity-with-owner",
    stack_size = 50
  },
  {
    type = "item",
    name = "infinity-chest",
    icon = "__base__/graphics/icons/infinity-chest.png",
    hidden = true,
    subgroup = "other",
    order = "c[item]-o[infinity-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    stack_size = 10,
    place_result = "infinity-chest"
  },
  {
    type = "item",
    name = "infinity-cargo-wagon",
    icons = {{icon = "__base__/graphics/icons/cargo-wagon.png", tint = {r = 0.5, g = 0.5, b = 1}}},
    hidden = true,
    subgroup = "other",
    order = "c[item]-o[infinity-cargo-wagon]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.locomotive_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 5,
    place_result = "infinity-cargo-wagon"
  },
  {
    type = "item",
    name = "infinity-pipe",
    icons =
    {{
      icon = "__base__/graphics/icons/pipe.png",
      tint = {r = 0.5, g = 0.5, b = 1}
    }},
    hidden = true,
    subgroup = "other",
    order = "d[item]-o[infinity-pipe]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 10,
    place_result = "infinity-pipe"
  },
  {
    type = "item",
    name = "burner-generator",
    icon = "__base__/graphics/icons/steam-engine.png",
    hidden = true,
    subgroup = "other",
    order = "t[item]-o[burner-generator]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 10,
    place_result = "burner-generator",
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "linked-chest",
    icon = "__base__/graphics/icons/linked-chest-icon.png",
    hidden = true,
    subgroup = "other",
    order = "a[items]-a[linked-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "linked-chest",
    stack_size = 10
  },
  {
    type = "item",
    name = "proxy-container",
    icons = {{icon = "__base__/graphics/icons/linked-chest-icon.png", tint = {0.8, 0.1, 0.3}}},
    hidden = true,
    subgroup = "other",
    order = "a[items]-a[proxy-container]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "proxy-container",
    stack_size = 10
  },
  {
    type = "item",
    name = "bottomless-chest",
    icons = {{icon = "__base__/graphics/icons/steel-chest.png", tint = {0.4, 0.4, 0.4}}},
    hidden = true,
    subgroup = "other",
    order = "a[items]-c[bottomless-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "bottomless-chest",
    stack_size = 10
  },
  {
    type = "item",
    name = "linked-belt",
    icon = "__base__/graphics/icons/linked-belt.png",
    hidden = true,
    subgroup = "other",
    order = "b[items]-b[linked-belt]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "linked-belt",
    stack_size = 10
  },
  {
    type = "item",
    name = "one-way-valve",
    icon = "__base__/graphics/entity/one-way-valve/one-way-valve-east.png",
    hidden = true,
    subgroup = "other",
    order = "b[items]-o[one-way-valve]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "one-way-valve",
    stack_size = 10
  },
  {
    type = "item",
    name = "overflow-valve",
    icon = "__base__/graphics/entity/overflow-valve/overflow-valve-east.png",
    hidden = true,
    subgroup = "other",
    order = "b[items]-o[overflow-valve]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "overflow-valve",
    stack_size = 10
  },
  {
    type = "item",
    name = "top-up-valve",
    icon = "__base__/graphics/entity/top-up-valve/top-up-valve-east.png",
    hidden = true,
    subgroup = "other",
    order = "b[items]-o[top-up-valve]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "top-up-valve",
    stack_size = 10
  },
  {
    type = "module",
    name = "speed-module",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module.png",
    subgroup = "module",
    color_hint = { text = "S" },
    category = "speed",
    tier = 1,
    order = "a[speed]-a[speed-module-1]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = {speed = 0.2, consumption = 0.5, quality = -0.1},
    beacon_tint =
    {
      primary = {0.441, 0.714, 1.000, 1.000}, -- #70b6ffff
      secondary = {0.388, 0.976, 1.000, 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "speed-module-2",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module-2.png",
    subgroup = "module",
    category = "speed",
    color_hint = { text = "S" },
    tier = 2,
    order = "a[speed]-b[speed-module-2]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = {speed = 0.3, consumption = 0.6, quality = -0.15},
    beacon_tint =
    {
      primary = {0.441, 0.714, 1.000, 1.000}, -- #70b6ffff
      secondary = {0.388, 0.976, 1.000, 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "speed-module-3",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module-3.png",
    subgroup = "module",
    color_hint = { text = "S" },
    category = "speed",
    tier = 3,
    order = "a[speed]-c[speed-module-3]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = {speed = 0.5, consumption = 0.7, quality = -0.25},
    beacon_tint =
    {
      primary = {0.441, 0.714, 1.000, 1.000}, -- #70b6ffff
      secondary = {0.388, 0.976, 1.000, 1.000}, -- #63f8ffff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "efficiency-module",
    localised_description = {"item-description.efficiency-module"},
    icon = "__base__/graphics/icons/efficiency-module.png",
    subgroup = "module",
    color_hint = { text = "E" },
    category = "efficiency",
    tier = 1,
    order = "c[efficiency]-a[efficiency-module-1]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = {consumption = -0.3},
    beacon_tint =
    {
      primary = {0, 1, 0},
      secondary = {0.370, 1.000, 0.370, 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "efficiency-module-2",
    localised_description = {"item-description.efficiency-module"},
    icon = "__base__/graphics/icons/efficiency-module-2.png",
    subgroup = "module",
    color_hint = { text = "E" },
    category = "efficiency",
    tier = 2,
    order = "c[efficiency]-b[efficiency-module-2]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = {consumption = -0.4},
    beacon_tint =
    {
      primary = {0, 1, 0},
      secondary = {0.370, 1.000, 0.370, 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "efficiency-module-3",
    localised_description = {"item-description.efficiency-module"},
    icon = "__base__/graphics/icons/efficiency-module-3.png",
    subgroup = "module",
    color_hint = { text = "E" },
    category = "efficiency",
    tier = 3,
    order = "c[efficiency]-c[efficiency-module-3]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect = {consumption = -0.5},
    beacon_tint =
    {
      primary = {0, 1, 0},
      secondary = {0.370, 1.000, 0.370, 1.000}, -- #5eff5eff
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "module",
    name = "productivity-module",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module.png",
    subgroup = "module",
    color_hint = { text = "P" },
    category = "productivity",
    tier = 1,
    order = "c[productivity]-a[productivity-module-1]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect =
    {
      productivity = 0.04,
      consumption = 0.4,
      pollution = 0.05,
      speed = -0.05
    }
  },
  {
    type = "module",
    name = "productivity-module-2",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-2.png",
    subgroup = "module",
    color_hint = { text = "P" },
    category = "productivity",
    tier = 2,
    order = "c[productivity]-b[productivity-module-2]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect =
    {
      productivity = 0.06,
      consumption = 0.6,
      pollution = 0.07,
      speed = -0.1
    }
  },
  {
    type = "module",
    name = "productivity-module-3",
    localised_description = {"item-description.productivity-module"},
    icon = "__base__/graphics/icons/productivity-module-3.png",
    subgroup = "module",
    color_hint = { text = "P" },
    category = "productivity",
    tier = 3,
    order = "c[productivity]-c[productivity-module-3]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 50,
    weight = 20 * kg,
    effect =
    {
      productivity = 0.1,
      consumption = 0.8,
      pollution = 0.1,
      speed = -0.15
    }
  },
  {
    type = "item",
    name = "empty-module-slot",
    localised_description = {"item-description.empty-module-slot"},
    icon = "__core__/graphics/icons/mip/empty-module-slot.png",
    flags = {"not-stackable"},
    hidden = true,
    subgroup = "module",
    order = "z[meta]-a[empty-module-slot]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 1,
  },

  {
    type = "ammo",
    name = "uranium-rounds-magazine",
    icon = "__base__/graphics/icons/uranium-rounds-magazine.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/uranium-rounds-magazine.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/uranium-rounds-magazine-light.png",
          scale = 0.5
        }
      }
    },
    ammo_category = "bullet",
    ammo_type =
    {
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
              damage = {amount = 24, type = "physical"}
            },
            {
              type = "activate-impact",
              deliver_category = "bullet"
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-c[uranium-rounds-magazine]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  {
    type = "ammo",
    name = "flamethrower-ammo",
    icon = "__base__/graphics/icons/flamethrower-ammo.png",
    ammo_category = "flamethrower",
    ammo_type =
    {
      {
        source_type = "default",
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
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "ammo",
    name = "rocket",
    icon = "__base__/graphics/icons/rocket.png",
    ammo_category = "rocket",
    ammo_type =
    {
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
            entity_name = "explosion-hit",
            only_when_visible = true
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-a[basic]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  {
    type = "ammo",
    name = "explosive-rocket",
    icon = "__base__/graphics/icons/explosive-rocket.png",
    ammo_category = "rocket",
    ammo_type =
    {
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
            entity_name = "explosion-hit",
            only_when_visible = true
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-b[explosive]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  {
    type = "ammo",
    name = "atomic-bomb",
    icon = "__base__/graphics/icons/atomic-bomb.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/atomic-bomb.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/atomic-bomb-light.png",
          scale = 0.5
        }
      }
    },
    ammo_category = "rocket",
    ammo_type =
    {
      range_modifier = 1.5,
      cooldown_modifier = 10,
      target_type = "position",
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
    order = "d[rocket-launcher]-d[atomic-bomb]",
    inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
    pick_sound = item_sounds.atomic_bomb_inventory_pickup,
    drop_sound = item_sounds.atomic_bomb_inventory_move,
    stack_size = 10,
    weight = 1.5 * tons
  },
  {
    type = "ammo",
    name = "piercing-shotgun-shell",
    icon = "__base__/graphics/icons/piercing-shotgun-shell.png",
    ammo_category = "shotgun-shell",
    ammo_type =
    {
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
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
  {
    type = "ammo",
    name = "cannon-shell",
    icon = "__base__/graphics/icons/cannon-shell.png",
    ammo_category = "cannon-shell",
    ammo_type =
    {
      range_modifier = 1.25,
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
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
  {
    type = "ammo",
    name = "explosive-cannon-shell",
    icon = "__base__/graphics/icons/explosive-cannon-shell.png",
    ammo_category = "cannon-shell",
    ammo_type =
    {
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
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
  {
    type = "ammo",
    name = "uranium-cannon-shell",
    icon = "__base__/graphics/icons/uranium-cannon-shell.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/uranium-cannon-shell.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/uranium-cannon-shell-light.png",
          scale = 0.5
        }
      }
    },
    ammo_category = "cannon-shell",
    ammo_type =
    {
      range_modifier = 1.25,
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
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  {
    type = "ammo",
    name = "explosive-uranium-cannon-shell",
    icon = "__base__/graphics/icons/explosive-uranium-cannon-shell.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/explosive-uranium-cannon-shell.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/uranium-cannon-shell-light.png",
          scale = 0.5
        }
      }
    },
    ammo_category = "cannon-shell",
    ammo_type =
    {
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
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  {
    type = "ammo",
    name = "artillery-shell",
    icon = "__base__/graphics/icons/artillery-shell.png",
    ammo_category = "artillery-shell",
    ammo_type =
    {
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
    inventory_move_sound = item_sounds.artillery_large_inventory_move,
    pick_sound = item_sounds.artillery_large_inventory_pickup,
    drop_sound = item_sounds.artillery_large_inventory_move,
    stack_size = 1,
    weight = 100*kg
  },
  {
    type = "gun",
    name = "flamethrower",
    icon = "__base__/graphics/icons/flamethrower.png",
    subgroup = "gun",
    order = "e[flamethrower]",
    inventory_move_sound = item_sounds.flamethrower_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.flamethrower_inventory_move,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      movement_slow_down_factor = 0.4,
      gun_barrel_length = 0.8,
      gun_center_shift = {0, -1},
      range = 15,
      min_range = 3,
      cyclic_sound =
      {
        begin_sound = {filename = "__base__/sound/fight/flamethrower-start.ogg", volume = 0.7, priority = 64},
        middle_sound = {filename = "__base__/sound/fight/flamethrower-mid.ogg", volume = 0.7, priority = 64},
        end_sound = {filename = "__base__/sound/fight/flamethrower-end.ogg", volume = 0.7, priority = 64}
      }
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "tank-machine-gun",
    icon = "__base__/graphics/icons/submachine-gun.png",
    hidden = true,
    auto_recycle = false,
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
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "b[flamethrower]-b[tank-flamethrower]",
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      gun_barrel_length = 1.4,
      gun_center_shift = {-0.17, -1.15},
      range = 9,
      min_range = 3,
      cyclic_sound =
      {
        begin_sound = {filename = "__base__/sound/fight/flamethrower-start.ogg", volume = 1},
        middle_sound = {filename = "__base__/sound/fight/flamethrower-mid.ogg", volume = 1},
        end_sound = {filename = "__base__/sound/fight/flamethrower-end.ogg", volume = 1}
      }
    },
    stack_size = 1
  },
  {
    type = "item",
    name = "land-mine",
    icon = "__base__/graphics/icons/land-mine.png",
    subgroup = "defensive-structure",
    order = "f[land-mine]",
    inventory_move_sound = item_sounds.explosive_inventory_move,
    pick_sound = item_sounds.explosive_inventory_pickup,
    drop_sound = item_sounds.explosive_inventory_move,
    place_result = "land-mine",
    stack_size = 100
  },
  {
    type = "gun",
    name = "rocket-launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    subgroup = "gun",
    order = "d[rocket-launcher]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
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
        filename = "__base__/sound/fight/rocket-launcher.ogg",
        volume = 0.7,
        modifiers = volume_multiplier("main-menu", 0.9)
      },
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "combat-shotgun",
    icon = "__base__/graphics/icons/combat-shotgun.png",
    subgroup = "gun",
    order = "b[shotgun]-a[combat]",
    inventory_move_sound = item_sounds.shotgun_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.shotgun_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = 30,
      movement_slow_down_factor = 0.5,
      damage_modifier = 1.2,
      projectile_creation_distance = 0.125,
      range = 15,
      sound = sounds.shotgun
    },
    stack_size = 5
  },
  {
    type = "gun",
    name = "tank-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
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
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "z[artillery]-a[cannon]",
    inventory_move_sound = item_sounds.artillery_large_inventory_move,
    pick_sound = item_sounds.artillery_large_inventory_pickup,
    drop_sound = item_sounds.artillery_large_inventory_move,
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
        filename = "__base__/sound/fight/artillery-shoots-1.ogg",
        volume = 0.7,
        modifiers = volume_multiplier("main-menu", 0.9)
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
    stack_size = 1,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-1",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    subgroup = "gun",
    hidden = true,
    auto_recycle = false,
    order = "z[spider]-a[rocket-launcher]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = -0.0625,
      sound = sounds.spidertron_rocket_launcher,
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-2",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    subgroup = "gun",
    hidden = true,
    auto_recycle = false,
    order = "z[spider]-a[rocket-launcher]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_orientation_offset = -0.03125,
      projectile_center = {0, 0.3},
      sound = sounds.spidertron_rocket_launcher,
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-3",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    subgroup = "gun",
    hidden = true,
    auto_recycle = false,
    order = "z[spider]-a[rocket-launcher]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = 0.03125,
      sound = sounds.spidertron_rocket_launcher,
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spidertron-rocket-launcher-4",
    localised_name = {"item-name.spidertron-rocket-launcher"},
    icon = "__base__/graphics/icons/rocket-launcher.png",
    subgroup = "gun",
    hidden = true,
    auto_recycle = false,
    order = "z[spider]-a[rocket-launcher]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      range = 36,
      projectile_creation_distance = -0.5,
      projectile_center = {0, 0.3},
      projectile_orientation_offset = 0.0625,
      sound = sounds.spidertron_rocket_launcher,
    },
    stack_size = 1
  },
  {
    type = "armor",
    name = "modular-armor",
    icon = "__base__/graphics/icons/modular-armor.png",
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
    factoriopedia_simulation = simulations.factoriopedia_modular_armor,
    inventory_move_sound = item_sounds.armor_large_inventory_move,
    pick_sound = item_sounds.armor_large_inventory_pickup,
    drop_sound = item_sounds.armor_large_inventory_move,
    stack_size = 1,
    infinite = true,
    equipment_grid = "small-equipment-grid",
    inventory_size_bonus = 10,
    open_sound = sounds.armor_open,
    close_sound = sounds.armor_close
  },
  {
    type = "armor",
    name = "power-armor",
    icon = "__base__/graphics/icons/power-armor.png",
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
    factoriopedia_simulation = simulations.factoriopedia_power_armor,
    inventory_move_sound = item_sounds.armor_large_inventory_move,
    pick_sound = item_sounds.armor_large_inventory_pickup,
    drop_sound = item_sounds.armor_large_inventory_move,
    stack_size = 1,
    infinite = true,
    equipment_grid = "medium-equipment-grid",
    inventory_size_bonus = 20,
    open_sound = sounds.armor_open,
    close_sound = sounds.armor_close
  },
  {
    type = "armor",
    name = "power-armor-mk2",
    icon = "__base__/graphics/icons/power-armor-mk2.png",
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
    factoriopedia_simulation = simulations.factoriopedia_power_armor_mk2,
    inventory_move_sound = item_sounds.armor_large_inventory_move,
    pick_sound = item_sounds.armor_large_inventory_pickup,
    drop_sound = item_sounds.armor_large_inventory_move,
    stack_size = 1,
    infinite = true,
    equipment_grid = "large-equipment-grid",
    inventory_size_bonus = 30,
    open_sound = sounds.armor_open,
    close_sound = sounds.armor_close,
    weight = 1*tons
  },
  {
    type = "capsule",
    name = "cluster-grenade",
    icon = "__base__/graphics/icons/cluster-grenade.png",
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
                  },
                  {
                    type = "play-sound",
                    sound = sounds.throw_grenade
                  },
                }
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "a[grenade]-b[cluster]",
    inventory_move_sound = item_sounds.grenade_inventory_move,
    pick_sound = item_sounds.grenade_inventory_pickup,
    drop_sound = item_sounds.grenade_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  {
    type = "capsule",
    name = "poison-capsule",
    icon = "__base__/graphics/icons/poison-capsule.png",
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
    inventory_move_sound = item_sounds.grenade_inventory_move,
    pick_sound = item_sounds.grenade_inventory_pickup,
    drop_sound = item_sounds.grenade_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "capsule",
    name = "slowdown-capsule",
    icon = "__base__/graphics/icons/slowdown-capsule.png",
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
    inventory_move_sound = item_sounds.grenade_inventory_move,
    pick_sound = item_sounds.grenade_inventory_pickup,
    drop_sound = item_sounds.grenade_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "capsule",
    name = "distractor-capsule",
    icon = "__base__/graphics/icons/distractor-capsule.png",
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
    order = "e[distractor]-b[capsule]",
    inventory_move_sound = item_sounds.robotic_inventory_move,
    pick_sound = item_sounds.robotic_inventory_pickup,
    drop_sound = item_sounds.robotic_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
  {
    type = "capsule",
    name = "destroyer-capsule",
    icon = "__base__/graphics/icons/destroyer-capsule.png",
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
    order = "f[destroyer]-b[capsule]",
    inventory_move_sound = item_sounds.robotic_inventory_move,
    pick_sound = item_sounds.robotic_inventory_pickup,
    drop_sound = item_sounds.robotic_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  {
    type = "capsule",
    name = "cliff-explosives",
    icon = "__base__/graphics/icons/cliff-explosives.png",
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
    inventory_move_sound = item_sounds.explosive_inventory_move,
    pick_sound = item_sounds.explosive_inventory_pickup,
    drop_sound = item_sounds.explosive_inventory_move,
    stack_size = 20
  },
  {
    type = "ammo",
    name = "firearm-magazine",
    icon = "__base__/graphics/icons/firearm-magazine.png",
    ammo_category = "bullet",
    ammo_type =
    {
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
                  entity_name = "explosion-gunshot",
                  only_when_visible = true
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
                  only_when_visible = true
                },
                {
                  type = "damage",
                  damage = {amount = 5, type = "physical"}
                },
                {
                  type = "activate-impact",
                  deliver_category = "bullet"
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
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "ammo",
    name = "piercing-rounds-magazine",
    icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
    ammo_category = "bullet",
    ammo_type =
    {
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
            only_when_visible = true
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
              offsets = {{0, 1}},
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              only_when_visible = true
            },
            {
              type = "damage",
              damage = {amount = 8, type = "physical"}
            },
            {
              type = "activate-impact",
              deliver_category = "bullet"
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-b[piercing-rounds-magazine]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 20*kg
  },
  {
    type = "ammo",
    name = "shotgun-shell",
    icon = "__base__/graphics/icons/shotgun-shell.png",
    ammo_category = "shotgun-shell",
    ammo_type =
    {
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
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "armor",
    name = "light-armor",
    icon = "__base__/graphics/icons/light-armor.png",
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
    factoriopedia_simulation = simulations.factoriopedia_light_armor,
    inventory_move_sound = item_sounds.armor_small_inventory_move,
    pick_sound = item_sounds.armor_small_inventory_pickup,
    drop_sound = item_sounds.armor_small_inventory_move,
    stack_size = 1,
    infinite = true
  },
  {
    type = "armor",
    name = "heavy-armor",
    icon = "__base__/graphics/icons/heavy-armor.png",
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
    factoriopedia_simulation = simulations.factoriopedia_heavy_armor,
    inventory_move_sound = item_sounds.armor_small_inventory_move,
    pick_sound = item_sounds.armor_small_inventory_pickup,
    drop_sound = item_sounds.armor_small_inventory_move,
    stack_size = 1,
    infinite = true
  },
  {
    type = "gun",
    name = "pistol",
    icon = "__base__/graphics/icons/pistol.png",
    flags = {"always-show"},
    subgroup = "gun",
    order = "a[basic-clips]-a[pistol]",
    inventory_move_sound = item_sounds.weapon_small_inventory_move,
    pick_sound = item_sounds.weapon_small_inventory_pickup,
    drop_sound = item_sounds.weapon_small_inventory_move,
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
    subgroup = "gun",
    order = "a[basic-clips]-b[submachine-gun]",
    inventory_move_sound = item_sounds.weapon_large_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.weapon_large_inventory_move,
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
    hidden = true,
    auto_recycle = false,
    subgroup = "gun",
    order = "a[basic-clips]-b[vehicle-machine-gun]",
    inventory_move_sound = item_sounds.weapon_large_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.weapon_large_inventory_move,
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
    subgroup = "gun",
    order = "b[shotgun]-a[basic]",
    inventory_move_sound = item_sounds.shotgun_inventory_move,
    pick_sound = item_sounds.weapon_large_inventory_pickup,
    drop_sound = item_sounds.shotgun_inventory_move,
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "shotgun-shell",
      cooldown = 60,
      movement_slow_down_factor = 0.6,
      projectile_creation_distance = 0.125,
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
    place_as_equipment_result = "solar-panel-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a[solar-panel]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "fission-reactor-equipment",
    icon = "__base__/graphics/icons/fission-reactor-equipment.png",
    place_as_equipment_result = "fission-reactor-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-b[fission-reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    stack_size = 20,
    weight = 0.25 * tons
  },
  {
    type = "item",
    name = "battery-equipment",
    icon = "__base__/graphics/icons/battery-equipment.png",
    place_as_equipment_result = "battery-equipment",
    subgroup = "equipment",
    order = "b[battery]-a[battery-equipment]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "battery-mk2-equipment",
    localised_description = {"item-description.battery-equipment"},
    icon = "__base__/graphics/icons/battery-mk2-equipment.png",
    place_as_equipment_result = "battery-mk2-equipment",
    subgroup = "equipment",
    order = "b[battery]-b[battery-equipment-mk2]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 20,
    weight = 100 * kg
  },
  {
    type = "item",
    name = "belt-immunity-equipment",
    icon = "__base__/graphics/icons/belt-immunity-equipment.png",
    place_as_equipment_result = "belt-immunity-equipment",
    subgroup = "utility-equipment",
    order = "c[belt-immunity]-a[belt-immunity]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "exoskeleton-equipment",
    icon = "__base__/graphics/icons/exoskeleton-equipment.png",
    place_as_equipment_result = "exoskeleton-equipment",
    subgroup = "utility-equipment",
    order = "d[exoskeleton]-a[exoskeleton-equipment]",
    inventory_move_sound = item_sounds.exoskeleton_inventory_move,
    pick_sound = item_sounds.exoskeleton_inventory_pickup,
    drop_sound = item_sounds.exoskeleton_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-roboport-equipment",
    icon = "__base__/graphics/icons/personal-roboport-equipment.png",
    place_as_equipment_result = "personal-roboport-equipment",
    subgroup = "utility-equipment",
    order = "e[robotics]-a[personal-roboport-equipment]",
    inventory_move_sound = item_sounds.roboport_inventory_move,
    pick_sound = item_sounds.roboport_inventory_pickup,
    drop_sound = item_sounds.roboport_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "personal-roboport-mk2-equipment",
    localised_description = {"item-description.personal-roboport-equipment"},
    icon = "__base__/graphics/icons/personal-roboport-mk2-equipment.png",
    place_as_equipment_result = "personal-roboport-mk2-equipment",
    subgroup = "utility-equipment",
    order = "e[robotics]-b[personal-roboport-mk2-equipment]",
    inventory_move_sound = item_sounds.roboport_inventory_move,
    pick_sound = item_sounds.roboport_inventory_pickup,
    drop_sound = item_sounds.roboport_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "night-vision-equipment",
    icon = "__base__/graphics/icons/night-vision-equipment.png",
    place_as_equipment_result = "night-vision-equipment",
    subgroup = "utility-equipment",
    order = "f[night-vision]-a[night-vision-equipment]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "energy-shield-equipment",
    icon = "__base__/graphics/icons/energy-shield-equipment.png",
    place_as_equipment_result = "energy-shield-equipment",
    subgroup = "military-equipment",
    order = "a[shield]-a[energy-shield-equipment]",
    inventory_move_sound = item_sounds.energy_shield_inventory_move,
    pick_sound = item_sounds.energy_shield_inventory_pickup,
    drop_sound = item_sounds.energy_shield_inventory_move,
    stack_size = 20
  },
  {
    type = "item",
    name = "energy-shield-mk2-equipment",
    localised_description = {"item-description.energy-shield-equipment"},
    icon = "__base__/graphics/icons/energy-shield-mk2-equipment.png",
    place_as_equipment_result = "energy-shield-mk2-equipment",
    subgroup = "military-equipment",
    order = "a[shield]-b[energy-shield-equipment-mk2]",
    inventory_move_sound = item_sounds.energy_shield_inventory_move,
    pick_sound = item_sounds.energy_shield_inventory_pickup,
    drop_sound = item_sounds.energy_shield_inventory_move,
    stack_size = 20,
    weight = 100*kg
  },
  {
    type = "item",
    name = "personal-laser-defense-equipment",
    icon = "__base__/graphics/icons/personal-laser-defense-equipment.png",
    place_as_equipment_result = "personal-laser-defense-equipment",
    subgroup = "military-equipment",
    order = "b[active-defense]-a[personal-laser-defense-equipment]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    stack_size = 20,
    weight = 200*kg
  },
  {
    type = "item",
    name = "discharge-defense-equipment",
    icon = "__base__/graphics/icons/discharge-defense-equipment.png",
    place_as_equipment_result = "discharge-defense-equipment",
    subgroup = "military-equipment",
    order = "b[active-defense]-b[discharge-defense-equipment]-a[equipment]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    stack_size = 20
  },
  {
    type = "capsule",
    name = "discharge-defense-remote",
    icon = "__base__/graphics/icons/discharge-defense-equipment-controller.png",
    flags = {"only-in-cursor", "not-stackable", "spawnable"},
    auto_recycle = false,
    capsule_action =
    {
      type = "equipment-remote",
      equipment = "discharge-defense-equipment"
    },
    subgroup = "spawnables",
    order = "b[active-defense]-b[discharge-defense-equipment]-b[remote]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 1
  },
  {
    type = "item",
    name = "gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    subgroup = "turret",
    order = "b[turret]-a[gun-turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "gun-turret",
    stack_size = 50
  },
  {
    type = "item",
    name = "laser-turret",
    icon = "__base__/graphics/icons/laser-turret.png",
    subgroup = "turret",
    order = "b[turret]-b[laser-turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "laser-turret",
    stack_size = 50,
    weight = 40*kg
  },
  {
    type = "item",
    name = "flamethrower-turret",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    subgroup = "turret",
    order = "b[turret]-c[flamethrower-turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.flamethrower_inventory_move,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "flamethrower-turret",
    stack_size = 50,
    weight = 50*kg
  },
  {
    type = "item",
    name = "artillery-turret",
    icon = "__base__/graphics/icons/artillery-turret.png",
    subgroup = "turret",
    order = "b[turret]-d[artillery-turret]-a[turret]",
    inventory_move_sound = item_sounds.artillery_large_inventory_move,
    pick_sound = item_sounds.artillery_large_inventory_pickup,
    drop_sound = item_sounds.artillery_large_inventory_move,
    place_result = "artillery-turret",
    stack_size = 10,
    weight = 200*kg
  },
  {
    type = "capsule",
    name = "artillery-targeting-remote",
    icon = "__base__/graphics/icons/artillery-targeting-remote.png",
    flags = {"only-in-cursor", "not-stackable", "spawnable"},
    auto_recycle = false,
    capsule_action =
    {
      type = "artillery-remote",
      flare = "artillery-flare"
    },
    subgroup = "spawnables",
    order = "b[turret]-d[artillery-turret]-b[remote]",
    inventory_move_sound = item_sounds.artillery_remote_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.artillery_remote_inventory_move,
    stack_size = 1
  },
  {
    type = "item",
    name = "arithmetic-combinator",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    subgroup = "circuit-network",
    place_result = "arithmetic-combinator",
    order = "c[combinators]-a[arithmetic-combinator]",
    inventory_move_sound = item_sounds.combinator_inventory_move,
    pick_sound = item_sounds.combinator_inventory_pickup,
    drop_sound = item_sounds.combinator_inventory_move,
    stack_size = 50
  },
  {
    type = "item",
    name = "decider-combinator",
    icon = "__base__/graphics/icons/decider-combinator.png",
    subgroup = "circuit-network",
    place_result = "decider-combinator",
    order = "c[combinators]-b[decider-combinator]",
    inventory_move_sound = item_sounds.combinator_inventory_move,
    pick_sound = item_sounds.combinator_inventory_pickup,
    drop_sound = item_sounds.combinator_inventory_move,
    stack_size = 50
  },
  {
    type = "item",
    name = "constant-combinator",
    icon = "__base__/graphics/icons/constant-combinator.png",
    subgroup = "circuit-network",
    place_result = "constant-combinator",
    order = "c[combinators]-d[constant-combinator]",
    inventory_move_sound = item_sounds.combinator_inventory_move,
    pick_sound = item_sounds.combinator_inventory_pickup,
    drop_sound = item_sounds.combinator_inventory_move,
    stack_size = 50
  },
  {
    type = "item",
    name = "selector-combinator",
    icon = "__base__/graphics/icons/selector-combinator.png",
    subgroup = "circuit-network",
    place_result="selector-combinator",
    order = "c[combinators]-c[selector-combinator]",
    inventory_move_sound = item_sounds.combinator_inventory_move,
    pick_sound = item_sounds.combinator_inventory_pickup,
    drop_sound = item_sounds.combinator_inventory_move,
    stack_size= 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "power-switch",
    icon = "__base__/graphics/icons/power-switch.png",
    subgroup = "circuit-network",
    place_result = "power-switch",
    order = "d[other]-a[power-switch]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 10
  },
  {
    type = "item",
    name = "programmable-speaker",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    subgroup = "circuit-network",
    order = "d[other]-b[programmable-speaker]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "programmable-speaker",
    stack_size = 10,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "display-panel",
    icon = "__base__/graphics/icons/display-panel.png",
    icon_size = 64,
    subgroup = "circuit-network",
    order = "s[display-panel]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "display-panel",
    stack_size = 10
  },
  {
    type = "item",
    name = "science",
    icon = "__base__/graphics/icons/science.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "zz[science]",
    hidden = true,
    stack_size = 1
  }
})

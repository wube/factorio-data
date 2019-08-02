data:extend(
{
  {
    type = "item",
    name = "stone-brick",
    icon = "__base__/graphics/icons/stone-brick.png",
    icon_size = 32,
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
    icon_size = 32,
    fuel_value = "2MJ",
    fuel_category = "chemical",
    subgroup = "raw-resource",
    order = "a[wood]",
    stack_size = 100
  },
  {
    type = "item",
    name = "coal",
    icon = "__base__/graphics/icons/mip/coal.png",
    icon_size = 64,
    icon_mipmaps = 4,
    dark_background_icon = "__base__/graphics/icons/mip/coal-dark-background.png",
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/mip/coal.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/coal-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/coal-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/coal-3.png", scale = 0.25, mipmap_count = 4 }
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
    icon = "__base__/graphics/icons/mip/stone.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/mip/stone.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/stone-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/stone-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/stone-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "d[stone]",
    stack_size = 50
  },
  {
    type = "item",
    name = "iron-ore",
    icon = "__base__/graphics/icons/mip/iron-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/mip/iron-ore.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/iron-ore-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/iron-ore-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/iron-ore-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "e[iron-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "copper-ore",
    icon = "__base__/graphics/icons/mip/copper-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/mip/copper-ore.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/copper-ore-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/copper-ore-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/copper-ore-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "f[copper-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "iron-plate",
    icon = "__base__/graphics/icons/iron-plate.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "b[iron-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "copper-plate",
    icon = "__base__/graphics/icons/copper-plate.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "c[copper-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "copper-cable",
    icon = "__base__/graphics/icons/copper-cable.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "a[copper-cable]",
    stack_size = 200,
    wire_count = 1
  },
  {
    type = "item",
    name = "iron-stick",
    icon = "__base__/graphics/icons/iron-stick.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "b[iron-stick]",
    stack_size = 100
  },
  {
    type = "item",
    name = "iron-gear-wheel",
    icon = "__base__/graphics/icons/iron-gear-wheel.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "c[iron-gear-wheel]",
    stack_size = 100
  },
  {
    type = "item",
    name = "electronic-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "e[electronic-circuit]",
    stack_size = 200
  },
  {
    type = "item",
    name = "wooden-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    subgroup = "storage",
    order = "a[items]-a[wooden-chest]",
    place_result = "wooden-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 32,
    subgroup = "smelting-machine",
    order = "a[stone-furnace]",
    place_result = "stone-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "burner-mining-drill",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    icon_size = 32,
    subgroup = "extraction-machine",
    order = "a[items]-a[burner-mining-drill]",
    place_result = "burner-mining-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-mining-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 32,
    subgroup = "extraction-machine",
    order = "a[items]-b[electric-mining-drill]",
    place_result = "electric-mining-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    icon_size = 32,
    subgroup = "belt",
    order = "a[transport-belt]-a[transport-belt]",
    place_result = "transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "a[burner-inserter]",
    place_result = "burner-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "inserter",
    icon = "__base__/graphics/icons/inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "b[inserter]",
    place_result = "inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "d[fast-inserter]",
    place_result = "fast-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "c[long-handed-inserter]",
    place_result = "long-handed-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "offshore-pump",
    icon = "__base__/graphics/icons/offshore-pump.png",
    icon_size = 32,
    subgroup = "extraction-machine",
    order = "b[fluids]-a[offshore-pump]",
    place_result = "offshore-pump",
    stack_size = 20
  },
  {
    type = "item",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-a[pipe]",
    place_result = "pipe",
    stack_size = 100
  },
  {
    type = "item",
    name = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 32,
    subgroup = "energy",
    order = "b[steam-power]-a[boiler]",
    place_result = "boiler",
    stack_size = 50
  },
  {
    type = "item",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 32,
    subgroup = "energy",
    order = "b[steam-power]-b[steam-engine]",
    place_result = "steam-engine",
    stack_size = 10
  },
  {
    type = "item",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-a[small-electric-pole]",
    place_result = "small-electric-pole",
    stack_size = 50
  },
  {
    type = "item",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 32,
    subgroup = "defensive-structure",
    order = "d[radar]-a[radar]",
    place_result = "radar",
    stack_size = 50
  },
  {
    type = "item",
    name = "computer",
    icon = "__base__/graphics/icons/computer.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "defensive-structure",
    order = "g[computer]",
    stack_size = 1
  },
  {
    type = "item",
    name = "small-plane",
    icon = "__base__/graphics/icons/small-plane.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "transport",
    order = "b[personal-transport]-c[small-plane]",
    stack_size = 1
  },
  {
    type = "item",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 32,
    subgroup = "circuit-network",
    order = "a[light]-a[small-lamp]",
    place_result = "small-lamp",
    stack_size = 50
  },
  {
    type = "item",
    name = "pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-b[pipe-to-ground]",
    place_result = "pipe-to-ground",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "a[assembling-machine-1]",
    place_result = "assembling-machine-1",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "b[assembling-machine-2]",
    place_result = "assembling-machine-2",
    stack_size = 50
  },
  {
    type = "item",
    name = "red-wire",
    icon = "__base__/graphics/icons/red-wire.png",
    icon_size = 32,
    subgroup = "circuit-network",
    order = "b[wires]-a[red-wire]",
    stack_size = 200,
    wire_count = 1
  },
  {
    type = "item",
    name = "green-wire",
    icon = "__base__/graphics/icons/green-wire.png",
    icon_size = 32,
    subgroup = "circuit-network",
    order = "b[wires]-b[green-wire]",
    stack_size = 200,
    wire_count = 1
  },
  {
    type = "capsule",
    name = "raw-fish",
    icon = "__base__/graphics/icons/fish.png",
    icon_size = 32,
    subgroup = "raw-resource",
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
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
                type = "damage",
                damage = {type = "physical", amount = -80}
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
    icon_size = 32,
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
    icon_size = 32,
    subgroup = "defensive-structure",
    order = "a[stone-wall]-a[stone-wall]",
    place_result = "stone-wall",
    stack_size = 100
  },
  {
    type = "item",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "g[lab]",
    place_result = "lab",
    stack_size = 10
  },
  {
    type = "copy-paste-tool",
    name = "copy-paste-tool",
    icon = "__base__/graphics/icons/copy-paste-tool.png",
    icon_size = 32,
    flags = {"only-in-cursor", "hidden"},
    subgroup = "tool",
    order = "c[automated-construction]-x",
    stack_size = 1,
    stackable = false,
    draw_label_for_cursor_render = true,
    selection_color = {0, 1, 0},
    alt_selection_color = {0, 1, 1},
    selection_mode = {"blueprint"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    -- mouse_cursor = "selection-tool-cursor"
  },
  {
    type = "copy-paste-tool",
    name = "cut-paste-tool",
    icon = "__base__/graphics/icons/cut-paste-tool.png",
    icon_size = 32,
    flags = {"only-in-cursor", "hidden"},
    subgroup = "tool",
    order = "c[automated-construction]-x",
    stack_size = 1,
    stackable = false,
    draw_label_for_cursor_render = true,
    selection_color = {1, 0, 0},
    alt_selection_color = {1, 1, 0},
    selection_mode = {"deconstruct"},
    alt_selection_mode = {"deconstruct"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    cuts = true
  },
  {
    type = "blueprint",
    name = "blueprint",
    icon = "__base__/graphics/icons/blueprint.png",
    icon_size = 32,
    subgroup = "tool",
    order = "c[automated-construction]-a[blueprint]",
    stack_size = 1,
    stackable = false,
    draw_label_for_cursor_render = true,
    selection_color = {0, 1, 0},
    alt_selection_color = {0, 1, 0},
    selection_mode = {"blueprint"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy"
    -- mouse_cursor = "selection-tool-cursor"
  },
  {
    type = "item",
    name = "compilatron-chest",
    icon = "__base__/graphics/icons/compilatron-chest.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "storage",
    order = "a[items]-d[compilatron-chest]",
    place_result = "compilatron-chest",
    stack_size = 50,
  },
  {
    type = "tool",
    name = "automation-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/automation-science-pack.png",
    icon_size = 32,
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
    icon_size = 32,
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
    icon_size = 32,
    subgroup = "raw-material",
    order = "d[steel-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "splitter",
    icon = "__base__/graphics/icons/splitter.png",
    icon_size = 32,
    subgroup = "belt",
    order = "c[splitter]-a[splitter]",
    place_result = "splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "underground-belt",
    icon = "__base__/graphics/icons/underground-belt.png",
    icon_size = 32,
    subgroup = "belt",
    order = "b[underground-belt]-a[underground-belt]",
    place_result = "underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "belt",
    order = "d[loader]-a[basic-loader]",
    place_result = "loader",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 32,
    subgroup = "transport",
    order = "b[personal-transport]-a[car]",
    place_result = "car",
    stack_size = 1
  },
  {
    type = "item",
    name = "engine-unit",
    icon = "__base__/graphics/icons/engine-unit.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "h[engine-unit]",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    icon_size = 32,
    subgroup = "smelting-machine",
    order = "c[electric-furnace]",
    place_result = "electric-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "solid-fuel",
    icon = "__base__/graphics/icons/solid-fuel.png",
    icon_size = 32,
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
    icon_size = 32,
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
    icon_size = 32,
    subgroup = "storage",
    order = "a[items]-b[iron-chest]",
    place_result = "iron-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "a[robot]-b[construction-robot]",
    place_result = "construction-robot",
    stack_size = 50
  },
  {
    type = "item",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-c[big-electric-pole]",
    place_result = "big-electric-pole",
    stack_size = 50
  },
  {
    type = "item",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-b[medium-electric-pole]",
    place_result = "medium-electric-pole",
    stack_size = 50
  },
  {
    type = "capsule",
    name = "grenade",
    icon = "__base__/graphics/icons/grenade.png",
    icon_size = 32,
    capsule_action =
    {
      type = "throw",
      --uses_stack = false,
      attack_parameters =
      {
        type = "projectile",
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
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "grenade",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "a[grenade]-a[normal]",
    stack_size = 100
  },
  {
    type = "item",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 32,
    subgroup = "smelting-machine",
    order = "b[steel-furnace]",
    place_result = "steel-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "gate",
    icon = "__base__/graphics/icons/gate.png",
    icon_size = 32,
    subgroup = "defensive-structure",
    order = "a[wall]-b[gate]",
    place_result = "gate",
    stack_size = 50
  },
}
)

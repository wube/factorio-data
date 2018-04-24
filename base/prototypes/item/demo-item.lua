data:extend(
{
  {
    type = "item",
    name = "stone-brick",
    icon = "__base__/graphics/icons/stone-brick.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "terrain",
    order = "a[stone-brick]",
    stack_size = 100,
    place_as_tile =
    {
      result = "stone-path",
      condition_size = 4,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "raw-wood",
    icon = "__base__/graphics/icons/raw-wood.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "4MJ",
    fuel_category = "chemical",
    subgroup = "raw-resource",
    order = "a[raw-wood]",
    stack_size = 100
  },
  {
    type = "item",
    name = "coal",
    icon = "__base__/graphics/icons/coal.png",
    dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
    flags = {"goes-to-main-inventory"},
    fuel_category = "chemical",
    fuel_value = "8MJ",
    subgroup = "raw-resource",
    order = "b[coal]",
    stack_size = 50
  },
  {
    type = "item",
    name = "stone",
    icon = "__base__/graphics/icons/stone.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "d[stone]",
    stack_size = 50
  },
  {
    type = "item",
    name = "iron-ore",
    icon = "__base__/graphics/icons/iron-ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "e[iron-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "copper-ore",
    icon = "__base__/graphics/icons/copper-ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "f[copper-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "wood",
    icon = "__base__/graphics/icons/wood.png",
    flags = {"goes-to-main-inventory"},
    fuel_category = "chemical",
    fuel_value = "2MJ",
    subgroup = "raw-material",
    order = "a[wood]",
    stack_size = 50
  },
  {
    type = "item",
    name = "iron-plate",
    icon = "__base__/graphics/icons/iron-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "b[iron-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "copper-plate",
    icon = "__base__/graphics/icons/copper-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "c[copper-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "copper-cable",
    icon = "__base__/graphics/icons/copper-cable.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "a[copper-cable]",
    stack_size = 200
  },
  {
    type = "item",
    name = "iron-stick",
    icon = "__base__/graphics/icons/iron-stick.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "b[iron-stick]",
    stack_size = 100
  },
  {
    type = "item",
    name = "iron-gear-wheel",
    icon = "__base__/graphics/icons/iron-gear-wheel.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "c[iron-gear-wheel]",
    stack_size = 100
  },
  {
    type = "item",
    name = "electronic-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "e[electronic-circuit]",
    stack_size = 200
  },
  {
    type = "item",
    name = "wooden-chest",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"goes-to-quickbar"},
    fuel_category = "chemical",
    fuel_value = "4MJ",
    subgroup = "storage",
    order = "a[items]-a[wooden-chest]",
    place_result = "wooden-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "stone-furnace",
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"goes-to-quickbar"},
    subgroup = "smelting-machine",
    order = "a[stone-furnace]",
    place_result = "stone-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "burner-mining-drill",
    icon = "__base__/graphics/icons/burner-mining-drill.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "a[items]-a[burner-mining-drill]",
    place_result = "burner-mining-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-mining-drill",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "a[items]-b[electric-mining-drill]",
    place_result = "electric-mining-drill",
    stack_size = 50
  },
  {
    type = "item",
    name = "transport-belt",
    icon = "__base__/graphics/icons/transport-belt.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "a[transport-belt]-a[transport-belt]",
    place_result = "transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "burner-inserter",
    icon = "__base__/graphics/icons/burner-inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "inserter",
    order = "a[burner-inserter]",
    place_result = "burner-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "inserter",
    icon = "__base__/graphics/icons/inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "inserter",
    order = "b[inserter]",
    place_result = "inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "offshore-pump",
    icon = "__base__/graphics/icons/offshore-pump.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "b[fluids]-a[offshore-pump]",
    place_result = "offshore-pump",
    stack_size = 20
  },
  {
    type = "item",
    name = "pipe",
    icon = "__base__/graphics/icons/pipe.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-a[pipe]",
    place_result = "pipe",
    stack_size = 100
  },
  {
    type = "item",
    name = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-a[boiler]",
    place_result = "boiler",
    stack_size = 50
  },
  {
    type = "item",
    name = "steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-b[steam-engine]",
    place_result = "steam-engine",
    stack_size = 10
  },
  {
    type = "item",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-a[small-electric-pole]",
    place_result = "small-electric-pole",
    fuel_category = "chemical",
    fuel_value = "4MJ",
    stack_size = 50
  },
  {
    type = "item",
    name = "radar",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "d[radar]-a[radar]",
    place_result = "radar",
    stack_size = 50
  },
  {
    type = "item",
    name = "computer",
    icon = "__base__/graphics/icons/computer.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "defensive-structure",
    order = "g[computer]",
    stack_size = 1
  },
  {
    type = "item",
    name = "small-plane",
    icon = "__base__/graphics/icons/small-plane.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "transport",
    order = "b[personal-transport]-c[small-plane]",
    stack_size = 1
  },
  {
    type = "item",
    name = "small-lamp",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"goes-to-quickbar"},
    subgroup = "circuit-network",
    order = "a[light]-a[small-lamp]",
    place_result = "small-lamp",
    stack_size = 50
  },
  {
    type = "item",
    name = "pipe-to-ground",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-b[pipe-to-ground]",
    place_result = "pipe-to-ground",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-1",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "a[assembling-machine-1]",
    place_result = "assembling-machine-1",
    stack_size = 50
  },
  {
    type = "item",
    name = "red-wire",
    icon = "__base__/graphics/icons/red-wire.png",
    flags = {"goes-to-quickbar"},
    subgroup = "circuit-network",
    order = "b[wires]-a[red-wire]",
    stack_size = 200
  },
  {
    type = "item",
    name = "green-wire",
    icon = "__base__/graphics/icons/green-wire.png",
    flags = {"goes-to-quickbar"},
    subgroup = "circuit-network",
    order = "b[wires]-b[green-wire]",
    stack_size = 200
  },
  {
    type = "capsule",
    name = "raw-fish",
    icon = "__base__/graphics/icons/fish.png",
    flags = {"goes-to-quickbar"},
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
    flags = {"goes-to-quickbar"},
    subgroup = "tool",
    order = "b[repair]-a[repair-pack]",
    speed = 2,
    durability = 300,
    stack_size = 100
  },
  {
    type = "item",
    name = "stone-wall",
    icon = "__base__/graphics/icons/stone-wall.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[stone-wall]-a[stone-wall]",
    place_result = "stone-wall",
    stack_size = 100
  },
}
)

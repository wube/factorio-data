data:extend(
{
  {
    type = "recipe",
    name = "player-port",
    enabled = "false",
    ingredients =
    {
      { "electronic-circuit", 10},
      {"iron-gear-wheel", 5},
      {"iron-plate", 1 }
    },
    result = "player-port"
  },
  {
    type = "recipe",
    name = "fast-transport-belt",
    enabled = "false",
    ingredients =
    {
      {"iron-gear-wheel", 5},
      {"basic-transport-belt", 1}
    },
    result = "fast-transport-belt"
  },
  {
    type = "recipe",
    name = "express-transport-belt",
    enabled = "false",
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"fast-transport-belt", 1}
    },
    result = "express-transport-belt"
  },
  {
    type = "recipe",
    name = "solar-panel",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 5},
      {"electronic-circuit", 15},
      {"copper-plate", 5}
    },
    result = "solar-panel"
  },
  {
    type = "recipe",
    name = "assembling-machine-2",
    enabled = "false",
    ingredients =
    {
      {"iron-plate", 9},
      {"electronic-circuit", 3},
      {"iron-gear-wheel", 5},
      {"assembling-machine-1", 1}
    },
    result = "assembling-machine-2"
  },
  {
    type = "recipe",
    name = "assembling-machine-3",
    enabled = "false",
    ingredients =
    {
      {"speed-module", 4},
      {"assembling-machine-2", 2}
    },
    result = "assembling-machine-3"
  },
  {
    type = "recipe",
    name = "car",
    enabled = "false",
    ingredients =
    {
      {"iron-stick", 5},
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 10},
      {"iron-plate", 20}
    },
    result = "car"
  },
  {
    type = "recipe",
    name = "straight-rail",
    enabled = "false",
    ingredients =
    {
      {"stone", 1},
      {"iron-stick", 1},
      {"steel-plate", 1}
    },
    result = "straight-rail",
    result_count = 2
  },
  {
    type = "recipe",
    name = "curved-rail",
    enabled = "false",
    ingredients = {{"stone", 4}, {"iron-stick", 4}, {"steel-plate", 4}},
    result = "curved-rail",
    result_count = 2
  },
  {
    type = "recipe",
    name = "diesel-locomotive",
    enabled = "false",
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 20},
      {"iron-plate", 20},
      {"steel-plate", 15},
    },
    result = "diesel-locomotive"
  },
  {
    type = "recipe",
    name = "cargo-wagon",
    enabled = "false",
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"iron-plate", 20},
      {"steel-plate", 5},
    },
    result = "cargo-wagon"
  },
  {
    type = "recipe",
    name = "train-stop",
    enabled = "false",
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-plate", 10},
      {"steel-plate", 3}
    },
    result = "train-stop"
  },
  {
    type = "recipe",
    name = "rail-signal",
    enabled = "false",
    ingredients =
    {
      {"advanced-circuit", 1},
      {"iron-plate", 5}
    },
    result = "rail-signal"
  },
  {
    type = "recipe",
    name = "heavy-armor",
    enabled = "false",
    energy_required = 8,
    ingredients = {{ "copper-plate", 100}, {"steel-plate", 50}},
    result = "heavy-armor"
  },
  {
    type = "recipe",
    name = "basic-modular-armor",
    enabled = "false",
    energy_required = 15,
    ingredients = {{ "advanced-circuit", 30}, {"speed-module", 5}, {"steel-plate", 50}},
    result = "basic-modular-armor"
  },
  {
    type = "recipe",
    name = "power-armor",
    enabled = "false",
    energy_required = 20,
    ingredients = {{ "effectivity-module-2", 5}, {"speed-module-2", 5}, {"steel-plate", 50}, {"alien-artifact", 10}},
    result = "power-armor"
  },
  {
    type = "recipe",
    name = "power-armor-mk2",
    enabled = "false",
    energy_required = 25,
    ingredients = {{ "effectivity-module-3", 5}, {"speed-module-3", 5}, {"steel-plate", 50}, {"alien-artifact", 50}},
    result = "power-armor-mk2"
  },
  {
    type = "recipe",
    name = "iron-chest",
    enabled = "true",
    ingredients = {{"iron-plate", 8}},
    result = "iron-chest"
  },
  {
    type = "recipe",
    name = "steel-chest",
    enabled = "false",
    ingredients = {{"steel-plate", 8}},
    result = "steel-chest"
  },
  {
    type = "recipe",
    name = "smart-chest",
    enabled = "false",
    ingredients =
    {
      {"steel-chest", 1},
      {"electronic-circuit", 3}
    },
    result = "smart-chest"
  },
  {
    type = "recipe",
    name = "wall",
    enabled = "true",
    ingredients = {{"stone-brick", 5}},
    result = "wall"
  },
  {
    type = "recipe",
    name = "flame-thrower",
    enabled = "false",
    energy_required = 10,
    ingredients =
    {
      {"steel-plate", 40},
      {"iron-gear-wheel", 20}
    },
    result = "flame-thrower"
  },
  {
    type = "recipe",
    name = "land-mine",
    enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 1},
      {"flame-thrower-ammo", 1}
    },
    result = "land-mine",
    result_count = 4
  },
  {
    type = "recipe",
    name = "rocket-launcher",
    enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"iron-plate", 5},
      {"iron-gear-wheel", 5}
    },
    result = "rocket-launcher"
  },
  {
    type = "recipe",
    name = "shotgun",
    enabled = "false",
    energy_required = 4,
    ingredients =
    {
      {"iron-plate", 15},
      {"iron-gear-wheel", 5},
      {"copper-plate", 10},
      {"wood", 5}
    },
    result = "shotgun"
  },
  {
    type = "recipe",
    name = "combat-shotgun",
    enabled = "false",
    energy_required = 8,
    ingredients =
    {
      {"steel-plate", 15},
      {"iron-gear-wheel", 5},
      {"copper-plate", 10},
      {"wood", 10}
    },
    result = "combat-shotgun"
  },
  {
    type = "recipe",
    name = "railgun",
    enabled = "false",
    energy_required = 8,
    ingredients =
    {
      {"steel-plate", 15},
      {"copper-plate", 15},
      {"electronic-circuit", 10},
      {"advanced-circuit", 5},
    },
    result = "railgun"
  },
  {
    type = "recipe",
    name = "science-pack-1",
    energy_required = 5,
    ingredients =
    {
      {"copper-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "science-pack-1"
  },
  {
    type = "recipe",
    name = "science-pack-2",
    energy_required = 6,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"basic-transport-belt", 1}
    },
    result = "science-pack-2"
  },
  {
    type = "recipe",
    name = "science-pack-3",
    enabled = "false",
    energy_required = 12,
    ingredients =
    {
      {"rocket", 1},
      {"steel-plate", 1},
      {"smart-inserter", 1},
      {"advanced-circuit", 1}
    },
    result = "science-pack-3"
  },
  {
    type = "recipe",
    name = "alien-science-pack",
    enabled = "false",
    energy_required = 12,
    ingredients = {{"alien-artifact", 1}
    },
    result = "alien-science-pack",
    result_count = 10
  },
  {
    type = "recipe",
    name = "lab",
    energy_required = 5,
    ingredients =
    {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 10},
      {"basic-transport-belt", 4}
    },
    result = "lab"
  },
  {
    type = "recipe",
    name = "red-wire",
    enabled = "false",
    ingredients =
    {
      {"electronic-circuit", 1},
      {"copper-cable", 1}
    },
    result = "red-wire"
  },
  {
    type = "recipe",
    name = "green-wire",
    enabled = "false",
    ingredients =
    {
      {"electronic-circuit", 1},
      {"copper-cable", 1}
    },
    result = "green-wire"
  },
  {
    type = "recipe",
    name = "basic-transport-belt-to-ground",
    enabled = "false",
    energy_required = 1,
    ingredients =
    {
      {"iron-plate", 20},
      {"basic-transport-belt", 6}
    },
    result_count = 2,
    result = "basic-transport-belt-to-ground"
  },
  {
    type = "recipe",
    name = "fast-transport-belt-to-ground",
    enabled = "false",
    ingredients =
    {
      {"iron-plate", 20},
      {"fast-transport-belt", 6}
    },
    result_count = 2,
    result = "fast-transport-belt-to-ground"
  },
  {
    type = "recipe",
    name = "express-transport-belt-to-ground",
    enabled = "false",
    ingredients =
    {
      {"express-transport-belt", 6},
      {"iron-plate", 20}
    },
    result_count = 2,
    result = "express-transport-belt-to-ground"
  },
  {
    type = "recipe",
    name = "basic-splitter",
    enabled = "false",
    energy_required = 1,
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-plate", 10},
      {"basic-transport-belt", 4}
    },
    result = "basic-splitter"
  },
  {
    type = "recipe",
    name = "fast-splitter",
    enabled = "false",
    energy_required = 2,
    ingredients =
    {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 10},
      {"fast-transport-belt", 4}
    },
    result = "fast-splitter"
  },
  {
    type = "recipe",
    name = "express-splitter",
    enabled = "false",
    energy_required = 2,
    ingredients =
    {
      {"advanced-circuit", 10},
      {"iron-gear-wheel", 20},
      {"express-transport-belt", 4}
    },
    result = "express-splitter"
  },
  {
    type = "recipe",
    name = "advanced-circuit",
    enabled = "false",
    energy_required = 3,
    ingredients =
    {
      {"electronic-circuit", 4},
      {"copper-cable", 4}
    },
    result = "advanced-circuit"
  },
  {
    type = "recipe",
    name = "logistic-robot",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 4},
      {"iron-gear-wheel", 5},
      {"advanced-circuit", 2}
    },
    result = "logistic-robot"
  },
  {
    type = "recipe",
    name = "construction-robot",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 4},
      {"iron-gear-wheel", 5},
      {"advanced-circuit", 2}
    },
    result = "construction-robot"
  },
  {
    type = "recipe",
    name = "logistic-chest-provider",
    enabled = "false",
    ingredients =
    {
      {"smart-chest", 1},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-provider"
  },
  {
    type = "recipe",
    name = "logistic-chest-storage",
    enabled = "false",
    ingredients =
    {
      {"smart-chest", 1},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-storage"
  },
  {
    type = "recipe",
    name = "logistic-chest-requester",
    enabled = "false",
    ingredients =
    {
      {"smart-chest", 1},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-requester"
  },
  {
    type = "recipe",
    name = "rocket-defense",
    enabled = "false",
    ingredients =
    {
      {"rocket", 100},
      {"advanced-circuit", 256},
      {"speed-module-3", 50},
      {"productivity-module-3", 50}
    },
    result = "rocket-defense"
  },
  {
    type = "recipe",
    name = "roboport",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 45},
      {"iron-gear-wheel", 45},
      {"advanced-circuit", 45}
    },
    result = "roboport",
    energy_required = 15
  },
  {
    type = "recipe",
    name = "steel-axe",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 5},
      {"iron-stick", 2}
    },
    result = "steel-axe"
  },
  {
    type = "recipe",
    name = "big-electric-pole",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 5},
      {"copper-plate", 5}
    },
    result = "big-electric-pole"
  },
  {
    type = "recipe",
    name = "substation",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 10},
      {"advanced-circuit", 5},
      {"copper-plate", 5}
    },
    result = "substation"
  },
  {
    type = "recipe",
    name = "medium-electric-pole",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 2},
      {"copper-plate", 2}
    },
    result = "medium-electric-pole"
  },
  {
    type = "recipe",
    name = "basic-accumulator",
    enabled = "false",
    ingredients =
    {
      {"iron-plate", 2},
      {"copper-plate", 5},
      {"electronic-circuit", 20}
    },
    result = "basic-accumulator"
  },
  {
    type = "recipe",
    name = "steel-furnace",
    ingredients = {{"steel-plate", 8}, {"stone-brick", 10}},
    result = "steel-furnace",
    energy_required = 3,
    enabled = "false"
  },
  {
    type = "recipe",
    name = "electric-furnace",
    ingredients = {{"steel-plate", 15}, {"advanced-circuit", 5}, {"stone-brick", 10}},
    result = "electric-furnace",
    energy_required = 5,
    enabled = "false"
  },
  {
    type = "recipe",
    name = "basic-beacon",
    enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"electronic-circuit", 20},
      {"advanced-circuit", 20},
      {"steel-plate", 10},
      {"copper-cable", 10}
    },
    result = "basic-beacon"
  }
}
)

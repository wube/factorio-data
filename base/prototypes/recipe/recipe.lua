data:extend(
{
  {
    type = "recipe",
    name = "player-port",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 5},
      {"iron-plate", 1 }
    },
    result = "player-port"
  },
  {
    type = "recipe",
    name = "fast-transport-belt",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 5},
      {"transport-belt", 1}
    },
    result = "fast-transport-belt"
  },
  {
    type = "recipe",
    name = "express-transport-belt",
    category = "crafting-with-fluid",
    normal =
    {
      enabled = false,

      ingredients =
      {
        {"iron-gear-wheel", 10},
        {"fast-transport-belt", 1},
        {type="fluid", name="lubricant", amount=20},
      },
      result = "express-transport-belt"
    },
    expensive =
    {
      enabled = false,
      ingredients =
      {
        {"iron-gear-wheel", 20},
        {"fast-transport-belt", 1},
        {type="fluid", name="lubricant", amount=20},
      },
      result = "express-transport-belt",
      requester_paste_multiplier = 20
    },
  },
  {
    type = "recipe",
    name = "solar-panel",
    energy_required = 10,
    enabled = false,
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
    normal =
    {
      enabled = false,
      ingredients =
      {
        {"iron-plate", 9},
        {"electronic-circuit", 3},
        {"iron-gear-wheel", 5},
        {"assembling-machine-1", 1}
      },
      result = "assembling-machine-2",
      requester_paste_multiplier = 4
    },
    expensive =
    {
      enabled = false,
      ingredients =
      {
        {"iron-plate", 20},
        {"electronic-circuit", 5},
        {"iron-gear-wheel", 10},
        {"assembling-machine-1", 1}
      },
      result = "assembling-machine-2",
      requester_paste_multiplier = 4
    },
  },
  {
    type = "recipe",
    name = "assembling-machine-3",
    enabled = false,
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
    enabled = false,
    ingredients =
    {
      {"engine-unit", 8},
      {"iron-plate", 20},
      {"steel-plate", 5}
    },
    result = "car"
  },
  {
    type = "recipe",
    name = "tank",
    normal =
    {
      enabled = false,
      ingredients =
      {
        {"engine-unit", 32},
        {"steel-plate", 50},
        {"iron-gear-wheel", 15},
        {"advanced-circuit", 10}
      },
      result = "tank"
    },
    expensive =
    {
      enabled = false,
      ingredients =
      {
        {"engine-unit", 64},
        {"steel-plate", 100},
        {"iron-gear-wheel", 30},
        {"advanced-circuit", 20}
      },
      result = "tank"
    }
  },
  {
    type = "recipe",
    name = "rail",
    enabled = false,
    ingredients =
    {
      {"stone", 1},
      {"iron-stick", 1},
      {"steel-plate", 1}
    },
    result = "rail",
    result_count = 2,
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "locomotive",
    enabled = false,
    ingredients =
    {
      {"engine-unit", 20},
      {"electronic-circuit", 10},
      {"steel-plate", 30}
    },
    result = "locomotive"
  },
  {
    type = "recipe",
    name = "cargo-wagon",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"iron-plate", 20},
      {"steel-plate", 20}
    },
    result = "cargo-wagon"
  },
  {
    type = "recipe",
    name = "fluid-wagon",
    enabled = false,
    energy_required = 1.5,
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"steel-plate", 16},
      {"pipe", 8},
      {"storage-tank", 3}
    },
    result = "fluid-wagon"
  },
  {
    type = "recipe",
    name = "train-stop",
    enabled = false,
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
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-plate", 5}
    },
    result = "rail-signal",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "rail-chain-signal",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-plate", 5}
    },
    result = "rail-chain-signal",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "heavy-armor",
    enabled = false,
    energy_required = 8,
    ingredients = {{ "copper-plate", 100}, {"steel-plate", 50}},
    result = "heavy-armor"
  },
  {
    type = "recipe",
    name = "modular-armor",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"advanced-circuit", 30},
      {"steel-plate", 50}
    },
    result = "modular-armor"
  },
  {
    type = "recipe",
    name = "power-armor",
    enabled = false,
    energy_required = 20,
    ingredients = {{ "processing-unit", 40}, {"electric-engine-unit", 20}, {"steel-plate", 40}},
    result = "power-armor",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "power-armor-mk2",
    enabled = false,
    energy_required = 25,
    ingredients = {{ "effectivity-module-3", 5}, {"speed-module-3", 5}, {"processing-unit", 40}, {"steel-plate", 40}},
    result = "power-armor-mk2",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "iron-chest",
    enabled = true,
    ingredients = {{"iron-plate", 8}},
    result = "iron-chest",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "steel-chest",
    enabled = false,
    ingredients = {{"steel-plate", 8}},
    result = "steel-chest",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "stone-wall",
    enabled = false,
    ingredients = {{"stone-brick", 5}},
    result = "stone-wall"
  },
  {
    type = "recipe",
    name = "gate",
    enabled = false,
    ingredients = {{"stone-wall", 1}, {"steel-plate", 2}, {"electronic-circuit", 2}},
    result = "gate"
  },
  {
    type = "recipe",
    name = "flamethrower",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"steel-plate", 5},
      {"iron-gear-wheel", 10}
    },
    result = "flamethrower"
  },
  {
    type = "recipe",
    name = "land-mine",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 1},
      {"explosives", 2}
    },
    result = "land-mine",
    result_count = 4
  },
  {
    type = "recipe",
    name = "rocket-launcher",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"iron-plate", 5},
      {"iron-gear-wheel", 5},
      {"electronic-circuit", 5}
    },
    result = "rocket-launcher"
  },
  {
    type = "recipe",
    name = "shotgun",
    enabled = false,
    energy_required = 10,
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
    enabled = false,
    energy_required = 10,
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
    enabled = false,
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
      {"inserter", 1},
      {"transport-belt", 1}
    },
    result = "science-pack-2"
  },
  {
    type = "recipe",
    name = "science-pack-3",
    enabled = false,
    energy_required = 12,
    ingredients =
    {
      {"advanced-circuit", 1},
      {"engine-unit", 1},
      {"electric-mining-drill", 1},
    },
    result = "science-pack-3"
  },
  {
    type = "recipe",
    name = "military-science-pack",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"piercing-rounds-magazine", 1},
      {"grenade", 1},
      {"gun-turret", 1}
    },
    result_count = 2,
    result = "military-science-pack",
  },
  {
    type = "recipe",
    name = "production-science-pack",
    enabled = false,
    energy_required = 14,
    ingredients =
    {
     {"electric-engine-unit", 1},
     {"assembling-machine-1", 1},
     {"electric-furnace", 1}
    },
    result_count = 2,
    result = "production-science-pack",
  },
  {
    type = "recipe",
    name = "high-tech-science-pack",
    enabled = false,
    energy_required = 14,
    ingredients =
    {
      {"battery", 1},
      {"processing-unit", 3},
      {"speed-module", 1},
      {"copper-cable", 30}
    },
    result_count = 2,
    result = "high-tech-science-pack",
  },

  {
    type = "recipe",
    name = "lab",
    energy_required = 3,
    ingredients =
    {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 10},
      {"transport-belt", 4}
    },
    result = "lab"
  },
  {
    type = "recipe",
    name = "red-wire",
    enabled = false,
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
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"copper-cable", 1}
    },
    result = "green-wire"
  },
  {
    type = "recipe",
    name = "underground-belt",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"iron-plate", 10},
      {"transport-belt", 5}
    },
    result_count = 2,
    result = "underground-belt",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "fast-underground-belt",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 40},
      {"underground-belt", 2}
    },
    result_count = 2,
    result = "fast-underground-belt",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "express-underground-belt",
    category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 80},
      {"fast-underground-belt", 2},
      {type="fluid", name="lubricant", amount=40},
    },
    result_count = 2,
    result = "express-underground-belt"
  },
  {
    type = "recipe",
    name = "loader",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"inserter", 5},
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 5},
      {"iron-plate", 5},
      {"transport-belt", 5}
    },
    result = "loader"
  },
  {
    type = "recipe",
    name = "fast-loader",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"fast-transport-belt", 5},
      {"loader", 1}
    },
    result = "fast-loader"
  },
  {
    type = "recipe",
    name = "express-loader",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"express-transport-belt", 5},
      {"fast-loader", 1}
    },
    result = "express-loader"
  },
  {
    type = "recipe",
    name = "splitter",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-plate", 5},
      {"transport-belt", 4}
    },
    result = "splitter",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "fast-splitter",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {"splitter", 1},
      {"iron-gear-wheel", 10},
      {"electronic-circuit", 10}
    },
    result = "fast-splitter",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "express-splitter",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {"fast-splitter", 1},
      {"iron-gear-wheel", 10},
      {"advanced-circuit", 10},
      {type="fluid", name="lubricant", amount=80}
    },
    result = "express-splitter"
  },
  {
    type = "recipe",
    name = "advanced-circuit",
    normal =
    {
      enabled = false,
      energy_required = 6,
      ingredients =
      {
        {"electronic-circuit", 2},
        {"plastic-bar", 2},
        {"copper-cable", 4}
      },
      result = "advanced-circuit",
      requester_paste_multiplier = 5
    },
    expensive =
    {
      enabled = false,
      energy_required = 6,
      ingredients =
      {
        {"electronic-circuit", 2},
        {"plastic-bar", 4},
        {"copper-cable", 8}
      },
      result = "advanced-circuit",
      requester_paste_multiplier = 5
    }
  },
  {
    type = "recipe",
    name = "processing-unit",
    category = "crafting-with-fluid",
    normal =
    {
      enabled = false,
      energy_required = 10,
      ingredients =
      {
        {"electronic-circuit", 20},
        {"advanced-circuit", 2},
        {type = "fluid", name = "sulfuric-acid", amount = 5}
      },
      result = "processing-unit"
    },
    expensive =
    {
      enabled = false,
      energy_required = 10,
      ingredients =
      {
        {"electronic-circuit", 20},
        {"advanced-circuit", 2},
        {type = "fluid", name = "sulfuric-acid", amount = 10}
      },
      result = "processing-unit"
    }
  },
  {
    type = "recipe",
    name = "logistic-robot",
    enabled = false,
    ingredients =
    {
      {"flying-robot-frame", 1},
      {"advanced-circuit", 2}
    },
    result = "logistic-robot"
  },
  {
    type = "recipe",
    name = "construction-robot",
    enabled = false,
    ingredients =
    {
      {"flying-robot-frame", 1},
      {"electronic-circuit", 2}
    },
    result = "construction-robot"
  },
  {
    type = "recipe",
    name = "logistic-chest-passive-provider",
    enabled = false,
    ingredients =
    {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-passive-provider",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "logistic-chest-active-provider",
    enabled = false,
    ingredients =
    {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-active-provider",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "logistic-chest-storage",
    enabled = false,
    ingredients =
    {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-storage",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "logistic-chest-requester",
    enabled = false,
    ingredients =
    {
      {"steel-chest", 1},
      {"electronic-circuit", 3},
      {"advanced-circuit", 1}
    },
    result = "logistic-chest-requester",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "rocket-silo",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 1000},
      {"concrete", 1000},
      {"pipe", 100},
      {"processing-unit", 200},
      {"electric-engine-unit", 200}
    },
    energy_required = 30,
    result = "rocket-silo",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "roboport",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 45},
      {"iron-gear-wheel", 45},
      {"advanced-circuit", 45}
    },
    result = "roboport",
    energy_required = 10
  },
  {
    type = "recipe",
    name = "steel-axe",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 5},
      {"iron-stick", 2}
    },
    result = "steel-axe",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "big-electric-pole",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 5},
      {"copper-plate", 5}
    },
    result = "big-electric-pole",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "substation",
    enabled = false,
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
    enabled = false,
    ingredients =
    {
      {"steel-plate", 2},
      {"copper-plate", 2}
    },
    result = "medium-electric-pole",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "accumulator",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {"iron-plate", 2},
      {"battery", 5}
    },
    result = "accumulator"
  },
  {
    type = "recipe",
    name = "steel-furnace",
    ingredients = {{"steel-plate", 6}, {"stone-brick", 10}},
    result = "steel-furnace",
    energy_required = 3,
    enabled = false
  },
  {
    type = "recipe",
    name = "electric-furnace",
    ingredients = {{"steel-plate", 10}, {"advanced-circuit", 5}, {"stone-brick", 10}},
    result = "electric-furnace",
    energy_required = 5,
    enabled = false
  },
  {
    type = "recipe",
    name = "beacon",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"electronic-circuit", 20},
      {"advanced-circuit", 20},
      {"steel-plate", 10},
      {"copper-cable", 10}
    },
    result = "beacon"
  },
  {
    type = "recipe",
    name = "pumpjack",
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 5},
      {"iron-gear-wheel", 10},
      {"electronic-circuit", 5},
      {"pipe", 10},
    },
    result = "pumpjack",
    enabled = false
  },
  {
    type = "recipe",
    name = "oil-refinery",
    energy_required = 10,
    ingredients =
    {
      {"steel-plate", 15},
      {"iron-gear-wheel", 10},
      {"stone-brick", 10},
      {"electronic-circuit", 10},
      {"pipe", 10}
    },
    result = "oil-refinery",
    enabled = false
  },
  {
    type = "recipe",
    name = "engine-unit",
    energy_required = 10,
    category = "advanced-crafting",
    ingredients =
    {
      {"steel-plate", 1},
      {"iron-gear-wheel", 1},
      {"pipe", 2}
    },
    result = "engine-unit",
    enabled = false
  },
  {
    type = "recipe",
    name = "electric-engine-unit",
    category = "crafting-with-fluid",
    energy_required = 10,
    ingredients =
    {
      {"engine-unit", 1},
      {type="fluid", name= "lubricant", amount = 15},
      {"electronic-circuit", 2}
    },
    result = "electric-engine-unit",
    enabled = false
  },
  {
    type = "recipe",
    name = "flying-robot-frame",
    energy_required = 20,
    ingredients =
    {
      {"electric-engine-unit", 1},
      {"battery", 2},
      {"steel-plate", 1},
      {"electronic-circuit", 3}
    },
    result = "flying-robot-frame",
    enabled = false
  },
  {
    type = "recipe",
    name = "explosives",
    category = "chemistry",
    crafting_machine_tint =
    {
      primary = {r = 0.955, g = 0.945, b = 0.000, a = 0.000}, -- #f3f10000
      secondary = {r = 0.000, g = 0.441, b = 0.659, a = 0.898}, -- #0070a8e5
      tertiary = {r = 0.000, g = 0.288, b = 0.365, a = 0.000}, -- #00495d00
    },
    normal =
    {
      energy_required = 5,
      enabled = false,
      ingredients =
      {
        {type="item", name="sulfur", amount=1},
        {type="item", name="coal", amount=1},
        {type="fluid", name="water", amount=10},
      },
      result= "explosives",
    },
    expensive =
    {
      energy_required = 5,
      enabled = false,
      ingredients =
      {
        {type="item", name="sulfur", amount=2},
        {type="item", name="coal", amount=2},
        {type="fluid", name="water", amount=10},
      },
      result= "explosives",
    }
  },
  {
    type = "recipe",
    name = "battery",
    category = "chemistry",
    normal =
    {
      energy_required = 5,
      enabled = false,
      ingredients =
      {
        {type="fluid", name="sulfuric-acid", amount=20},
        {"iron-plate", 1},
        {"copper-plate", 1}
      },
      result= "battery"
    },
    expensive =
    {
      energy_required = 5,
      enabled = false,
      ingredients =
      {
        {type="fluid", name="sulfuric-acid", amount=40},
        {"iron-plate", 1},
        {"copper-plate", 1}
      },
      result= "battery"
    },
    crafting_machine_tint =
    {
      primary = {r = 0.970, g = 0.611, b = 0.000, a = 0.000}, -- #f79b0000
      secondary = {r = 0.000, g = 0.680, b = 0.894, a = 0.357}, -- #00ade45b
      tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900
    }
  },
  {
    type = "recipe",
    name = "storage-tank",
    energy_required = 3,
    enabled = false,
    ingredients =
    {
      {"iron-plate", 20},
      {"steel-plate", 5}
    },
    result= "storage-tank"
  },
  {
    type = "recipe",
    name = "pump",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
      {"engine-unit", 1},
      {"steel-plate", 1},
      {"pipe", 1}
    },
    result= "pump"
  },
  {
    type = "recipe",
    name = "chemical-plant",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {"steel-plate", 5},
      {"iron-gear-wheel", 5},
      {"electronic-circuit", 5},
      {"pipe", 5}
    },
    result= "chemical-plant"
  },
  {
    type = "recipe",
    name = "small-plane",
    energy_required = 30,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"plastic-bar", 100},
      {"advanced-circuit", 200},
      {"electric-engine-unit", 20},
      {"battery", 100}
    },
    result= "small-plane"
  },
  {
    type = "recipe",
    name = "arithmetic-combinator",
    enabled = false,
    ingredients =
    {
      {"copper-cable", 5},
      {"electronic-circuit", 5},
    },
    result = "arithmetic-combinator"
  },
  {
    type = "recipe",
    name = "decider-combinator",
    enabled = false,
    ingredients =
    {
      {"copper-cable", 5},
      {"electronic-circuit", 5},
    },
    result = "decider-combinator"
  },
  {
    type = "recipe",
    name = "constant-combinator",
    enabled = false,
    ingredients =
    {
      {"copper-cable", 5},
      {"electronic-circuit", 2},
    },
    result = "constant-combinator"
  },
  {
    type = "recipe",
    name = "power-switch",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {"iron-plate", 5},
      {"copper-cable", 5},
      {"electronic-circuit", 2},
    },
    result = "power-switch"
  },
  {
    type = "recipe",
    name = "programmable-speaker",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {"iron-plate", 5},
      {"copper-cable", 5},
      {"electronic-circuit", 4},
    },
    result = "programmable-speaker"
  },
  {
    type = "recipe",
    name = "low-density-structure",
    category = "crafting",
    normal =
    {
      energy_required = 30,
      enabled = false,
      ingredients =
      {
        {"steel-plate", 10},
        {"copper-plate", 5},
        {"plastic-bar", 5}
      },
      result= "low-density-structure"
    },
    expensive =
    {
      energy_required = 30,
      enabled = false,
      ingredients =
      {
        {"steel-plate", 10},
        {"copper-plate", 10},
        {"plastic-bar", 10}
      },
      result= "low-density-structure"
    },
  },
  {
    type = "recipe",
    name = "rocket-fuel",
    energy_required = 30,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"solid-fuel", 10}
    },
    result= "rocket-fuel"
  },
  {
    type = "recipe",
    name = "rocket-control-unit",
    energy_required = 30,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"processing-unit", 1},
      {"speed-module", 1}
    },
    result= "rocket-control-unit"
  },
  {
    type = "recipe",
    name = "rocket-part",
    energy_required = 3,
    enabled = false,
    hidden = true,
    category = "rocket-building",
    ingredients =
    {
      {"low-density-structure", 10},
      {"rocket-fuel", 10},
      {"rocket-control-unit", 10}
    },
    result= "rocket-part"
  },
  {
    type = "recipe",
    name = "satellite",
    energy_required = 3,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"low-density-structure", 100},
      {"solar-panel", 100},
      {"accumulator", 100},
      {"radar", 5},
      {"processing-unit", 100},
      {"rocket-fuel", 50}
    },
    result= "satellite"
  },
  {
    type = "recipe",
    name = "concrete",
    energy_required = 10,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {"stone-brick", 5},
      {"iron-ore", 1},
      {type="fluid", name="water", amount=100}
    },
    result= "concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "hazard-concrete",
    energy_required = 0.25,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"concrete", 10}
    },
    result= "hazard-concrete",
    result_count = 10
  },
  {
    type = "recipe",
    name = "landfill",
    energy_required = 0.5,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"stone", 20}
    },
    result= "landfill",
    result_count = 1
  },
  {
    type = "recipe",
    name = "electric-energy-interface",
    energy_required = 0.5,
    enabled = false,
    ingredients =
    {
      {"iron-plate", 2},
      {"electronic-circuit", 5}
    },
    result = "electric-energy-interface"
  },
  {
    type = "recipe",
    name = "nuclear-reactor",
    energy_required = 4,
    enabled = false,
    ingredients =
    {
      {"concrete", 500},
      {"steel-plate", 500},
      {"advanced-circuit", 500},
      {"copper-plate", 500},
    },
    result = "nuclear-reactor",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "centrifuge",
    energy_required = 4,
    enabled = false,
    ingredients =
    {
      {"concrete", 100},
      {"steel-plate", 50},
      {"advanced-circuit", 100},
      {"iron-gear-wheel", 100},
    },
    result = "centrifuge",
    requester_paste_multiplier= 2
  },
  {
    type = "recipe",
    name = "uranium-processing",
    energy_required = 10,
    enabled = false,
    category = "centrifuging",
    ingredients = {{"uranium-ore", 10}},
    icon = "__base__/graphics/icons/uranium-processing.png",
    subgroup = "raw-material",
    order = "h[uranium-processing]",
    results =
    {
      {
        name = "uranium-235",
        probability = 0.007,
        amount = 1
      },
      {
        name = "uranium-238",
        probability = 0.993,
        amount = 1
      }
    }
  },
  {
    type = "recipe",
    name = "kovarex-enrichment-process",
    energy_required = 50,
    enabled = false,
    category = "centrifuging",
    ingredients = {{"uranium-235", 40}, {"uranium-238", 5}},
    icon = "__base__/graphics/icons/kovarex-enrichment-process.png",
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-c[kovarex-enrichment-process]",
    main_product = "",
    results =
    {
      {
        name = "uranium-235",
        amount = 41
      },
      {
        name = "uranium-238",
        amount = 2
      }
    },
    allow_decomposition = false
  },
   {
    type = "recipe",
    name = "nuclear-fuel-reprocessing",
    energy_required = 50,
    enabled = false,
    category = "centrifuging",
    ingredients = {{"used-up-uranium-fuel-cell", 5}},
    icon = "__base__/graphics/icons/nuclear-fuel-reprocessing.png",
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-b[nuclear-fuel-reprocessing]",
    main_product = "",
    results =
    {
      {
        name = "uranium-238",
        amount = 3
      }
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "uranium-fuel-cell",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {"iron-plate", 10},
      {"uranium-235", 1},
      {"uranium-238", 19}
    },
    result = "uranium-fuel-cell",
    result_count = 10
  },
  {
    type = "recipe",
    name = "heat-exchanger",
    enabled = false,
    ingredients = {{"steel-plate", 10}, {"copper-plate", 100}, {"pipe", 10}},
    result = "heat-exchanger"
  },
  {
    type = "recipe",
    name = "heat-pipe",
    enabled = false,
    ingredients = {{"steel-plate", 10}, {"copper-plate", 20}},
    result = "heat-pipe"
  },
  {
    type = "recipe",
    name = "steam-turbine",
    enabled = false,
    ingredients = {{"iron-gear-wheel", 50}, {"copper-plate", 50}, {"pipe", 20}},
    result = "steam-turbine"
  }
}
)

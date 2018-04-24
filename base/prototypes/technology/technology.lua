data:extend(
{
  {
    type = "technology",
    name = "steel-processing",
    icon = "__base__/graphics/technology/steel-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steel-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "steel-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "steel-axe"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"science-pack-1", 1}},
      time = 5
    },
    order = "c-a"
  },
  {
    type = "technology",
    name = "military",
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "submachine-gun"
      },
      {
        type = "unlock-recipe",
        recipe = "shotgun"
      },
      {
        type = "unlock-recipe",
        recipe = "shotgun-shell"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 15
    },
    order = "e-a-a"
  },
  {
    type = "technology",
    name = "military-2",
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "piercing-rounds-magazine"
      },
      {
        type = "unlock-recipe",
        recipe = "grenade"
      }
    },
    prerequisites = {"military", "steel-processing"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "e-a-b"
  },
  {
    type = "technology",
    name = "military-3",
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
    --[[
      {
        type = "unlock-recipe",
        recipe = "railgun"
      },
      {
        type = "unlock-recipe",
        recipe = "railgun-dart"
      },]]--
      {
        type = "unlock-recipe",
        recipe = "poison-capsule"
      },
      {
        type = "unlock-recipe",
        recipe = "slowdown-capsule"
      },
      {
        type = "unlock-recipe",
        recipe = "combat-shotgun"
      }
    },
    prerequisites = {"military-2", "laser", "rocketry"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "e-a-c"
  },
  {
    type = "technology",
    name = "cluster-grenade",
    icon = "__base__/graphics/technology/cluster-grenade.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cluster-grenade"
      },
    },
    prerequisites = {"military-4"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"alien-science-pack", 1},
      },
      time = 45
    },
    order = "e-a-d"
  },
  {
    type = "technology",
    name = "grenade-damage-1",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = "0.2"
      }
    },
    prerequisites = {"military-2"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "grenade-damage-2",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = "0.2"
      }
    },
    prerequisites = {"grenade-damage-1"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "grenade-damage-3",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = "0.2"
      }
    },
    prerequisites = {"grenade-damage-2"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "grenade-damage-4",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = "0.2"
      }
    },
    prerequisites = {"grenade-damage-3"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "grenade-damage-5",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = "0.2"
      }
    },
    prerequisites = {"grenade-damage-4"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1},
      },
      time = 45
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "grenade-damage-5",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = "0.2"
      }
    },
    prerequisites = {"grenade-damage-4"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "military-4",
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "piercing-shotgun-shell"
      },
    },
    prerequisites = {"military-3"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"alien-science-pack", 1},
      },
      time = 45
    },
    order = "e-a-e"
  },
  {
    type = "technology",
    name = "automation",
    icon = "__base__/graphics/technology/automation.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-1"
      },
      {
        type = "unlock-recipe",
        recipe = "long-handed-inserter"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 10
    },
    order = "a-b-a",
  },
  {
    type = "technology",
    name = "electronics",
    icon = "__base__/graphics/technology/electronics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "filter-inserter"
      }
    },
    prerequisites = {"automation"},
    unit =
    {
      count = 30,
      ingredients = {{"science-pack-1", 1}},
      time = 15
    },
    order = "a-d-a",
  },
  {
    type = "technology",
    name = "automation-2",
    icon = "__base__/graphics/technology/automation.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-2"
      }
    },
    prerequisites = {"electronics"},
    unit =
    {
      count = 40,
      ingredients = {{"science-pack-1", 2}},
      time = 15
    },
    order = "a-b-b",
  },
  {
    type = "technology",
    name = "automation-3",
    icon = "__base__/graphics/technology/automation.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-3"
      }
    },
    prerequisites = {"speed-module", "automation-2"},
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 60
    },
    order = "a-b-c"
  },
  {
    type = "technology",
    name = "explosives",
    icon = "__base__/graphics/technology/explosives.png",
    prerequisites = {"sulfur-processing"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "explosives"
      }
    },
    order = "a-e-d"
  },
  {
    type = "technology",
    name = "flammables",
    icon = "__base__/graphics/technology/flammables.png",
    prerequisites = {"oil-processing"},
    unit =
    {
      count = 60,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "e-c-a"
  },
  {
    type = "technology",
    name = "land-mine",
    icon = "__base__/graphics/technology/land-mine.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "land-mine"
      }
    },
    prerequisites = {"explosives", "military-2"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "e-e"
  },
  {
    type = "technology",
    name = "flame-thrower",
    icon = "__base__/graphics/technology/flame-thrower.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "flame-thrower"
      },
      {
        type = "unlock-recipe",
        recipe = "flame-thrower-ammo"
      },
      {
        type = "unlock-recipe",
        recipe = "flamethrower-turret"
      }
    },
    prerequisites = {"flammables", "military-2"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "e-c-b"
  },
    {
    type = "technology",
    name = "circuit-network",
    icon = "__base__/graphics/technology/circuit-network.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "red-wire"
      },
      {
        type = "unlock-recipe",
        recipe = "green-wire"
      },
      {
        type = "unlock-recipe",
        recipe = "arithmetic-combinator"
      },
      {
        type = "unlock-recipe",
        recipe = "decider-combinator"
      },
      {
        type = "unlock-recipe",
        recipe = "constant-combinator"
      },
      {
        type = "unlock-recipe",
        recipe = "power-switch"
      }
    },
    prerequisites = {"electronics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "a-d-d",
  },
  {
    type = "technology",
    name = "advanced-electronics",
    icon = "__base__/graphics/technology/advanced-electronics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-circuit"
      },
      {
        type = "unlock-recipe",
        recipe = "processing-unit"
      }
    },
    prerequisites = {"electronics", "plastics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "a-d-b",
  },
  {
    type = "technology",
    name = "advanced-electronics-2",
    icon = "__base__/graphics/technology/advanced-electronics-2.png",
    prerequisites = {"advanced-electronics"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-d-c",
  },
  {
    type = "technology",
    name = "logistics",
    icon = "__base__/graphics/technology/logistics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "splitter"
      }
    },
    unit =
    {
      count = 20,
      ingredients = {{"science-pack-1", 1}},
      time = 15
    },
    order = "a-f-a",
  },
  {
    type = "technology",
    name = "railway",
    icon = "__base__/graphics/technology/railway.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rail"
      },
      {
        type = "unlock-recipe",
        recipe = "diesel-locomotive"
      }
    },
    prerequisites = {"logistics-2", "steel-processing", "engine"},
    unit =
    {
      count = 70,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 20
    },
    order = "c-g-a",
  },
  {
    type = "technology",
    name = "automated-rail-transportation",
    icon = "__base__/graphics/technology/automated-rail-transportation.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "train-stop"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon"
      }
    },
    prerequisites = {"railway"},
    unit =
    {
      count = 70,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 20
    },
    order = "c-g-b",
  },
  {
    type = "technology",
    name = "rail-signals",
    icon = "__base__/graphics/technology/rail-signals.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rail-signal"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-chain-signal"
      }
    },
    prerequisites = {"automated-rail-transportation"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-g-c",
  },
  {
    type = "technology",
    name = "automobilism",
    icon = "__base__/graphics/technology/automobilism.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "car"
      },
    },
    prerequisites = {"logistics-2", "engine"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1}
      },
      time = 20
    },
    order = "e-b"
  },
  {
    type = "technology",
    name = "tanks",
    icon = "__base__/graphics/technology/tanks.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tank"
      },
      {
        type = "unlock-recipe",
        recipe = "cannon-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "explosive-cannon-shell"
      },
    },
    prerequisites = {"automobilism", "military-3"},
    unit =
    {
      count = 40,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 20
    },
    order = "e-c-c"
  },
  {
    type = "technology",
    name = "logistics-2",
    icon = "__base__/graphics/technology/logistics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fast-transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-splitter"
      }
    },
    prerequisites = {"logistics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-f-b",
  },
  {
    type = "technology",
    name = "logistics-3",
    icon = "__base__/graphics/technology/logistics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "express-transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "express-underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "express-splitter"
      }
    },
    prerequisites = {"logistics-2", "automation-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 15
    },
    order = "a-f-c",
  },
  {
    type = "technology",
    name = "optics",
    icon = "__base__/graphics/technology/optics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-lamp"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 15
    },
    order = "a-h-a",
  },
  {
    type = "technology",
    name = "solar-energy",
    icon = "__base__/graphics/technology/solar-energy.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel"
      }
    },
    prerequisites = {"optics", "electronics", "steel-processing"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-h-c",
  },
  {
    type = "technology",
    name = "laser",
    icon = "__base__/graphics/technology/laser.png",
    prerequisites = {"optics", "advanced-electronics"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-h-b",
  },
  {
    type = "technology",
    name = "rocketry",
    icon = "__base__/graphics/technology/rocketry.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-launcher"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket"
      }
    },
    prerequisites = {"electronics", "flammables", "explosives"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
    order = "e-g"
  },
  {
    type = "technology",
    name = "explosive-rocketry",
    icon = "__base__/graphics/technology/explosive-rocketry.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "explosive-rocket"
      }
    },
    prerequisites = {"rocketry"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 20
    },
    order = "e-h"
  },
  {
    type = "technology",
    name = "armor-making",
    icon = "__base__/graphics/technology/armor-making.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "light-armor"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 5
    },
    order = "g-a-a"
  },
  {
    type = "technology",
    name = "armor-making-2",
    icon = "__base__/graphics/technology/armor-making.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "heavy-armor"
      }
    },
    prerequisites = {"armor-making", "steel-processing"},
    unit =
    {
      count = 30,
      ingredients = {{"science-pack-1", 1}},
      time = 30
    },
    order = "g-a-b"
  },
  {
    type = "technology",
    name = "armor-making-3",
    icon = "__base__/graphics/technology/armor-making.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "modular-armor"
      }
    },
    prerequisites = {"armor-making-2", "speed-module"},
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 30
    },
    order = "g-a-c"
  },
  {
    type = "technology",
    name = "power-armor",
    icon = "__base__/graphics/technology/power-armor.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "power-armor"
      }
    },
    prerequisites = {"armor-making-3", "electric-engine"},
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 30
    },
    order = "g-c-a"
  },
  {
    type = "technology",
    name = "power-armor-2",
    icon = "__base__/graphics/technology/power-armor-mk2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "power-armor-mk2"
      }
    },
    prerequisites = {"power-armor", "alien-technology", "speed-module-3", "effectivity-module-3"},
    unit =
    {
      count = 150,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}, {"alien-science-pack", 3}},
      time = 30
    },
    order = "g-c-b"
  },
  {
    type = "technology",
    name = "turrets",
    icon = "__base__/graphics/technology/turrets.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "gun-turret"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 10
    },
    order = "a-j-a"
  },
  {
    type = "technology",
    name = "laser-turrets",
    icon = "__base__/graphics/technology/laser-turrets.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-turret"
      }
    },
    prerequisites = {"turrets", "laser", "battery"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-j-b"
  },
  {
    type = "technology",
    name = "stone-walls",
    icon = "__base__/graphics/technology/stone-walls.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "stone-wall"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 10
    },
    order = "a-k-a"
  },
  {
    type = "technology",
    name = "gates",
    icon = "__base__/graphics/technology/gates.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "gate"
      }
    },
    prerequisites = {"stone-walls", "military-2", "steel-processing"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-l-a"
  },
  {
    type = "technology",
    name = "flying",
    icon = "__base__/graphics/technology/flying.png",
    prerequisites = {"electric-engine", "advanced-electronics"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-h"
  },
  {
    type = "technology",
    name = "robotics",
    icon = "__base__/graphics/technology/robotics.png",
    prerequisites = {"advanced-electronics-2", "electric-engine", "battery"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "flying-robot-frame"
      }
    },
    order = "c-i",
  },
  {
    type = "technology",
    name = "alien-technology",
    icon = "__base__/graphics/technology/alien-technology.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "alien-science-pack"
      }
    },
    prerequisites = {"rocketry"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "e-f"
  },
  {
    type = "technology",
    name = "rocket-silo",
    icon = "__base__/graphics/technology/rocket-silo.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "low-density-structure"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-control-unit"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-part"
      },
      {
        type = "unlock-recipe",
        recipe = "satellite"
      }
    },
    prerequisites = {"rocketry", "advanced-electronics-2", "rocket-speed-5", "speed-module-3", "productivity-module-3"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    order = "k-a"
  },
  {
    type = "technology",
    name = "research-speed-1",
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.2
      }
    },
    prerequisites = {"electronics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-m-a"
  },
  {
    type = "technology",
    name = "research-speed-2",
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.3
      }
    },
    prerequisites = {"research-speed-1"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-m-b"
  },
  {
    type = "technology",
    name = "research-speed-3",
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.4
      }
    },
    prerequisites = {"research-speed-2"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-m-c"
  },
  {
    type = "technology",
    name = "research-speed-4",
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.5
      }
    },
    prerequisites = {"research-speed-3"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-m-d"
  },
  {
    type = "technology",
    name = "electric-energy-distribution-1",
    icon = "__base__/graphics/technology/electric-energy-distribution.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "medium-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "big-electric-pole"
      }
    },
    prerequisites = {"electronics", "steel-processing"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-e-b",
  },
  {
    type = "technology",
    name = "electric-energy-distribution-2",
    icon = "__base__/graphics/technology/electric-energy-distribution.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "substation"
      }
    },
    prerequisites = {"electric-energy-distribution-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 45
    },
    order = "c-e-c",
  },
  {
    type = "technology",
    name = "electric-energy-accumulators-1",
    icon = "__base__/graphics/technology/electric-energy-acumulators.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "accumulator"
      }
    },
    prerequisites = {"electric-energy-distribution-1", "battery"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-e-a",
  },
  {
    type = "technology",
    name = "advanced-material-processing",
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steel-furnace"
      }
    },
    prerequisites = {"steel-processing"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-c-a"
  },
  {
    type = "technology",
    name = "advanced-material-processing-2",
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-furnace"
      }
    },
    prerequisites = {"advanced-material-processing", "advanced-electronics"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-c-b"
  },
  {
    type = "technology",
    name = "concrete",
    icon = "__base__/graphics/technology/concrete.png",
    prerequisites = {"advanced-material-processing-2"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "concrete"
      },
      {
        type = "unlock-recipe",
        recipe = "hazard-concrete"
      }
    },
    order = "c-c-c"
  },
  {
    type = "technology",
    name = "effect-transmission",
    icon = "__base__/graphics/technology/effect-transmission.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "beacon"
      }
    },
    prerequisites = {"modules", "advanced-electronics-2"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    order = "i-i"
  },
  {
    type = "technology",
    name = "toolbelt",
    icon = "__base__/graphics/technology/toolbelt.png",
    effects =
    {
      {
        type = "num-quick-bars",
        modifier = 1
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-k-m"
  },
  {
    type = "technology",
    name = "engine",
    icon = "__base__/graphics/technology/engine.png",
    prerequisites = {"steel-processing", "automation-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 15
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "engine-unit"
      }
    },
    order = "b-a"
  },
  {
    type = "technology",
    name = "electric-engine",
    icon = "__base__/graphics/technology/electric-engine.png",
    prerequisites = {"engine", "advanced-electronics", "oil-processing"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 25
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-engine-unit"
      }
    },
    order = "b-b"
  },
  {
    type = "technology",
    name = "battery",
    icon = "__base__/graphics/technology/battery.png",
    prerequisites = {"sulfur-processing"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 25
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "battery"
      },
      {
        type = "unlock-recipe",
        recipe = "science-pack-3"
      }
    },
    order = "b-c"
  },
  {
    type = "technology",
    name = "landfill",
    icon = "__base__/graphics/technology/landfill.png",
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 25
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "landfill"
      }
    },
    order = "b-d"
  },
  {
    type = "technology",
    name = "construction-robotics",
    icon = "__base__/graphics/technology/construction-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "roboport"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-passive-provider"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-storage"
      },
      {
        type = "unlock-recipe",
        recipe = "construction-robot"
      },
      {
        type = "ghost-time-to-live",
        modifier = 60 * 60 * 30
      }
    },
    prerequisites = {"robotics", "flying"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-k-a",
  },
  {
    type = "technology",
    name = "automated-construction",
    icon = "__base__/graphics/technology/automated-construction.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "blueprint"
      },
      {
        type = "unlock-recipe",
        recipe = "blueprint-book"
      },
      {
        type = "unlock-recipe",
        recipe = "deconstruction-planner"
      },
      {
        type = "ghost-time-to-live",
        modifier = 60 * 60 * 30
      }
    },
    prerequisites = {"construction-robotics"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-k-b",
  },
  {
    type = "technology",
    name = "logistic-robotics",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "roboport"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-passive-provider"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-robot"
      }
    },
    prerequisites = { "robotics", "flying" },
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-k-c",
  },

  {
    type = "technology",
    name = "logistic-system",
    icon = "__base__/graphics/technology/logistic-system.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-active-provider"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-requester"
      }
    },
    prerequisites = { "logistic-robotics"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "c-k-d",
  },

  {
    type = "technology",
    name = "worker-robots-speed-1",
    icon = "__base__/graphics/technology/worker-robots-speed.png",
    effects = {
      {
        type = "worker-robot-speed",
        modifier = "0.35"
      }
    },
    prerequisites = {"logistic-robotics"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-f-a",
  },
  {
    type = "technology",
    name = "worker-robots-speed-2",
    icon = "__base__/graphics/technology/worker-robots-speed.png",
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = "0.4"
      }
    },
    prerequisites = {
      "worker-robots-speed-1"
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-f-b"
  },
  {
    type = "technology",
    name = "worker-robots-speed-3",
    icon = "__base__/graphics/technology/worker-robots-speed.png",
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = "0.45"
      }
    },
    prerequisites = {"worker-robots-speed-2"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "c-k-f-c"
  },
  {
    type = "technology",
    name = "worker-robots-speed-4",
    icon = "__base__/graphics/technology/worker-robots-speed.png",
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = "0.55"
      }
    },
    prerequisites = {"worker-robots-speed-3"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "c-k-f-d"
  },
  {
    type = "technology",
    name = "worker-robots-speed-5",
    icon = "__base__/graphics/technology/worker-robots-speed.png",
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = "0.65"
      }
    },
    prerequisites = {"worker-robots-speed-4"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "worker-robots-storage-1",
    icon = "__base__/graphics/technology/worker-robots-storage.png",
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = "1"
      }
    },
    prerequisites = {"logistic-robotics"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-g-a"
  },
  {
    type = "technology",
    name = "worker-robots-storage-2",
    icon = "__base__/graphics/technology/worker-robots-storage.png",
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = "1"
      }
    },
    prerequisites = {"worker-robots-storage-1"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "c-k-g-b"
  },
  {
    type = "technology",
    name = "worker-robots-storage-3",
    icon = "__base__/graphics/technology/worker-robots-storage.png",
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = "1"
      }
    },
    prerequisites = {"worker-robots-storage-2"},
    unit =
    {
      count = 450,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "c-k-g-c"
  },
  {
    type = "technology",
    name = "character-logistic-slots-1",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"logistic-robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-a"
  },
  {
    type = "technology",
    name = "character-logistic-slots-2",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-1"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-b"
  },
  {
    type = "technology",
    name = "character-logistic-slots-3",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-2"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-c"
  },
  {
    type = "technology",
    name = "character-logistic-slots-4",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-3"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-d"
  },
  {
    type = "technology",
    name = "character-logistic-slots-5",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-4"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-e"
  },
  {
    type = "technology",
    name = "character-logistic-slots-6",
    icon = "__base__/graphics/technology/character-logistic-slots.png",
    effects =
    {
      {
        type = "character-logistic-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-slots-5"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-e-f"
  },
  {
    type = "technology",
    name = "character-logistic-trash-slots-1",
    icon = "__base__/graphics/technology/character-logistic-trash-slots.png",
    effects =
    {
      {
        type = "character-logistic-trash-slots",
        modifier = 5
      }
    },
    prerequisites = {"logistic-robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-f-a"
  },
  {
    type = "technology",
    name = "character-logistic-trash-slots-2",
    icon = "__base__/graphics/technology/character-logistic-trash-slots.png",
    effects =
    {
      {
        type = "character-logistic-trash-slots",
        modifier = 5
      }
    },
    prerequisites = {"character-logistic-trash-slots-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-k-f-b"
  },
  {
    type = "technology",
    name = "shotgun-shell-damage-1",
    icon = "__base__/graphics/technology/shotgun-shell-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = "0.1"
      }
    },
    prerequisites = {"military"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "shotgun-shell-damage-2",
    icon = "__base__/graphics/technology/shotgun-shell-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = "0.1"
      }
    },
    prerequisites = {"shotgun-shell-damage-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-b"
  },
  {
    type = "technology",
    name = "shotgun-shell-damage-3",
    icon = "__base__/graphics/technology/shotgun-shell-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = "0.2"
      }
    },
    prerequisites = {"shotgun-shell-damage-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-c"
  },
  {
    type = "technology",
    name = "shotgun-shell-damage-4",
    icon = "__base__/graphics/technology/shotgun-shell-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = "0.2"
      }
    },
    prerequisites = {"shotgun-shell-damage-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-d"
  },
  {
    type = "technology",
    name = "shotgun-shell-damage-5",
    icon = "__base__/graphics/technology/shotgun-shell-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = "0.2"
      }
    },
    prerequisites = {"shotgun-shell-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-e"
  },
  {
    type = "technology",
    name = "shotgun-shell-damage-6",
    icon = "__base__/graphics/technology/shotgun-shell-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = "0.4"
      }
    },
    prerequisites = {"shotgun-shell-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-f"
  },
  {
    type = "technology",
    name = "shotgun-shell-speed-1",
    icon = "__base__/graphics/technology/shotgun-shell-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = "0.2"
      }
    },
    prerequisites = {"military"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-g"
  },
  {
    type = "technology",
    name = "shotgun-shell-speed-2",
    icon = "__base__/graphics/technology/shotgun-shell-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = "0.2"
      }
    },
    prerequisites = {"shotgun-shell-speed-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-h"
  },
  {
    type = "technology",
    name = "shotgun-shell-speed-3",
    icon = "__base__/graphics/technology/shotgun-shell-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = "0.3"
      }
    },
    prerequisites = {"shotgun-shell-speed-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-i"
  },
  {
    type = "technology",
    name = "shotgun-shell-speed-4",
    icon = "__base__/graphics/technology/shotgun-shell-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = "0.3"
      }
    },
    prerequisites = {"shotgun-shell-speed-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-j"
  },
  {
    type = "technology",
    name = "shotgun-shell-speed-5",
    icon = "__base__/graphics/technology/shotgun-shell-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = "0.3"
      }
    },
    prerequisites = {"shotgun-shell-speed-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-k"
  },
  {
    type = "technology",
    name = "shotgun-shell-speed-6",
    icon = "__base__/graphics/technology/shotgun-shell-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = "0.3"
      }
    },
    prerequisites = {"shotgun-shell-speed-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-l"
  },
    {
    type = "technology",
    name = "laser-turret-damage-1",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = "0.1"
      }
    },
    prerequisites = {"laser-turrets"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "laser-turret-damage-2",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = "0.1"
      }
    },
    prerequisites = {"laser-turret-damage-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-b"
  },
  {
    type = "technology",
    name = "laser-turret-damage-3",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"laser-turret-damage-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-c"
  },
  {
    type = "technology",
    name = "laser-turret-damage-4",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"laser-turret-damage-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-d"
  },
  {
    type = "technology",
    name = "laser-turret-damage-5",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"laser-turret-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-e"
  },
  {
    type = "technology",
    name = "laser-turret-damage-6",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = "0.4"
      }
    },
    prerequisites = {"laser-turret-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-f"
  },
  {
    type = "technology",
    name = "laser-turret-speed-1",
    icon = "__base__/graphics/technology/laser-turret-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"laser-turrets"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-g"
  },
  {
    type = "technology",
    name = "laser-turret-speed-2",
    icon = "__base__/graphics/technology/laser-turret-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"laser-turret-speed-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-h"
  },
  {
    type = "technology",
    name = "laser-turret-speed-3",
    icon = "__base__/graphics/technology/laser-turret-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = "0.3"
      }
    },
    prerequisites = {"laser-turret-speed-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-i"
  },
  {
    type = "technology",
    name = "laser-turret-speed-4",
    icon = "__base__/graphics/technology/laser-turret-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = "0.3"
      }
    },
    prerequisites = {"laser-turret-speed-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-j"
  },
  {
    type = "technology",
    name = "laser-turret-speed-5",
    icon = "__base__/graphics/technology/laser-turret-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = "0.3"
      }
    },
    prerequisites = {"laser-turret-speed-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-k"
  },
  {
    type = "technology",
    name = "laser-turret-speed-6",
    icon = "__base__/graphics/technology/laser-turret-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = "0.3"
      }
    },
    prerequisites = {"laser-turret-speed-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-l"
  },
    {
    type = "technology",
    name = "gun-turret-damage-1",
    icon = "__base__/graphics/technology/gun-turret-damage.png",
    effects =
    {
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = "0.1"
      }
    },
    prerequisites = {"turrets"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-o-a"
  },
  {
    type = "technology",
    name = "gun-turret-damage-2",
    icon = "__base__/graphics/technology/gun-turret-damage.png",
    effects =
    {
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = "0.1"
      }
    },
    prerequisites = {"gun-turret-damage-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-o-b"
  },
  {
    type = "technology",
    name = "gun-turret-damage-3",
    icon = "__base__/graphics/technology/gun-turret-damage.png",
    effects =
    {
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"gun-turret-damage-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-o-c"
  },
  {
    type = "technology",
    name = "gun-turret-damage-4",
    icon = "__base__/graphics/technology/gun-turret-damage.png",
    effects =
    {
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"gun-turret-damage-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-o-d"
  },
  {
    type = "technology",
    name = "gun-turret-damage-5",
    icon = "__base__/graphics/technology/gun-turret-damage.png",
    effects =
    {
     {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"gun-turret-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-o-e"
  },
  {
    type = "technology",
    name = "gun-turret-damage-6",
    icon = "__base__/graphics/technology/gun-turret-damage.png",
    effects =
    {
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = "0.4"
      }
    },
    prerequisites = {"gun-turret-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-o-f"
  },
  {
    type = "technology",
    name = "flamethrower-damage-1",
    icon = "__base__/graphics/technology/flamethrower-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flame-thrower",
        modifier = "0.2"
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"military-3", "flame-thrower"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "e-o-p-a"
  },
  {
    type = "technology",
    name = "flamethrower-damage-2",
    icon = "__base__/graphics/technology/flamethrower-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flame-thrower",
        modifier = "0.2"
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"flamethrower-damage-1"},
    unit =
    {
      count = 125,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "e-o-p-b"
  },
  {
    type = "technology",
    name = "flamethrower-damage-3",
    icon = "__base__/graphics/technology/flamethrower-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flame-thrower",
        modifier = "0.2"
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"flamethrower-damage-2"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 70
    },
    upgrade = true,
    order = "e-o-p-c"
  },
  {
    type = "technology",
    name = "flamethrower-damage-4",
    icon = "__base__/graphics/technology/flamethrower-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flame-thrower",
        modifier = "0.2"
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"flamethrower-damage-3"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 80
    },
    upgrade = true,
    order = "e-o-p-d"
  },
  {
    type = "technology",
    name = "flamethrower-damage-5",
    icon = "__base__/graphics/technology/flamethrower-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flame-thrower",
        modifier = "0.2"
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"flamethrower-damage-4"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 80
    },
    upgrade = true,
    order = "e-o-p-e"
  },
  {
    type = "technology",
    name = "flamethrower-damage-6",
    icon = "__base__/graphics/technology/flamethrower-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flame-thrower",
        modifier = "0.2"
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = "0.2"
      }
    },
    prerequisites = {"flamethrower-damage-5"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 80
    },
    upgrade = true,
    order = "e-o-p-f"
  },
  {
    type = "technology",
    name = "energy-shield-equipment",
    icon = "__base__/graphics/technology/energy-shield-equipment.png",
    prerequisites = {"armor-making-3"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "energy-shield-equipment"
      }
    },
    unit =
    {
      count = 150,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 15
    },
    order = "g-e-a"
  },
  {
    type = "technology",
    name = "night-vision-equipment",
    icon = "__base__/graphics/technology/night-vision-equipment.png",
    prerequisites = {"armor-making-3"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "night-vision-equipment"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 15
    },
    order = "g-g"
  },
  {
    type = "technology",
    name = "energy-shield-mk2-equipment",
    icon = "__base__/graphics/technology/energy-shield-mk2-equipment.png",
    prerequisites = {"energy-shield-equipment"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "energy-shield-mk2-equipment"
      }
    },
    unit =
    {
      count = 200,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 30
    },
    order = "g-e-b"
  },
  {
    type = "technology",
    name = "battery-equipment",
    icon = "__base__/graphics/technology/battery-equipment.png",
    prerequisites = {"armor-making-3", "battery"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "battery-equipment"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 15
    },
    order = "g-i-a"
  },
  {
    type = "technology",
    name = "battery-mk2-equipment",
    icon = "__base__/graphics/technology/battery-mk2-equipment.png",
    prerequisites = {"battery-equipment"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "battery-mk2-equipment"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 30
    },
    order = "g-i-b"
  },
  {
    type = "technology",
    name = "solar-panel-equipment",
    icon = "__base__/graphics/technology/solar-panel-equipment.png",
    prerequisites = {"armor-making-3"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel-equipment"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 15
    },
    order = "g-k"
  },
  {
    type = "technology",
    name = "personal-laser-defense-equipment",
    icon = "__base__/graphics/technology/personal-laser-defense-equipment.png",
    prerequisites = {"armor-making-3", "laser-turrets"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "personal-laser-defense-equipment"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 30
    },
    order = "g-m"
  },
  {
    type = "technology",
    name = "discharge-defense-equipment",
    icon = "__base__/graphics/technology/discharge-defense-equipment.png",
    prerequisites = {"armor-making-3", "alien-technology", "laser-turrets"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "discharge-defense-equipment",
      },
      {
        type = "unlock-recipe",
        recipe = "discharge-defense-remote"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}, {"alien-science-pack", 1}},
      time = 30
    },
    order = "g-o"
  },
  {
    type = "technology",
    name = "fusion-reactor-equipment",
    icon = "__base__/graphics/technology/fusion-reactor-equipment.png",
    prerequisites = {"solar-panel-equipment"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fusion-reactor-equipment"
      }
    },
    unit =
    {
      count = 200,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 30
    },
    order = "g-l"
  },
  {
    type = "technology",
    name = "exoskeleton-equipment",
    icon = "__base__/graphics/technology/exoskeleton-equipment.png",
    prerequisites = {"solar-panel-equipment", "electric-engine"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "exoskeleton-equipment"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 30
    },
    order = "g-h"
  },
  {
    type = "technology",
    name = "personal-roboport-equipment",
    icon = "__base__/graphics/technology/personal-roboport-equipment.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "personal-roboport-equipment"
      },
    },
    prerequisites = { "construction-robotics", "solar-panel-equipment" },
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    order = "c-k-d-zz",
  },
    {
    type = "technology",
    name = "bullet-damage-1",
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = "0.1"
      }
    },
    prerequisites = {"military"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-a"
  },
  {
    type = "technology",
    name = "bullet-damage-2",
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = "0.1"
      }
    },
    prerequisites = {"bullet-damage-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-b"
  },
  {
    type = "technology",
    name = "bullet-damage-3",
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = "0.2"
      }
    },
    prerequisites = {"bullet-damage-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-c"
  },
  {
    type = "technology",
    name = "bullet-damage-4",
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = "0.2"
      }
    },
    prerequisites = {"bullet-damage-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-d"
  },
  {
    type = "technology",
    name = "bullet-damage-5",
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = "0.2"
      }
    },
    prerequisites = {"bullet-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-e"
  },
  {
    type = "technology",
    name = "bullet-damage-6",
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = "0.4"
      }
    },
    prerequisites = {"bullet-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-f"
  },
  {
    type = "technology",
    name = "bullet-speed-1",
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = "0.2"
      }
    },
    prerequisites = {"military"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-g"
  },
  {
    type = "technology",
    name = "bullet-speed-2",
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = "0.2"
      }
    },
    prerequisites = {"bullet-speed-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-h"
  },
  {
    type = "technology",
    name = "bullet-speed-3",
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = "0.3"
      }
    },
    prerequisites = {"bullet-speed-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-i"
  },
  {
    type = "technology",
    name = "bullet-speed-4",
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = "0.3"
      }
    },
    prerequisites = {"bullet-speed-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-j"
  },
  {
    type = "technology",
    name = "bullet-speed-5",
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = "0.3"
      }
    },
    prerequisites = {"bullet-speed-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-k"
  },
  {
    type = "technology",
    name = "bullet-speed-6",
    icon = "__base__/graphics/technology/bullet-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = "0.3"
      }
    },
    prerequisites = {"bullet-speed-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-l"
  },
    {
    type = "technology",
    name = "fluid-handling",
    icon = "__base__/graphics/technology/fluid-handling.png",
    prerequisites = {"oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "small-pump"
      },
      {
        type = "unlock-recipe",
        recipe = "empty-barrel"
      },
      {
        type = "unlock-recipe",
        recipe = "fill-crude-oil-barrel"
      },
      {
        type = "unlock-recipe",
        recipe = "empty-crude-oil-barrel"
      }
    },
    unit =
    {
      count = 75,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 30
    },
    order = "d-a-a"
  },
  {
    type = "technology",
    name = "oil-processing",
    icon = "__base__/graphics/technology/oil-gathering.png",
    prerequisites = {"steel-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pumpjack"
      },
      {
        type = "unlock-recipe",
        recipe = "oil-refinery"
      },
      {
        type = "unlock-recipe",
        recipe = "chemical-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "basic-oil-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-light-oil"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-petroleum-gas"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-heavy-oil"
      },
      {
        type = "unlock-recipe",
        recipe = "lubricant"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 30
    },
    order = "d-a"
  },
  {
    type = "technology",
    name = "advanced-oil-processing",
    icon = "__base__/graphics/technology/oil-processing.png",
    prerequisites = {"oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-oil-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "heavy-oil-cracking"
      },
      {
        type = "unlock-recipe",
        recipe = "light-oil-cracking"
      }
    },
    unit =
    {
      count = 75,
      ingredients = {{"science-pack-1", 1},
                     {"science-pack-2", 1},
                     {"science-pack-3", 1}},
      time = 30
    },
    order = "d-b"
  },
  {
    type = "technology",
    name = "sulfur-processing",
    icon = "__base__/graphics/technology/sulfur-processing.png",
    prerequisites = {"oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "sulfuric-acid"
      },
      {
        type = "unlock-recipe",
        recipe = "sulfur"
      }
    },
    unit =
    {
      count = 150,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 30
    },
    order = "d-c"
  },
  {
    type = "technology",
    name = "plastics",
    icon = "__base__/graphics/technology/plastics.png",
    prerequisites = {"oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "plastic-bar"
      }
    },
    unit =
    {
      count = 200,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}},
      time = 30
    },
    order = "d-d"
  },
    {
    type = "technology",
    name = "modules",
    icon = "__base__/graphics/technology/module.png",
    prerequisites = {"advanced-electronics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "i-a"
  },
  {
    type = "technology",
    name = "speed-module",
    icon = "__base__/graphics/technology/speed-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "speed-module"
      }
    },
    prerequisites = {"modules"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "i-c-a"
  },
  {
    type = "technology",
    name = "speed-module-2",
    icon = "__base__/graphics/technology/speed-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "speed-module-2"
      }
    },
    prerequisites = {"speed-module"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "i-c-b"
  },
  {
    type = "technology",
    name = "speed-module-3",
    icon = "__base__/graphics/technology/speed-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "speed-module-3"
      }
    },
    prerequisites = {"speed-module-2"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "i-c-c"
  },
  {
    type = "technology",
    name = "productivity-module",
    icon = "__base__/graphics/technology/productivity-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "productivity-module"
      }
    },
    prerequisites = {"modules"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "i-e-a"
  },
  {
    type = "technology",
    name = "productivity-module-2",
    icon = "__base__/graphics/technology/productivity-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "productivity-module-2"
      }
    },
    prerequisites = {"productivity-module"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "i-e-b"
  },
  {
    type = "technology",
    name = "productivity-module-3",
    icon = "__base__/graphics/technology/productivity-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "productivity-module-3"
      }
    },
    prerequisites = {"productivity-module-2"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "i-e-c"
  },
  {
    type = "technology",
    name = "effectivity-module",
    icon = "__base__/graphics/technology/effectivity-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "effectivity-module"
      }
    },
    prerequisites = {"modules"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "i-g-a"
  },
  {
    type = "technology",
    name = "effectivity-module-2",
    icon = "__base__/graphics/technology/effectivity-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "effectivity-module-2"
      }
    },
    prerequisites = {"effectivity-module"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "i-g-b"
  },
  {
    type = "technology",
    name = "effectivity-module-3",
    icon = "__base__/graphics/technology/effectivity-module.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "effectivity-module-3"
      }
    },
    prerequisites = {"effectivity-module-2"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "i-g-c"
  },
  {
    type = "technology",
    name = "combat-robotics",
    icon = "__base__/graphics/technology/combat-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "defender-capsule"
      }
    },
    prerequisites = {"military-2"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "e-p-a"
  },
  {
    type = "technology",
    name = "combat-robotics-2",
    icon = "__base__/graphics/technology/combat-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "distractor-capsule"
      }
    },
    prerequisites = {"combat-robotics", "military-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "e-p-b-a"
  },
  {
    type = "technology",
    name = "combat-robotics-3",
    icon = "__base__/graphics/technology/combat-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "destroyer-capsule"
      }
    },
    prerequisites = {"combat-robotics-2", "speed-module"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    order = "e-p-b-b"
  },
  {
    type = "technology",
    name = "combat-robot-damage-1",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.1"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.1"
      }
    },
    prerequisites = {"combat-robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-c"
  },
  {
    type = "technology",
    name = "combat-robot-damage-2",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.15"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.15"
      }
    },
    prerequisites = {"combat-robot-damage-1"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-d"
  },
  {
    type = "technology",
    name = "combat-robot-damage-3",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.2"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.2"
      }
    },
    prerequisites = {"combat-robot-damage-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-e"
  },
  {
    type = "technology",
    name = "combat-robot-damage-4",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.25"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.25"
      }
    },
    prerequisites = {"combat-robot-damage-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"alien-science-pack", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-f"
  },
  {
    type = "technology",
    name = "combat-robot-damage-5",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = "0.3"
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = "0.3"
      }
    },
    prerequisites = {"combat-robot-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"alien-science-pack", 1},
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-g"
  },
    {
    type = "technology",
    name = "rocket-damage-1",
    icon = "__base__/graphics/technology/rocket-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = "0.1"
      }
    },
    prerequisites = {"rocketry", "alien-technology"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-a"
  },
  {
    type = "technology",
    name = "rocket-damage-2",
    icon = "__base__/graphics/technology/rocket-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = "0.1"
      }
    },
    prerequisites = {"rocket-damage-1"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-b"
  },
  {
    type = "technology",
    name = "rocket-damage-3",
    icon = "__base__/graphics/technology/rocket-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = "0.2"
      }
    },
    prerequisites = {"rocket-damage-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-c"
  },
  {
    type = "technology",
    name = "rocket-damage-4",
    icon = "__base__/graphics/technology/rocket-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = "0.2"
      }
    },
    prerequisites = {"rocket-damage-3"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-d"
  },
  {
    type = "technology",
    name = "rocket-damage-5",
    icon = "__base__/graphics/technology/rocket-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = "0.2"
      }
    },
    prerequisites = {"rocket-damage-4"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-e"
  },
  {
    type = "technology",
    name = "rocket-speed-1",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = "0.2"
      }
    },
    prerequisites = {"rocketry", "alien-technology"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-f"
  },
  {
    type = "technology",
    name = "rocket-speed-2",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = "0.2"
      }
    },
    prerequisites = {"rocket-speed-1"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-g"
  },
  {
    type = "technology",
    name = "rocket-speed-3",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = "0.3"
      }
    },
    prerequisites = {"rocket-speed-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-h"
  },
  {
    type = "technology",
    name = "rocket-speed-4",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = "0.3"
      }
    },
    prerequisites = {"rocket-speed-3"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-i"
  },
  {
    type = "technology",
    name = "rocket-speed-5",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = "0.3"
      }
    },
    prerequisites = {"rocket-speed-4"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-j"
  }
}
)

function createfollowerupgrade(level, pack1, pack2, pack3, alienpack, count, addition)
  local result =
  {
    type = "technology",
    name = "follower-robot-count-1",
    icon = "__base__/graphics/technology/follower-robots.png",
    effects =
    {
      {
        type = "maximum-following-robots-count",
        modifier = addition
      }
    },
    prerequisites = {"combat-robotics"},
    unit =
    {
      ingredients = {},
      time = 30
    },
    upgrade = true,
    order = "e-p-b-c"
  }
  result.name = "follower-robot-count-" .. level
  if level == 1 then
    result.prerequisites = {"combat-robotics"}
  else
    result.prerequisites = {"follower-robot-count-" .. (level - 1)}
    if level == 8 then
      result.prerequisites[#result.prerequisites + 1] = "combat-robotics-3"
    end
  end
  result.unit.count = count
  if pack1 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-1", pack1})
  end
  if pack2 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-2", pack2})
  end
  if pack3 ~= 0 then
    table.insert(result.unit.ingredients, {"science-pack-3", pack3})
  end
  if alienpack ~= 0 then
    table.insert(result.unit.ingredients, {"alien-science-pack", alienpack})
  end
  return result
end

 for i=1,2 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 0, 0, i * 50, 1)
})
end
 for i=3,5 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 1, 0, i * 50, 2)
})
end

for i=6,10 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 1, 1, 20*5 + (i - 5) * 20 * 5, 5)
})
end

for i=11,20 do
 data:extend(
{
  createfollowerupgrade(i, 1, 1, 1, 1, 20 * 5 + 5 * 20 * 5 + (i - 10) * 20 * 10, 10)
})
end

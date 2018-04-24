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
      },
      {
        type = "unlock-recipe",
        recipe = "military-science-pack"
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
    name = "uranium-ammo",
    icon = "__base__/graphics/technology/uranium-ammo.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "uranium-rounds-magazine"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-cannon-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "explosive-uranium-cannon-shell"
      }
    },
    prerequisites = {"nuclear-power", "military-3"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 45
    },
    order = "e-a-b"
  },
  {
    type = "technology",
    name = "atomic-bomb",
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "atomic-bomb"
      }
    },
    prerequisites = {"nuclear-power", "military-4", "rocketry"},
    unit =
    {
      count = 5000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 45
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
    prerequisites = {"laser", "military-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1},
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
        modifier = 0.2
      }
    },
    prerequisites = {"military-2"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      }
    },
    prerequisites = {"grenade-damage-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
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
        {"military-science-pack", 1}
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
        modifier = 0.2
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
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
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
        {"military-science-pack", 1},
      },
      time = 45
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "grenade-damage-6",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.2
      }
    },
    prerequisites = {"grenade-damage-5"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "e-n-a"
  },
  {
    type = "technology",
    name = "grenade-damage-7",
    icon = "__base__/graphics/technology/grenade-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.2
      }
    },
    prerequisites = {"grenade-damage-6"},
    unit =
    {
      count_formula = "2^(L-6)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 45
    },
    upgrade = true,
    max_level = "infinite",
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
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1},
        {"military-science-pack", 1},
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
      count = 80,
      ingredients = {{"science-pack-1", 1}},
      time = 5
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
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
      },
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
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
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
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    order = "e-e"
  },
  {
    type = "technology",
    name = "flamethrower",
    icon = "__base__/graphics/technology/flamethrower.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "flamethrower"
      },
      {
        type = "unlock-recipe",
        recipe = "flamethrower-ammo"
      },
      {
        type = "unlock-recipe",
        recipe = "flamethrower-turret"
      }
    },
    prerequisites = {"flammables", "military-2"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
      },
      time = 30
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
      },
      {
        type = "unlock-recipe",
        recipe = "programmable-speaker"
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
        recipe = "science-pack-3"
      }
    },
    prerequisites = {"electronics", "plastics"},
    unit =
    {
      count = 200,
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
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "processing-unit"
      },
      {
        type = "unlock-recipe",
        recipe = "high-tech-science-pack"
      }
    },
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
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
        recipe = "locomotive"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon"
      }
    },
    prerequisites = {"logistics-2", "engine"},
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
    order = "c-g-a",
  },
  {
    type = "technology",
    name = "fluid-wagon",
    icon = "__base__/graphics/technology/fluid-wagon.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fluid-wagon"
      }
    },
    prerequisites = {"railway", "fluid-handling"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-g-a-b",
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
      }
    },
    prerequisites = {"railway"},
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
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-g-c",
  },
  {
    type = "technology",
    name = "braking-force-1",
    icon = "__base__/graphics/technology/braking-force.png",
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.1
      }
    },
    prerequisites = {"railway"},
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
    order = "b-f-a"
  },
  {
    type = "technology",
    name = "braking-force-2",
    icon = "__base__/graphics/technology/braking-force.png",
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-1"},
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
    order = "b-f-b"
  },
  {
    type = "technology",
    name = "braking-force-3",
    icon = "__base__/graphics/technology/braking-force.png",
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-2", "logistics-3"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "b-f-c"
  },
  {
    type = "technology",
    name = "braking-force-4",
    icon = "__base__/graphics/technology/braking-force.png",
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-3"},
    unit =
    {
      count = 350,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "b-f-d"
  },
  {
    type = "technology",
    name = "braking-force-5",
    icon = "__base__/graphics/technology/braking-force.png",
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-4"},
    unit =
    {
      count = 450,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
      },
      time = 35
    },
    upgrade = true,
    order = "b-f-e"
  },
  {
    type = "technology",
    name = "braking-force-6",
    icon = "__base__/graphics/technology/braking-force.png",
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-5"},
    unit =
    {
      count = 550,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 45
    },
    upgrade = true,
    order = "b-f-f"
  },
  {
    type = "technology",
    name = "braking-force-7",
    icon = "__base__/graphics/technology/braking-force.png",
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-6"},
    unit =
    {
      count = 650,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "b-f-g"
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
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
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
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
      },
      time = 30
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
      count = 200,
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
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
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
    prerequisites = {"electronics", "flammables", "explosives", "military-2"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
    prerequisites = {"rocketry", "military-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    order = "e-h"
  },
  {
    type = "technology",
    name = "heavy-armor",
    icon = "__base__/graphics/technology/armor-making.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "heavy-armor"
      }
    },
    prerequisites = {"military", "steel-processing"},
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
    name = "modular-armor",
    icon = "__base__/graphics/technology/armor-making.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "modular-armor"
      }
    },
    prerequisites = {"heavy-armor", "modules"},
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
    prerequisites = {"modular-armor", "electric-engine"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    order = "g-c-a"
  },
  {
    type = "technology",
    name = "power-armor-2",
    icon = "__base__/graphics/technology/power-armor-mk2.png",
    localised_description = {"technology-description.power-armor-2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "power-armor-mk2"
      }
    },
    prerequisites = {"power-armor", "speed-module-3", "effectivity-module-3"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
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
    prerequisites = {"turrets", "laser", "battery", "military-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
    prerequisites = {"stone-walls", "military-2"},
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
    prerequisites = {"electric-engine"},
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
    prerequisites = {"electric-engine", "battery"},
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
  --[[
  {
    type = "technology",
    name = "alien-technology",
    icon = "__base__/graphics/technology/alien-technology.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "military-science-pack"
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
  }, ]]--
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
    prerequisites = {"advanced-electronics-2", "rocket-speed-5", "speed-module-3", "productivity-module-3"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
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
      count = 200,
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
    name = "research-speed-5",
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.5
      }
    },
    prerequisites = {"research-speed-4"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "c-m-d"
  },
  {
    type = "technology",
    name = "research-speed-6",
    icon = "__base__/graphics/technology/research-speed.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.6
      }
    },
    prerequisites = {"research-speed-5"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
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
    localised_name = {"technology-name.electric-energy-accumulators-1"},
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
      count = 150,
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
      },
      {
        type = "unlock-recipe",
        recipe = "production-science-pack"
      }
    },
    prerequisites = {"advanced-material-processing", "advanced-electronics"},
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
    order = "c-c-b"
  },
  {
    type = "technology",
    name = "concrete",
    icon = "__base__/graphics/technology/concrete.png",
    prerequisites = {"advanced-material-processing"},
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
        {"high-tech-science-pack", 1}
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
      },
      {
        type = "unlock-recipe",
        recipe = "pump"
      }
    },
    order = "b-a"
  },
  {
    type = "technology",
    name = "electric-engine",
    icon = "__base__/graphics/technology/electric-engine.png",
    prerequisites = {"engine", "advanced-electronics"},
    unit =
    {
      count = 100,
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
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "battery"
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
      time = 30
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
        modifier = 60 * 60 * 60
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
        recipe = "logistic-chest-storage"
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
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
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
        modifier = 0.35
      }
    },
    prerequisites = {"robotics"},
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
        modifier = 0.4
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
        modifier = 0.45
      }
    },
    prerequisites = {"worker-robots-speed-2"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
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
        modifier = 0.55
      }
    },
    prerequisites = {"worker-robots-speed-3"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
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
        modifier = 0.65
      }
    },
    prerequisites = {"worker-robots-speed-4"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "worker-robots-speed-6",
    icon = "__base__/graphics/technology/worker-robots-speed.png",
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.65
      }
    },
    prerequisites = {"worker-robots-speed-5"},
    unit =
    {
      count_formula = "2^(L-6)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
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
        modifier = 1
      }
    },
    prerequisites = {"robotics"},
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
        modifier = 1
      }
    },
    prerequisites = {"worker-robots-storage-1"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
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
        modifier = 1
      }
    },
    prerequisites = {"worker-robots-storage-2"},
    unit =
    {
      count = 450,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
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
        modifier = 6
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
        modifier = 6
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
        modifier = 6
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
        modifier = 6
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
        {"production-science-pack", 1}
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
        modifier = 6
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
        {"production-science-pack", 1}
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
        modifier = 6
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
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
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
        modifier = 6
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
        modifier = 6
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
    name = "auto-character-logistic-trash-slots",
    icon = "__base__/graphics/technology/character-auto-logistic-trash-slots.png",
    effects =
    {
      {
        type = "auto-character-logistic-trash-slots",
        modifier = true
      }
    },
    prerequisites = {"character-logistic-trash-slots-2"},
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
    order = "c-k-f-c"
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
        modifier = 0.1
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
        modifier = 0.1
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
        modifier = 0.2
      }
    },
    prerequisites = {"shotgun-shell-damage-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      }
    },
    prerequisites = {"shotgun-shell-damage-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      }
    },
    prerequisites = {"shotgun-shell-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.4
      }
    },
    prerequisites = {"shotgun-shell-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-f"
  },
  {
    type = "technology",
    name = "shotgun-shell-damage-7",
    icon = "__base__/graphics/technology/shotgun-shell-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.4
      }
    },
    prerequisites = {"shotgun-shell-damage-6"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
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
        modifier = 0.1
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
        modifier = 0.2
      }
    },
    prerequisites = {"shotgun-shell-speed-1"},
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
    name = "shotgun-shell-speed-3",
    icon = "__base__/graphics/technology/shotgun-shell-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.3
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
        modifier = 0.3
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
        {"military-science-pack", 1}
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
        modifier = 0.3
      }
    },
    prerequisites = {"shotgun-shell-speed-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.4
      }
    },
    prerequisites = {"shotgun-shell-speed-5"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
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
        modifier = 0.1
      }
    },
    prerequisites = {"laser-turrets"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.1
      }
    },
    prerequisites = {"laser-turret-damage-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.3
      }
    },
    prerequisites = {"laser-turret-damage-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.3
      }
    },
    prerequisites = {"laser-turret-damage-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.3
      }
    },
    prerequisites = {"laser-turret-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
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
        modifier = 0.5
      }
    },
    prerequisites = {"laser-turret-damage-5"},
    unit =
    {
      count = 350,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-f"
  },
  {
    type = "technology",
    name = "laser-turret-damage-7",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.7
      }
    },
    prerequisites = {"laser-turret-damage-6"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-g"
  },
  {
    type = "technology",
    name = "laser-turret-damage-8",
    icon = "__base__/graphics/technology/laser-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.7
      }
    },
    prerequisites = {"laser-turret-damage-7"},
    unit =
    {
      count_formula = "2^(L-8)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-n-g"
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
        modifier = 0.1
      }
    },
    prerequisites = {"laser-turrets"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-h"
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
        modifier = 0.2
      }
    },
    prerequisites = {"laser-turret-speed-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-i"
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
        modifier = 0.3
      }
    },
    prerequisites = {"laser-turret-speed-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-j"
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
        modifier = 0.3
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
        {"science-pack-3", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-k"
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
        modifier = 0.4
      }
    },
    prerequisites = {"laser-turret-speed-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-l"
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
        modifier = 0.4
      }
    },
    prerequisites = {"laser-turret-speed-5"},
    unit =
    {
      count = 350,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-m"
  },
  {
    type = "technology",
    name = "laser-turret-speed-7",
    icon = "__base__/graphics/technology/laser-turret-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser-turret",
        modifier = 0.5
      }
    },
    prerequisites = {"laser-turret-speed-6"},
    unit =
    {
      count = 450,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-n"
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
        modifier = 0.1
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
        modifier = 0.1
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
        modifier = 0.2
      }
    },
    prerequisites = {"gun-turret-damage-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      }
    },
    prerequisites = {"gun-turret-damage-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      }
    },
    prerequisites = {"gun-turret-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.4
      }
    },
    prerequisites = {"gun-turret-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-o-f"
  },
  {
    type = "technology",
    name = "gun-turret-damage-7",
    icon = "__base__/graphics/technology/gun-turret-damage.png",
    effects =
    {
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.7
      }
    },
    prerequisites = {"gun-turret-damage-6"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
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
        ammo_category = "flamethrower",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.2
      }
    },
    prerequisites = {"flamethrower"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1},
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
        ammo_category = "flamethrower",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.2
      }
    },
    prerequisites = {"flamethrower-damage-1"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1},
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
        ammo_category = "flamethrower",
        modifier = 0.3
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.3
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
        {"science-pack-3", 1},
        {"military-science-pack", 1},
      },
      time = 60
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
        ammo_category = "flamethrower",
        modifier = 0.3
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.3
      }
    },
    prerequisites = {"flamethrower-damage-3"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
      },
      time = 60
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
        ammo_category = "flamethrower",
        modifier = 0.4
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.4
      }
    },
    prerequisites = {"flamethrower-damage-4"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
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
        ammo_category = "flamethrower",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.2
      }
    },
    prerequisites = {"flamethrower-damage-5"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-o-p-f"
  },
  {
    type = "technology",
    name = "flamethrower-damage-7",
    icon = "__base__/graphics/technology/flamethrower-turret-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.2
      }
    },
    prerequisites = {"flamethrower-damage-6"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-o-p-f"
  },
  {
    type = "technology",
    name = "energy-shield-equipment",
    icon = "__base__/graphics/technology/energy-shield-equipment.png",
    prerequisites = {"modular-armor"},
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
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
      },
      time = 15
    },
    order = "g-e-a"
  },
  {
    type = "technology",
    name = "night-vision-equipment",
    icon = "__base__/graphics/technology/night-vision-equipment.png",
    prerequisites = {"modular-armor"},
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
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    order = "g-e-b"
  },
  {
    type = "technology",
    name = "battery-equipment",
    icon = "__base__/graphics/technology/battery-equipment.png",
    prerequisites = {"modular-armor", "battery"},
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
    prerequisites = {"modular-armor"},
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
    prerequisites = {"modular-armor", "laser-turrets"},
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
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    order = "g-m"
  },
  {
    type = "technology",
    name = "discharge-defense-equipment",
    icon = "__base__/graphics/technology/discharge-defense-equipment.png",
    prerequisites = {"modular-armor", "laser-turrets"},
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
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
      },
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
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
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
    name = "personal-roboport-equipment-2",
    icon = "__base__/graphics/technology/personal-roboport-equipment.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "personal-roboport-mk2-equipment"
      },
    },
    prerequisites = { "personal-roboport-equipment" },
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1},
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
        modifier = 0.1
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
        modifier = 0.1
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
        modifier = 0.2
      }
    },
    prerequisites = {"bullet-damage-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      }
    },
    prerequisites = {"bullet-damage-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      }
    },
    prerequisites = {"bullet-damage-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.4
      }
    },
    prerequisites = {"bullet-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-f"
  },
  {
    type = "technology",
    name = "bullet-damage-7",
    icon = "__base__/graphics/technology/bullet-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.4
      }
    },
    prerequisites = {"bullet-damage-6"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
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
        modifier = 0.1
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
        modifier = 0.2
      }
    },
    prerequisites = {"bullet-speed-1"},
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
        modifier = 0.2
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
        modifier = 0.3
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
        {"military-science-pack", 1}
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
        modifier = 0.3
      }
    },
    prerequisites = {"bullet-speed-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.4
      }
    },
    prerequisites = {"bullet-speed-5"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
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
    prerequisites = {"steel-processing", "automation-2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "empty-barrel"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}},
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
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "d-b"
  },
  {
    type = "technology",
    name = "coal-liquefaction",
    icon = "__base__/graphics/technology/coal-liquefaction.png",
    prerequisites = {"advanced-oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "coal-liquefaction"
      }
    },
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    order = "d-c"
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
    order = "d-d"
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
    order = "d-e"
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
        {"high-tech-science-pack", 1}
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
        {"production-science-pack", 1}
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
        {"high-tech-science-pack", 1}
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
    prerequisites = {"military-2", "flying"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        {"science-pack-3", 1},
        {"military-science-pack", 1},
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
    prerequisites = {"military-4", "combat-robotics-2", "speed-module"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1}
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
        modifier = 0.1
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.1
      }
    },
    prerequisites = {"combat-robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.15
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.15
      }
    },
    prerequisites = {"combat-robot-damage-1"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"military-science-pack", 1}
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
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.2
      }
    },
    prerequisites = {"combat-robot-damage-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.25
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.25
      }
    },
    prerequisites = {"combat-robot-damage-3"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1}
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
        modifier = 0.3
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.3
      }
    },
    prerequisites = {"combat-robot-damage-4"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-p-g"
  },
  {
    type = "technology",
    name = "combat-robot-damage-6",
    icon = "__base__/graphics/technology/combat-robot-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.3
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.3
      }
    },
    prerequisites = {"combat-robot-damage-5"},
    unit =
    {
      count_formula = "2^(L-6)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30
    },
    max_level = "infinite",
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
        modifier = 0.2
      }
    },
    prerequisites = {"rocketry"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"military-science-pack", 1},
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
        modifier = 0.2
      }
    },
    prerequisites = {"rocket-damage-1"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"military-science-pack", 1},
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
        modifier = 0.3
      }
    },
    prerequisites = {"rocket-damage-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"military-science-pack", 1},
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
        modifier = 0.3
      }
    },
    prerequisites = {"rocket-damage-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"military-science-pack", 1},
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
        modifier = 0.3
      }
    },
    prerequisites = {"rocket-damage-4"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
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
    name = "rocket-damage-6",
    icon = "__base__/graphics/technology/rocket-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.5
      }
    },
    prerequisites = {"rocket-damage-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-f"
  },
  {
    type = "technology",
    name = "rocket-damage-7",
    icon = "__base__/graphics/technology/rocket-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.5
      }
    },
    prerequisites = {"rocket-damage-6"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-j-f"
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
        modifier = 0.3
      }
    },
    prerequisites = {"rocketry"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"military-science-pack", 1},
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
    name = "rocket-speed-2",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.3
      }
    },
    prerequisites = {"rocket-speed-1"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-h"
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
        modifier = 0.4
      }
    },
    prerequisites = {"rocket-speed-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"military-science-pack", 1},
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
    name = "rocket-speed-4",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.4
      }
    },
    prerequisites = {"rocket-speed-3"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-k"
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
        modifier = 0.4
      }
    },
    prerequisites = {"rocket-speed-4"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-l"
  },
  {
    type = "technology",
    name = "rocket-speed-6",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.6
      }
    },
    prerequisites = {"rocket-speed-5"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-m"
  },
  {
    type = "technology",
    name = "rocket-speed-7",
    icon = "__base__/graphics/technology/rocket-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 1
      }
    },
    prerequisites = {"rocket-speed-6"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-j-n"
  },

  {
    type = "technology",
    name = "cannon-shell-damage-1",
    icon = "__base__/graphics/technology/cannon-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 0.2
      }
    },
    prerequisites = {"tanks"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-a"
  },
  {
    type = "technology",
    name = "cannon-shell-damage-2",
    icon = "__base__/graphics/technology/cannon-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 0.2
      }
    },
    prerequisites = {"cannon-shell-damage-1"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-b"
  },
  {
    type = "technology",
    name = "cannon-shell-damage-3",
    icon = "__base__/graphics/technology/cannon-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 0.3
      }
    },
    prerequisites = {"cannon-shell-damage-2"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-c"
  },
  {
    type = "technology",
    name = "cannon-shell-damage-4",
    icon = "__base__/graphics/technology/cannon-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 0.5
      }
    },
    prerequisites = {"cannon-shell-damage-3"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-d"
  },
  {
    type = "technology",
    name = "cannon-shell-damage-5",
    icon = "__base__/graphics/technology/cannon-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 1
      }
    },
    prerequisites = {"cannon-shell-damage-4"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-d"
  },
  {
    type = "technology",
    name = "cannon-shell-damage-6",
    icon = "__base__/graphics/technology/cannon-damage.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 1
      }
    },
    prerequisites = {"cannon-shell-damage-5"},
    unit =
    {
      count_formula = "2^(L-5)*1000",
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-k-d"
  },
  {
    type = "technology",
    name = "cannon-shell-speed-1",
    icon = "__base__/graphics/technology/cannon-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.2
      }
    },
    prerequisites = {"tanks"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-g"
  },
  {
    type = "technology",
    name = "cannon-shell-speed-2",
    icon = "__base__/graphics/technology/cannon-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.2
      }
    },
    prerequisites = {"cannon-shell-speed-1"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-h"
  },
  {
    type = "technology",
    name = "cannon-shell-speed-3",
    icon = "__base__/graphics/technology/cannon-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.3
      }
    },
    prerequisites = {"cannon-shell-speed-2"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-i"
  },
  {
    type = "technology",
    name = "cannon-shell-speed-4",
    icon = "__base__/graphics/technology/cannon-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.6
      }
    },
    prerequisites = {"cannon-shell-speed-3"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-j"
  },
  {
    type = "technology",
    name = "cannon-shell-speed-5",
   icon = "__base__/graphics/technology/cannon-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 1
      }
    },
    prerequisites = {"cannon-shell-speed-4"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"military-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-k-k"
  }
}
)

function create_follower_upgrade(level, pack1, pack2, pack3, military_pack, high_tech_pack, production_pack, count, addition)
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
    if level == 5 then
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
  if military_pack ~= 0 then
    table.insert(result.unit.ingredients, {"military-science-pack", military_pack})
  end
  if high_tech_pack ~= 0 then
    table.insert(result.unit.ingredients, {"high-tech-science-pack", high_tech_pack})
  end
  if production_pack ~= 0 then
    table.insert(result.unit.ingredients, {"production-science-pack", production_pack})
  end
  return result
end

 data:extend(
{
  create_follower_upgrade(1, 1, 1, 0, 1, 0, 0, 300, 4),
  create_follower_upgrade(2, 1, 1, 0, 1, 0, 0, 400, 5),

  create_follower_upgrade(3, 1, 1, 1, 1, 0, 0, 500, 10),
  create_follower_upgrade(4, 1, 1, 1, 1, 0, 0, 600, 10),

  create_follower_upgrade(5, 1, 1, 1, 1, 1, 0, 800, 10),
  create_follower_upgrade(6, 1, 1, 1, 1, 1, 0, 1000, 10)
})

data:extend(
{
  {
    type = "technology",
    name = "follower-robot-count-7",
    icon = "__base__/graphics/technology/follower-robots.png",
    effects =
    {
      {
        type = "maximum-following-robots-count",
        modifier = 10
      }
    },
    prerequisites = {"follower-robot-count-6"},
    unit =
    {
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30,
      count_formula = "100(L-6)+900"
    },
    level = 14,
    max_level = "infinite",
    upgrade = true,
    order = "e-p-b-c"
  },
  {
    type = "technology",
    name = "nuclear-power",
    icon = "__base__/graphics/technology/nuclear-power.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nuclear-reactor"
      },
      {
        type = "unlock-recipe",
        recipe = "centrifuge"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-fuel-cell"
      },
      {
        type = "unlock-recipe",
        recipe = "heat-exchanger"
      },
      {
        type = "unlock-recipe",
        recipe = "heat-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-turbine"
      }
    },
    prerequisites = {"advanced-electronics", "concrete"},
    unit =
    {
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30,
      count = 1000
    },
    order = "e-p-b-c"
  },
  {
    type = "technology",
    name = "kovarex-enrichment-process",
    icon = "__base__/graphics/technology/kovarex-enrichment-process.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "kovarex-enrichment-process"
      }
    },
    prerequisites = {"nuclear-power"},
    unit =
    {
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 30,
      count = 1500
    },
    order = "e-p-b-c"
  },
  {
    type = "technology",
    name = "nuclear-fuel-reprocessing",
    icon = "__base__/graphics/technology/nuclear-fuel-reprocessing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nuclear-fuel-reprocessing"
      }
    },
    prerequisites = {"nuclear-power"},
    unit =
    {
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 1500
    },
    order = "e-p-b-c"
  }
}
)

data:extend(
{
  {
    type = "technology",
    name = "mining-productivity-1",
    icon = "__base__/graphics/technology/mining-productivity.png",
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.02
      }
    },
    prerequisites = {"advanced-electronics"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = "3",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "mining-productivity-4",
    icon = "__base__/graphics/technology/mining-productivity.png",
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.02
      }
    },
    prerequisites = {"mining-productivity-1"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = "7",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "mining-productivity-8",
    icon = "__base__/graphics/technology/mining-productivity.png",
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.02
      }
    },
    prerequisites = {"mining-productivity-4"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = "11",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "mining-productivity-12",
    icon = "__base__/graphics/technology/mining-productivity.png",
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.02
      }
    },
    prerequisites = {"mining-productivity-8"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = "15",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "mining-productivity-16",
    icon = "__base__/graphics/technology/mining-productivity.png",
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.02
      }
    },
    prerequisites = {"mining-productivity-12"},
    unit =
    {
      count_formula = "100(L-1)",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "c-k-f-e"
  }
}
)

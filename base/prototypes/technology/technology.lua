data:extend(
{
  {
    type = "technology",
    name = "iron-working",
    icon = "__base__/graphics/technology/iron-working.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "iron-chest"
      }
    },
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 5
    }
  },
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
    prerequisites = {"iron-working"},
    unit =
    {
      count = 20,
      ingredients = {{"science-pack-1", 1}},
      time = 5
    }
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
      }
    },
    prerequisites = {"iron-working"},
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "military-2",
    icon = "__base__/graphics/technology/military.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "piercing-bullet-magazine"
      }
    },
    prerequisites = {"military"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    }
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
    prerequisites = {"iron-working"},
    unit =
    {
      count = 15,
      ingredients = {{"science-pack-1", 1}},
      time = 10
    }
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
    }
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
    }
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
    prerequisites = {"electronics", "modules"},
    unit =
    {
      count = 100,
      ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
      time = 60
    }
  },
  {
    type = "technology",
    name = "chemistry",
    icon = "__base__/graphics/technology/chemistry.png",
    unit =
    {
      count = 40,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "advanced-chemistry",
    icon = "__base__/graphics/technology/advanced-chemistry.png",
    prerequisites = {"chemistry"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 25
    }
  },
  {
    type = "technology",
    name = "explosives",
    icon = "__base__/graphics/technology/explosives.png",
    prerequisites = {"chemistry"},
    unit =
    {
      count = 60,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "flammables",
    icon = "__base__/graphics/technology/flammables.png",
    prerequisites = {"chemistry"},
    unit =
    {
      count = 60,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    }
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
    }
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
    }
  },
  {
    type = "technology",
    name = "advanced-electronics",
    icon = "__base__/graphics/technology/advanced-electronics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "smart-inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "smart-chest"
      },
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
        recipe = "science-pack-3"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-circuit"
      }
    },
    prerequisites = {"electronics"},
    unit =
    {
      count = 40,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "advanced-electronics-2",
    icon = "__base__/graphics/technology/advanced-electronics.png",
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
    }
  },
  {
    type = "technology",
    name = "logistics",
    icon = "__base__/graphics/technology/logistics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-transport-belt-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "basic-splitter"
      }
    },
    prerequisites = {"iron-working"},
    unit =
    {
      count = 20,
      ingredients = {{"science-pack-1", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "railway",
    icon = "__base__/graphics/technology/railway.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "straight-rail"
      },
      {
        type = "unlock-recipe",
        recipe = "curved-rail"
      },
      {
        type = "unlock-recipe",
        recipe = "diesel-locomotive"
      }
    },
    prerequisites = {"logistics-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 20
    }
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
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 20
    }
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
    }
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
      }
    },
    prerequisites = {"logistics-3"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 20
    }
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
        recipe = "fast-transport-belt-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-splitter"
      }
    },
    prerequisites = {"logistics"},
    unit =
    {
      count = 40,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
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
        recipe = "express-transport-belt-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "express-splitter"
      }
    },
    prerequisites = {"logistics-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 15
    }
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
    }
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
    prerequisites = {"optics", "advanced-electronics"},
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
    }
  },
  {
    type = "technology",
    name = "laser",
    icon = "__base__/graphics/technology/laser.png",
    prerequisites = {"optics", "advanced-electronics"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
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
      count = 80,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "armor-making",
    icon = "__base__/graphics/technology/armor-making.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-armor"
      }
    },
    prerequisites = {"iron-working"},
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 5
    }
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
    }
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
    prerequisites = {"iron-working"},
    unit =
    {
      count = 10,
      ingredients = {{"science-pack-1", 1}},
      time = 10
    }
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
    prerequisites = {"turrets", "laser"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "flying",
    icon = "__base__/graphics/technology/flying.png",
    prerequisites = {"rocketry", "advanced-electronics"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "robotics",
    icon = "__base__/graphics/technology/robotics.png",
    prerequisites = {"advanced-electronics-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
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
    prerequisites = {"advanced-chemistry"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "rocket-defense",
    icon = "__base__/graphics/technology/rocket-defense.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-defense"
      }
    },
    prerequisites = {"rocketry", "advanced-electronics-2", "rocket-speed-5"},
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
    }
  },
  {
    type = "technology",
    name = "research-effectivity-1",
    icon = "__base__/graphics/technology/research-effectivity.png",
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
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = "true"
  },
  {
    type = "technology",
    name = "research-effectivity-2",
    icon = "__base__/graphics/technology/research-effectivity.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.3
      }
    },
    prerequisites = {"research-effectivity-1"},
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "research-effectivity-3",
    icon = "__base__/graphics/technology/research-effectivity.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.4
      }
    },
    prerequisites = {"research-effectivity-2"},
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "research-effectivity-4",
    icon = "__base__/graphics/technology/research-effectivity.png",
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.5
      }
    },
    prerequisites = {"research-effectivity-3"},
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
    upgrade = "true"
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
      }
    },
    prerequisites = {"electronics"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "electric-energy-distribution-2",
    icon = "__base__/graphics/technology/electric-energy-distribution.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "big-electric-pole"
      },
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
    }
  },
  {
    type = "technology",
    name = "electric-energy-accumulators-1",
    icon = "__base__/graphics/technology/electric-energy-acumulators.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-accumulator"
      }
    },
    prerequisites = {"electric-energy-distribution-1"},
    unit =
    {
      count = 60,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "inserter-stack-size-bonus-1",
    icon = "__base__/graphics/technology/inserter-stack-size-bonus.png",
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"logistics"},
    unit =
    {
      count = 60,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    upgrade = "true"
  },
  {
    type = "technology",
    name = "inserter-stack-size-bonus-2",
    icon = "__base__/graphics/technology/inserter-stack-size-bonus.png",
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"inserter-stack-size-bonus-1"},
    unit =
    {
      count = 60,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = "true"
  },
  {
    type = "technology",
    name = "inserter-stack-size-bonus-3",
    icon = "__base__/graphics/technology/inserter-stack-size-bonus.png",
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"inserter-stack-size-bonus-2"},
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "inserter-stack-size-bonus-4",
    icon = "__base__/graphics/technology/inserter-stack-size-bonus.png",
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"inserter-stack-size-bonus-3"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 2}
      },
      time = 30
    },
    upgrade = "true"
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
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    }
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
    prerequisites = {"advanced-material-processing"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "effect-transmission",
    icon = "__base__/graphics/technology/effect-transmission.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-beacon"
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
      time = 100
    }
  }
}
)

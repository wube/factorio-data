data:extend(
{
  {
    type = "technology",
    name = "combat-robotics",
    icon = "__base__/graphics/technology/combat-robotics.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "small-combat-robot-capsule"
      }
    },
    prerequisites = {
      "robotics",
      "military-3",
    },
    unit = {
      count = 150,
      ingredients = {
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
    effects = {
      {
        type = "unlock-recipe",
        recipe = "big-combat-robot-capsule"
      }
    },
    prerequisites = {
      "combat-robotics",
    },
    unit = {
      count = 200,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "e-p-b"
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
    upgrade = "true",
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
    upgrade = "true",
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
    upgrade = "true",
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
        {"science-pack-1", 1},
      },
      time = 30
    },
    upgrade = "true",
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
        {"science-pack-1", 1},
      },
      time = 30
    },
    upgrade = "true",
    order = "e-p-g"
  }
})

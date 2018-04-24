data:extend(
{
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
        modifier = 60 * 60 * 5
      }
    },
    prerequisites = {"robotics", "flying"},
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
        recipe = "deconstruction-planner"
      },
      {
        type = "ghost-time-to-live",
        modifier = 60 * 60 * 5
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
    prerequisites = {
      "robotics",
      "flying"
    },
    unit = {
      count = 50,
      ingredients = {
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
    unit = {
      count = 150,
      ingredients = {
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
    name = "logistic-robot-speed-1",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.35"
      }
    },
    prerequisites = {
      "logistic-robotics"
    },
    unit = {
      count = 50,
      ingredients = {
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
    name = "logistic-robot-speed-2",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.4"
      }
    },
    prerequisites = {
      "logistic-robot-speed-1"
    },
    unit = {
      count = 100,
      ingredients = {
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
    name = "logistic-robot-speed-3",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.45"
      }
    },
    prerequisites = {
      "logistic-robot-speed-2"
    },
    unit = {
      count = 150,
      ingredients = {
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
    name = "logistic-robot-speed-4",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.55"
      }
    },
    prerequisites = {
      "logistic-robot-speed-3"
    },
    unit = {
      count = 250,
      ingredients = {
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
    name = "logistic-robot-speed-5",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.65"
      }
    },
    prerequisites = {
      "logistic-robot-speed-4"
    },
    unit = {
      count = 500,
      ingredients = {
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
    name = "logistic-robot-storage-1",
    icon = "__base__/graphics/technology/logistic-robot-storage.png",
    effects = {
      {
        type = "logistic-robot-storage",
        modifier = "1"
      }
    },
    prerequisites = {
      "logistic-robotics"
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
    upgrade = true,
    order = "c-k-g-a"
  },
  {
    type = "technology",
    name = "logistic-robot-storage-2",
    icon = "__base__/graphics/technology/logistic-robot-storage.png",
    effects = {
      {
        type = "logistic-robot-storage",
        modifier = "1"
      }
    },
    prerequisites = {
      "logistic-robot-storage-1"
    },
    unit = {
      count = 300,
      ingredients = {
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
    name = "logistic-robot-storage-3",
    icon = "__base__/graphics/technology/logistic-robot-storage.png",
    effects = {
      {
        type = "logistic-robot-storage",
        modifier = "1"
      }
    },
    prerequisites = {
      "logistic-robot-storage-2"
    },
    unit = {
      count = 450,
      ingredients = {
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
}
)

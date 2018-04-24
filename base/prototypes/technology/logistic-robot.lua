data:extend(
{
  {
    type = "technology",
    name = "logistic-robotics",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-provider"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-storage"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-requester"
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
      count = 150,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "logistic-robot-speed-1",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.3"
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "logistic-robot-speed-2",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.35"
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "logistic-robot-speed-3",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.4"
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "logistic-robot-speed-4",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.5"
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
    upgrade = "true"
  },
  {
    type = "technology",
    name = "logistic-robot-speed-5",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.6"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
    upgrade = "true"
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
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = "true"
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
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = "true"
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
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 30
    },
    upgrade = "true"
  }
}
)

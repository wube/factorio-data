data:extend(
{
  {
    type = "technology",
    name = "stack-inserter",
    icon = "__base__/graphics/technology/stack-inserter.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "stack-inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "stack-filter-inserter"
      },
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 1
      }
    },
    prerequisites = {"logistics-2", "advanced-electronics"},
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
    order = "c-o-a",
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-1",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    effects =
    {
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 1 -- result of 3
      }
    },
    prerequisites = {"stack-inserter"},
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
    order = "c-o-b",
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-2",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1 -- result of 2
      },
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 1 -- result of 4
      }
    },
    prerequisites = {"inserter-capacity-bonus-1"},
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
    upgrade = true,
    order = "c-o-c",
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-3",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    effects =
    {
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 1 -- result of 5
      }
    },
    prerequisites = {"inserter-capacity-bonus-2"},
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
    order = "c-o-d"
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-4",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    effects =
    {
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 1 -- result of 6
      }
    },
    prerequisites = {"inserter-capacity-bonus-3"},
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
    order = "c-o-e"
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-5",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    effects =
    {
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 2 -- result of 8
      }
    },
    prerequisites = {"inserter-capacity-bonus-4"},
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
      time = 30
    },
    upgrade = true,
    order = "c-o-f"
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-6",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    effects =
    {
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 2 -- result of 10
      }
    },
    prerequisites = {"inserter-capacity-bonus-5"},
    unit =
    {
      count = 400,
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
    order = "c-o-g"
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-7",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1 -- result of 3
      },
      {
        type = "stack-inserter-capacity-bonus",
        modifier = 2 -- result of 12
      }
    },
    prerequisites = {"inserter-capacity-bonus-6"},
    unit =
    {
      count = 600,
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
    order = "c-o-h"
  }
})
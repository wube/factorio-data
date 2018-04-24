data:extend(
{
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
  }
}
)

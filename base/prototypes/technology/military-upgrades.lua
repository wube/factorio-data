data:extend(
{
  {
    type = "technology",
    name = "physical-projectile-damage-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.2
      }
    },
    prerequisites = {"physical-projectile-damage-2"},
    unit =
    {
      count = 100*3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-c"
  },
  {
    type = "technology",
    name = "physical-projectile-damage-4",
    icon_size = 128,
    icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.2
      }
    },
    prerequisites = {"physical-projectile-damage-3"},
    unit =
    {
      count = 100*4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-d"
  },
  {
    type = "technology",
    name = "physical-projectile-damage-5",
    icon_size = 128,
    icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.2
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 0.9
      }
    },
    prerequisites = {"physical-projectile-damage-4"},
    unit =
    {
      count = 100*5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-e"
  },
  {
    type = "technology",
    name = "physical-projectile-damage-6",
    icon_size = 128,
    icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.4
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.4
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.4
      },
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 1.3
      }
    },
    prerequisites = {"physical-projectile-damage-5"},
    unit =
    {
      count = 100*6,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-f"
  },
  {
    type = "technology",
    name = "physical-projectile-damage-7",
    icon_size = 128,
    icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.4
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.7
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.4
      },
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 1
      }
    },
    prerequisites = {"physical-projectile-damage-6", "space-science-pack"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-l-f"
  },
})

data:extend(
{
  {
    type = "technology",
    name = "stronger-explosives-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/stronger-explosives-2.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.20
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.2
      }
    },
    prerequisites = {"stronger-explosives-1"},
    unit =
    {
      count = 100*2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-b"
  },
  {
    type = "technology",
    name = "stronger-explosives-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/stronger-explosives-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.3
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.2
      }
    },
    prerequisites = {"stronger-explosives-2"},
    unit =
    {
      count = 100*3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-c"
  },
  {
    type = "technology",
    name = "stronger-explosives-4",
    icon_size = 128,
    icon = "__base__/graphics/technology/stronger-explosives-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.4
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.2
      }
    },
    prerequisites = {"stronger-explosives-3"},
    unit =
    {
      count = 100*4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-d"
  },
  {
    type = "technology",
    name = "stronger-explosives-5",
    icon_size = 128,
    icon = "__base__/graphics/technology/stronger-explosives-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.5
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.2
      }
    },
    prerequisites = {"stronger-explosives-4"},
    unit =
    {
      count = 100*5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-e"
  },
  {
    type = "technology",
    name = "stronger-explosives-6",
    icon_size = 128,
    icon = "__base__/graphics/technology/stronger-explosives-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.6
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.2
      }
    },
    prerequisites = {"stronger-explosives-5"},
    unit =
    {
      count = 100*6,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-f"
  },
  {
    type = "technology",
    name = "stronger-explosives-7",
    icon_size = 128,
    icon = "__base__/graphics/technology/stronger-explosives-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.5
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.2
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.2
      }
    },
    prerequisites = {"stronger-explosives-6", "space-science-pack"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-l-f"
  },

})

data:extend(
{
  {
    type = "technology",
    name = "refined-flammables-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
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
      count = 100*1,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-a"
  },
  {
    type = "technology",
    name = "refined-flammables-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
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
    prerequisites = {"refined-flammables-1"},
    unit =
    {
      count = 100*2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-b"
  },
  {
    type = "technology",
    name = "refined-flammables-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
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
    prerequisites = {"refined-flammables-2"},
    unit =
    {
      count = 100*3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-c"
  },
  {
    type = "technology",
    name = "refined-flammables-4",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
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
    prerequisites = {"refined-flammables-3"},
    unit =
    {
      count = 100*4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-d"
  },
  {
    type = "technology",
    name = "refined-flammables-5",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
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
    prerequisites = {"refined-flammables-4"},
    unit =
    {
      count = 100*5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-e"
  },
  {
    type = "technology",
    name = "refined-flammables-6",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
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
    prerequisites = {"refined-flammables-5"},
    unit =
    {
      count = 100*6,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-f"
  },
  {
    type = "technology",
    name = "refined-flammables-7",
    icon_size = 128,
    icon = "__base__/graphics/technology/refined-flammables.png",
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
    prerequisites = {"refined-flammables-6", "space-science-pack"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-l-f"
  },

})

data:extend(
{
  {
    type = "technology",
    name = "energy-weapons-damage-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/energy-weapons-damage-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.2
      }
    },
    prerequisites = {"laser", "military-science-pack"},
    unit =
    {
      count = 100*1,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-a"
  },
  {
    type = "technology",
    name = "energy-weapons-damage-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/energy-weapons-damage-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.2
      }
    },
    prerequisites = {"energy-weapons-damage-1"},
    unit =
    {
      count = 100*2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-b"
  },
  {
    type = "technology",
    name = "energy-weapons-damage-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/energy-weapons-damage-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.3
      }
    },
    prerequisites = {"energy-weapons-damage-2"},
    unit =
    {
      count = 100*3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-c"
  },
  {
    type = "technology",
    name = "energy-weapons-damage-4",
    icon_size = 128,
    icon = "__base__/graphics/technology/energy-weapons-damage-2.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.4
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.2
      }
    },
    prerequisites = {"energy-weapons-damage-3"},
    unit =
    {
      count = 100*4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-d"
  },
  {
    type = "technology",
    name = "energy-weapons-damage-5",
    icon_size = 128,
    icon = "__base__/graphics/technology/energy-weapons-damage-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.5
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.4
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.4
      }
    },
    prerequisites = {"energy-weapons-damage-4"},
    unit =
    {
      count = 100*5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-e"
  },
  {
    type = "technology",
    name = "energy-weapons-damage-6",
    icon_size = 128,
    icon = "__base__/graphics/technology/energy-weapons-damage-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.7
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-laser",
        modifier = 0.4
      },
      {
        type = "ammo-damage",
        ammo_category = "combat-robot-beam",
        modifier = 0.6
      }
    },
    prerequisites = {"energy-weapons-damage-5"},
    unit =
    {
      count = 100*6,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-f"
  },
  {
    type = "technology",
    name = "energy-weapons-damage-7",
    icon_size = 128,
    icon = "__base__/graphics/technology/energy-weapons-damage-3.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser-turret",
        modifier = 0.7
      },
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
    prerequisites = {"energy-weapons-damage-6", "space-science-pack"},
    unit =
    {
      count_formula = "2^(L-7)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-l-f"
  },
})

data:extend(
{
  {
    type = "technology",
    name = "weapon-shooting-speed-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-2.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.2
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.5
      }
    },
    prerequisites = {"weapon-shooting-speed-2"},
    unit =
    {
      count = 100*3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-c"
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-4",
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-2.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.3
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.3
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.7
      }
    },
    prerequisites = {"weapon-shooting-speed-3"},
    unit =
    {
      count = 100*4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-d"
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-5",
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-3.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.3
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.4
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 0.8
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 0.9
      }
    },
    prerequisites = {"weapon-shooting-speed-4"},
    unit =
    {
      count = 100*5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-e"
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-6",
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-3.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.4
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.4
      },
      {
        type = "gun-speed",
        ammo_category = "cannon-shell",
        modifier = 1.5
      },
      {
        type = "gun-speed",
        ammo_category = "rocket",
        modifier = 1.3
      }
    },
    prerequisites = {"weapon-shooting-speed-5"},
    unit =
    {
      count = 100*6,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-l-f"
  },

})

data:extend(
{
  {
    type = "technology",
    name = "laser-turret-speed-1",
    icon_size = 128,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-h"
  },
  {
    type = "technology",
    name = "laser-turret-speed-2",
    icon_size = 128,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-n-i"
  },
  {
    type = "technology",
    name = "laser-turret-speed-3",
    icon_size = 128,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
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
    icon_size = 128,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
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
    icon_size = 128,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-l"
  },
  {
    type = "technology",
    name = "laser-turret-speed-6",
    icon_size = 128,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-m"
  },
  {
    type = "technology",
    name = "laser-turret-speed-7",
    icon_size = 128,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true,
    order = "e-n-n"
  },
})

data:extend(
{
  {
    type = "technology",
    name = "artillery-shell-range-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/artillery-range.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {"artillery", "space-science-pack"},
    unit =
    {
      count_formula = "2^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    order = "e-k-d"
  },
  {
    type = "technology",
    name = "artillery-shell-speed-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/artillery-speed.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "artillery-shell",
        modifier = 1
      }
    },
    prerequisites = {"artillery", "space-science-pack"},
    unit =
    {
      count_formula = "1000+3^(L-1)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    order = "e-k-k"
  }
})

function create_follower_upgrade(level, pack1, pack2, pack3, military_pack, high_tech_pack, production_pack, count, addition)
  local result =
  {
    type = "technology",
    name = "follower-robot-count-1",
    icon_size = 128,
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
    table.insert(result.unit.ingredients, {"automation-science-pack", pack1})
  end
  if pack2 ~= 0 then
    table.insert(result.unit.ingredients, {"logistic-science-pack", pack2})
  end
  if pack3 ~= 0 then
    table.insert(result.unit.ingredients, {"chemical-science-pack", pack3})
  end
  if military_pack ~= 0 then
    table.insert(result.unit.ingredients, {"military-science-pack", military_pack})
  end
  if high_tech_pack ~= 0 then
    table.insert(result.unit.ingredients, {"utility-science-pack", high_tech_pack})
  end
  if production_pack ~= 0 then
    table.insert(result.unit.ingredients, {"production-science-pack", production_pack})
  end
  return result
end

 data:extend(
{
  create_follower_upgrade(1, 1, 1, 0, 1, 0, 0, 200, 5),
  create_follower_upgrade(2, 1, 1, 0, 1, 0, 0, 300, 5),

  create_follower_upgrade(3, 1, 1, 1, 1, 0, 0, 400, 5),
  create_follower_upgrade(4, 1, 1, 1, 1, 0, 0, 600, 10),

  create_follower_upgrade(5, 1, 1, 1, 1, 1, 0, 800, 10),
  create_follower_upgrade(6, 1, 1, 1, 1, 1, 0, 1000, 10)
})

data:extend(
{
  {
    type = "technology",
    name = "follower-robot-count-7",
    icon_size = 128,
    icon = "__base__/graphics/technology/follower-robots.png",
    effects =
    {
      {
        type = "maximum-following-robots-count",
        modifier = 10
      }
    },
    prerequisites = {"follower-robot-count-6", "space-science-pack"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30,
      count_formula = "100(L-6)+900"
    },
    max_level = "infinite",
    upgrade = true,
    order = "e-p-b-c"
  }
})
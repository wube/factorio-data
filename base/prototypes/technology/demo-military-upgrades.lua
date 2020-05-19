data:extend(
{
  {
    type = "technology",
    name = "physical-projectile-damage-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.1
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.1
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.1
      }
    },
    prerequisites = {"military"},
    unit =
    {
      count = 100*1,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-a"
  },
  {
    type = "technology",
    name = "physical-projectile-damage-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.1
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.1
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.1
      }
    },
    prerequisites = {"physical-projectile-damage-1"},
    unit =
    {
      count = 100*2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-b"
  }
}
)

data:extend(
{
  {
    type = "technology",
    name = "weapon-shooting-speed-1",
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "bullet",
        modifier = 0.1
      },
      {
        type = "gun-speed",
        ammo_category = "shotgun-shell",
        modifier = 0.1
      }
    },
    prerequisites = {"military"},
    unit =
    {
      count = 100*1,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-j-a"
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
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
      }
    },
    prerequisites = {"weapon-shooting-speed-1"},
    unit =
    {
      count = 100*2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true,
    order = "e-l-b"
  }
})

data:extend
(
  {
    {
      type = "technology",
      name = "stronger-explosives-1",
      icon_size = 128,
      icon = "__base__/graphics/technology/stronger-explosives-1.png",
      effects =
      {
        {
          type = "ammo-damage",
          ammo_category = "grenade",
          modifier = 0.25
        }
      },
      prerequisites = {"military-2"},
      unit =
      {
        count = 100*1,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        },
        time = 30
      },
      upgrade = true,
      order = "e-j-a"
    },
  }
)

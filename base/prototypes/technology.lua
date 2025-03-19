local physical_projectile_damage_1_icon = "__base__/graphics/technology/physical-projectile-damage-1.png"
local physical_projectile_damage_2_icon = "__base__/graphics/technology/physical-projectile-damage-2.png"
local stronger_explosives_1_icon = "__base__/graphics/technology/stronger-explosives-1.png"
local stronger_explosives_2_icon = "__base__/graphics/technology/stronger-explosives-2.png"
local stronger_explosives_3_icon = "__base__/graphics/technology/stronger-explosives-3.png"
local refined_flammables_icon = "__base__/graphics/technology/refined-flammables.png"
local laser_weapons_damage_1_icon = "__base__/graphics/technology/laser-weapons-damage.png"
local laser_weapons_damage_2_icon = "__base__/graphics/technology/laser-weapons-damage.png"
local laser_weapons_damage_3_icon = "__base__/graphics/technology/laser-weapons-damage.png"
local weapon_shooting_speed_1_icon = "__base__/graphics/technology/weapon-shooting-speed-1.png"
local weapon_shooting_speed_2_icon = "__base__/graphics/technology/weapon-shooting-speed-2.png"
local weapon_shooting_speed_3_icon = "__base__/graphics/technology/weapon-shooting-speed-3.png"
local laser_shooting_speed_icon = "__base__/graphics/technology/laser-shooting-speed.png"

data:extend
({
  {
    type = "technology",
    name = "steam-power",
    icon = "__base__/graphics/technology/steam-power.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "pipe-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "offshore-pump"
      },
      {
        type = "unlock-recipe",
        recipe = "boiler"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-engine"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      item = "iron-plate",
      count = 50
    }
  },
  {
    type = "technology",
    name = "electronics",
    icon = "__base__/graphics/technology/electronics.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "copper-cable"
      },
      {
        type = "unlock-recipe",
        recipe = "electronic-circuit"
      },
      {
        type = "unlock-recipe",
        recipe = "lab"
      },
      {
        type = "unlock-recipe",
        recipe = "inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "small-electric-pole"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      item = "copper-plate",
      count = 10
    }
  },
  {
    type = "technology",
    name = "automation-science-pack",
    icon = "__base__/graphics/technology/automation-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "automation-science-pack"
      }
    },
    prerequisites = {"steam-power", "electronics"},
    research_trigger =
    {
      type = "craft-item",
      item = "lab"
    }
  },
  {
    type = "technology",
    name = "electric-mining-drill",
    icon = "__base__/graphics/technology/electric-mining-drill.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-mining-drill"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 25,
      ingredients = {{"automation-science-pack", 1}},
      time = 10
    }
  },
  {
    type = "technology",
    name = "repair-pack",
    icon = "__base__/graphics/technology/repair-pack.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "repair-pack"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 25,
      ingredients = {{"automation-science-pack", 1}},
      time = 10
    }
  },
  {
    type = "technology",
    name = "radar",
    icon = "__base__/graphics/technology/radar.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "radar"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 20,
      ingredients = {{"automation-science-pack", 1}},
      time = 10
    }
  },
  {
    type = "technology",
    name = "physical-projectile-damage-1",
    icons = util.technology_icon_constant_damage(physical_projectile_damage_1_icon),
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
      count = 100 * 1,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "physical-projectile-damage-2",
    icons = util.technology_icon_constant_damage(physical_projectile_damage_1_icon),
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
    prerequisites = {"physical-projectile-damage-1", "logistic-science-pack"},
    unit =
    {
      count = 100 * 2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-1",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_1_icon),
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
      count = 100 * 1,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-2",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_1_icon),
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
    prerequisites = {"weapon-shooting-speed-1", "logistic-science-pack"},
    unit =
    {
      count = 100 * 2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "stronger-explosives-1",
    icons = util.technology_icon_constant_damage(stronger_explosives_1_icon),
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
      count = 100 * 1,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "physical-projectile-damage-3",
    icons = util.technology_icon_constant_damage(physical_projectile_damage_1_icon),
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
    prerequisites = {"physical-projectile-damage-2", "military-science-pack"},
    unit =
    {
      count = 100 * 3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "physical-projectile-damage-4",
    icons = util.technology_icon_constant_damage(physical_projectile_damage_1_icon),
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
      count = 100 * 4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "physical-projectile-damage-5",
    icons = util.technology_icon_constant_damage(physical_projectile_damage_2_icon),
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
    prerequisites = {"physical-projectile-damage-4", "chemical-science-pack"},
    unit =
    {
      count = 100 * 5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "physical-projectile-damage-6",
    icons = util.technology_icon_constant_damage(physical_projectile_damage_2_icon),
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
    prerequisites = {"physical-projectile-damage-5", "utility-science-pack"},
    unit =
    {
      count = 100 * 6,
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
    upgrade = true
  },
  {
    type = "technology",
    name = "physical-projectile-damage-7",
    icons = util.technology_icon_constant_damage(physical_projectile_damage_2_icon),
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
    upgrade = true
  },
  {
    type = "technology",
    name = "stronger-explosives-2",
    icons = util.technology_icon_constant_damage(stronger_explosives_2_icon),
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
    prerequisites = {"stronger-explosives-1", "military-science-pack"},
    unit =
    {
      count = 100 * 2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "stronger-explosives-3",
    icons = util.technology_icon_constant_damage(stronger_explosives_3_icon),
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
    prerequisites = {"stronger-explosives-2", "chemical-science-pack"},
    unit =
    {
      count = 100 * 3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "stronger-explosives-4",
    icons = util.technology_icon_constant_damage(stronger_explosives_3_icon),
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
    prerequisites = {"stronger-explosives-3", "utility-science-pack"},
    unit =
    {
      count = 100 * 4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "stronger-explosives-5",
    icons = util.technology_icon_constant_damage(stronger_explosives_3_icon),
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
      count = 100 * 5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "stronger-explosives-6",
    icons = util.technology_icon_constant_damage(stronger_explosives_3_icon),
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
      count = 100 * 6,
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
    upgrade = true
  },
  {
    type = "technology",
    name = "stronger-explosives-7",
    icons = util.technology_icon_constant_damage(stronger_explosives_3_icon),
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
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-flammables-1",
    icons = util.technology_icon_constant_damage(refined_flammables_icon),
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
      count = 100 * 1,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-flammables-2",
    icons = util.technology_icon_constant_damage(refined_flammables_icon),
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
      count = 100 * 2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-flammables-3",
    icons = util.technology_icon_constant_damage(refined_flammables_icon),
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
    prerequisites = {"refined-flammables-2", "chemical-science-pack"},
    unit =
    {
      count = 100 * 3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-flammables-4",
    icons = util.technology_icon_constant_damage(refined_flammables_icon),
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
    prerequisites = {"refined-flammables-3", "utility-science-pack"},
    unit =
    {
      count = 100 * 4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-flammables-5",
    icons = util.technology_icon_constant_damage(refined_flammables_icon),
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
      count = 100 * 5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-flammables-6",
    icons = util.technology_icon_constant_damage(refined_flammables_icon),
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
      count = 100 * 6,
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
    upgrade = true
  },
  {
    type = "technology",
    name = "refined-flammables-7",
    icons = util.technology_icon_constant_damage(refined_flammables_icon),
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-weapons-damage-1",
    icons = util.technology_icon_constant_damage(laser_weapons_damage_1_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser",
        modifier = 0.2
      }
    },
    prerequisites = {"laser", "military-science-pack"},
    unit =
    {
      count = 100 * 1,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-weapons-damage-2",
    icons = util.technology_icon_constant_damage(laser_weapons_damage_1_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser",
        modifier = 0.2
      }
    },
    prerequisites = {"laser-weapons-damage-1"},
    unit =
    {
      count = 100 * 2,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-weapons-damage-3",
    icons = util.technology_icon_constant_damage(laser_weapons_damage_1_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser",
        modifier = 0.3
      }
    },
    prerequisites = {"laser-weapons-damage-2"},
    unit =
    {
      count = 100 * 3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-weapons-damage-4",
    icons = util.technology_icon_constant_damage(laser_weapons_damage_2_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser",
        modifier = 0.4
      }
    },
    prerequisites = {"laser-weapons-damage-3"},
    unit =
    {
      count = 100 * 4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-weapons-damage-5",
    icons = util.technology_icon_constant_damage(laser_weapons_damage_3_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser",
        modifier = 0.5
      },
      {
        type = "ammo-damage",
        ammo_category = "beam",
        modifier = 0.4
      }
    },
    prerequisites = {"laser-weapons-damage-4", "utility-science-pack"},
    unit =
    {
      count = 100 * 5,
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-weapons-damage-6",
    icons = util.technology_icon_constant_damage(laser_weapons_damage_3_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser",
        modifier = 0.7
      },
      {
        type = "ammo-damage",
        ammo_category = "electric",
        modifier = 0.7
      },
      {
        type = "ammo-damage",
        ammo_category = "beam",
        modifier = 0.6
      }
    },
    prerequisites = {"laser-weapons-damage-5"},
    unit =
    {
      count = 100 * 6,
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-weapons-damage-7",
    icons = util.technology_icon_constant_damage(laser_weapons_damage_3_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "laser",
        modifier = 0.7
      },
      {
        type = "ammo-damage",
        ammo_category = "electric",
        modifier = 0.7
      },
      {
        type = "ammo-damage",
        ammo_category = "beam",
        modifier = 0.3
      }
    },
    prerequisites = {"laser-weapons-damage-6", "space-science-pack"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-3",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_2_icon),
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
    prerequisites = {"weapon-shooting-speed-2", "military-science-pack"},
    unit =
    {
      count = 100 * 3,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-4",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_2_icon),
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
      count = 100 * 4,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-5",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_3_icon),
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
    prerequisites = {"weapon-shooting-speed-4", "chemical-science-pack"},
    unit =
    {
      count = 100 * 5,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "weapon-shooting-speed-6",
    icons = util.technology_icon_constant_speed(weapon_shooting_speed_3_icon),
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
    prerequisites = {"weapon-shooting-speed-5", "utility-science-pack"},
    unit =
    {
      count = 100 * 6,
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-shooting-speed-1",
    icons = util.technology_icon_constant_speed(laser_shooting_speed_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser",
        modifier = 0.1
      }
    },
    prerequisites = {"laser", "military-science-pack"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-shooting-speed-2",
    icons = util.technology_icon_constant_speed(laser_shooting_speed_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser",
        modifier = 0.2
      }
    },
    prerequisites = {"laser-shooting-speed-1"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-shooting-speed-3",
    icons = util.technology_icon_constant_speed(laser_shooting_speed_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser",
        modifier = 0.3
      }
    },
    prerequisites = {"laser-shooting-speed-2"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-shooting-speed-4",
    icons = util.technology_icon_constant_speed(laser_shooting_speed_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser",
        modifier = 0.3
      }
    },
    prerequisites = {"laser-shooting-speed-3"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-shooting-speed-5",
    icons = util.technology_icon_constant_speed(laser_shooting_speed_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser",
        modifier = 0.4
      }
    },
    prerequisites = {"laser-shooting-speed-4", "utility-science-pack"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-shooting-speed-6",
    icons = util.technology_icon_constant_speed(laser_shooting_speed_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser",
        modifier = 0.4
      }
    },
    prerequisites = {"laser-shooting-speed-5"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "laser-shooting-speed-7",
    icons = util.technology_icon_constant_speed(laser_shooting_speed_icon),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "laser",
        modifier = 0.5
      }
    },
    prerequisites = {"laser-shooting-speed-6"},
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
    upgrade = true
  },
  {
    type = "technology",
    name = "artillery-shell-range-1",
    icons = util.technology_icon_constant_range("__base__/graphics/technology/artillery-range.png"),
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
    max_level = "infinite"
  },
  {
    type = "technology",
    name = "artillery-shell-speed-1",
    icons = util.technology_icon_constant_speed("__base__/graphics/technology/artillery-speed.png"),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "artillery-shell",
        icon = "__base__/graphics/icons/artillery-shell.png",
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
    max_level = "infinite"
  }
})

function create_follower_upgrade(level, pack1, pack2, pack3, military_pack, high_tech_pack, production_pack, count,
                                 addition)
  local result =
  {
    type = "technology",
    name = "follower-robot-count-1",
    icons = util.technology_icon_constant_followers("__base__/graphics/technology/follower-robots.png"),
    effects =
    {
      {
        type = "maximum-following-robots-count",
        modifier = addition
      }
    },
    prerequisites = {"defender"},
    unit =
    {
      ingredients = {},
      time = 30
    },
    upgrade = true
  }
  result.name = "follower-robot-count-" .. level
  if level == 1 then
    result.prerequisites = {"defender"}
  else
    result.prerequisites = {"follower-robot-count-" .. (level - 1)}
    if level == 3 then
      table.insert(result.prerequisites, "chemical-science-pack")
    end
    if level == 4 then
      result.prerequisites[#result.prerequisites + 1] = "destroyer"
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

data:extend
({
  create_follower_upgrade(1, 1, 1, 0, 1, 0, 0, 100, 5),
  create_follower_upgrade(2, 1, 1, 0, 1, 0, 0, 200, 10),

  create_follower_upgrade(3, 1, 1, 1, 1, 0, 0, 300, 10),
  create_follower_upgrade(4, 1, 1, 1, 1, 1, 0, 400, 20)
})

data:extend
({
  {
    type = "technology",
    name = "follower-robot-count-5",
    icons = util.technology_icon_constant_followers("__base__/graphics/technology/follower-robots.png"),
    effects =
    {
      {
        type = "maximum-following-robots-count",
        modifier = 25
      }
    },
    prerequisites = {"follower-robot-count-4", "space-science-pack"},
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
      count_formula = "1000*(L-4)"
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "bulk-inserter",
    icon = "__base__/graphics/technology/bulk-inserter.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bulk-inserter"
      },
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 1
      }
    },
    prerequisites = {"fast-inserter", "logistics-2", "advanced-circuit"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),

    effects =
    {
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 1 -- result of 3
      }
    },
    prerequisites = {"bulk-inserter"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-2",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1 -- result of 2
      },
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 1 -- result of 4
      }
    },
    prerequisites = {"inserter-capacity-bonus-1"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-3",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 1 -- result of 5
      }
    },
    prerequisites = {"inserter-capacity-bonus-2", "chemical-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-4",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 1 -- result of 6
      }
    },
    prerequisites = {"inserter-capacity-bonus-3", "production-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-5",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 2 -- result of 8
      }
    },
    prerequisites = {"inserter-capacity-bonus-4"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-6",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 2 -- result of 10
      }
    },
    prerequisites = {"inserter-capacity-bonus-5"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "inserter-capacity-bonus-7",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1 -- result of 3
      },
      {
        type = "bulk-inserter-capacity-bonus",
        modifier = 2 -- result of 12
      }
    },
    prerequisites = {"inserter-capacity-bonus-6", "utility-science-pack"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "automation",
    icon = "__base__/graphics/technology/automation-1.png",
    icon_size = 256,
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
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 10
    },
    ignore_tech_cost_multiplier = true
  },
  {
    type = "technology",
    name = "automation-2",
    icon = "__base__/graphics/technology/automation-2.png",
    icon_size = 256,
    localised_description = {"technology-description.automation-2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-2"
      }
    },
    prerequisites = {"automation", "steel-processing", "logistic-science-pack"},
    unit =
    {
      count = 40,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "logistic-science-pack",
    localised_name = {"technology-name.logistic-science-pack"},
    localised_description = {"technology-description.logistic-science-pack"},
    icon = "__base__/graphics/technology/logistic-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "logistic-science-pack"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 75,
      ingredients = {{"automation-science-pack", 1}},
      time = 5
    }
  },
  {
    type = "technology",
    name = "steel-processing",
    icon = "__base__/graphics/technology/steel-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steel-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "steel-chest"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 50,
      ingredients = {{"automation-science-pack", 1}},
      time = 5
    }
  },
  {
    type = "technology",
    name = "steel-axe",
    icon = "__base__/graphics/technology/steel-axe.png",
    icon_size = 256,
    effects =
    {
      {
        type = "character-mining-speed",
        modifier = 1
      }
    },
    prerequisites = {"steel-processing"},
    research_trigger =
    {
      type = "craft-item",
      item = "steel-plate",
      count = 50
    }
  },
  {
    type = "technology",
    name = "military",
    icon = "__base__/graphics/technology/military.png",
    icon_size = 256,
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
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "military-2",
    icon = "__base__/graphics/technology/military.png",
    icon_size = 256,
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
    prerequisites = {"military", "steel-processing", "logistic-science-pack"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "fast-inserter",
    icon = "__base__/graphics/technology/fast-inserter.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fast-inserter"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 30,
      ingredients = {{"automation-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "logistics",
    icon = "__base__/graphics/technology/logistics-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "splitter"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 20,
      ingredients = {{"automation-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "railway",
    icon = "__base__/graphics/technology/railway.png",
    icon_size = 256,
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
      },
      {
        type = "unlock-recipe",
        recipe = "iron-stick"
      }
    },
    prerequisites = {"logistics-2", "engine"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "automated-rail-transportation",
    icon = "__base__/graphics/technology/automated-rail-transportation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "train-stop"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-signal"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-chain-signal"
      }
    },
    prerequisites = {"railway"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "automobilism",
    icon = "__base__/graphics/technology/automobilism.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "car"
      }
    },
    prerequisites = {"logistics-2", "engine"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "lamp",
    icon = "__base__/graphics/technology/lamp.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-lamp"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "solar-energy",
    icon = "__base__/graphics/technology/solar-energy.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel"
      }
    },
    prerequisites = {"steel-processing", "logistic-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "heavy-armor",
    icon = "__base__/graphics/technology/heavy-armor.png",
    icon_size = 256,
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
      ingredients = {{"automation-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "gun-turret",
    icon = "__base__/graphics/technology/gun-turret.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "gun-turret"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 10
    }
  },

  {
    type = "technology",
    name = "research-speed-1",
    icons = util.technology_icon_constant_speed("__base__/graphics/technology/research-speed.png"),
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.2
      }
    },
    prerequisites = {"automation-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "research-speed-2",
    icons = util.technology_icon_constant_speed("__base__/graphics/technology/research-speed.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "electric-energy-distribution-1",
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "medium-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "big-electric-pole"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-stick"
      }
    },
    prerequisites = {"steel-processing", "logistic-science-pack"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "advanced-material-processing",
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steel-furnace"
      }
    },
    prerequisites = {"steel-processing", "logistic-science-pack"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "concrete",
    icon = "__base__/graphics/technology/concrete.png",
    icon_size = 256,
    prerequisites = {"advanced-material-processing", "automation-2"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
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
      },
      {
        type = "unlock-recipe",
        recipe = "refined-concrete"
      },
      {
        type = "unlock-recipe",
        recipe = "refined-hazard-concrete"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-stick"
      }
    }
  },
  {
    type = "technology",
    name = "engine",
    icon = "__base__/graphics/technology/engine.png",
    icon_size = 256,
    prerequisites = {"steel-processing", "logistic-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "engine-unit"
      }
    }
  },
  {
    type = "technology",
    name = "landfill",
    icon = "__base__/graphics/technology/landfill.png",
    icon_size = 256,
    prerequisites = {"logistic-science-pack"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "landfill"
      }
    }
  },
  {
    type = "technology",
    name = "logistics-2",
    icon = "__base__/graphics/technology/logistics-2.png",
    icon_size = 256,
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
    prerequisites = {"logistics", "logistic-science-pack"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "toolbelt",
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/toolbelt.png"),
    prerequisites = {"logistic-science-pack"},
    effects =
    {
      {
        type = "character-inventory-slots-bonus",
        modifier = 10
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "stone-wall",
    icon = "__base__/graphics/technology/stone-wall.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "stone-wall"
      }
    },
    prerequisites = {"automation-science-pack"},
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 10
    }
  },
  {
    type = "technology",
    name = "gate",
    localised_description = {"technology-description.gates"}, -- i could rename locale key to "gate" but translators will complain
    icon = "__base__/graphics/technology/gate.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "gate"
      }
    },
    prerequisites = {"stone-wall", "military-2"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "chemical-science-pack",
    localised_name = {"technology-name.chemical-science-pack"},
    localised_description = {"technology-description.chemical-science-pack"},
    icon = "__base__/graphics/technology/chemical-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "chemical-science-pack"
      }
    },
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"advanced-circuit", "sulfur-processing"}
  },
  {
    type = "technology",
    name = "military-science-pack",
    icon = "__base__/graphics/technology/military-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "military-science-pack"
      }
    },
    unit =
    {
      count = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    prerequisites = {"military-2", "stone-wall"}
  },
  {
    type = "technology",
    name = "production-science-pack",
    icon = "__base__/graphics/technology/production-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "production-science-pack"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    prerequisites = {"productivity-module", "advanced-material-processing-2", "railway"}
  },
  {
    type = "technology",
    name = "utility-science-pack",
    icon = "__base__/graphics/technology/utility-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "utility-science-pack"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    prerequisites = {"robotics", "processing-unit", "low-density-structure"},
  },
  {
    type = "technology",
    name = "space-science-pack",
    icon = "__base__/graphics/technology/space-science-pack.png",
    icon_size = 256,
    essential = true,
    effects = {},
    research_trigger =
    {
      type = "send-item-to-orbit",
      item = "satellite"
    },
    prerequisites = {"rocket-silo"}
  },
  {
    type = "technology",
    name = "military-3",
    icon = "__base__/graphics/technology/military.png",
    icon_size = 256,
    effects =
    {
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
    prerequisites = {"chemical-science-pack", "military-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "military-4",
    icon = "__base__/graphics/technology/military.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "piercing-shotgun-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "cluster-grenade"
      }
    },
    prerequisites = {"military-3", "utility-science-pack", "explosives"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 45
    }
  },
  {
    type = "technology",
    name = "uranium-ammo",
    icon = "__base__/graphics/technology/uranium-ammo.png",
    icon_size = 256,
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
    prerequisites = {"uranium-processing", "military-4", "tank"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 45
    }
  },
  {
    type = "technology",
    name = "atomic-bomb",
    icon = "__base__/graphics/technology/atomic-bomb.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "atomic-bomb"
      }
    },
    prerequisites = {"military-4", "kovarex-enrichment-process", "rocketry"},
    unit =
    {
      count = 5000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 45
    }
  },

  {
    type = "technology",
    name = "automation-3",
    icon = "__base__/graphics/technology/automation-3.png",
    icon_size = 256,
    localised_description = {"technology-description.automation-3"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-3"
      }
    },
    prerequisites = {"speed-module", "production-science-pack", "electric-engine"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "explosives",
    icon = "__base__/graphics/technology/explosives.png",
    icon_size = 256,
    prerequisites = {"sulfur-processing"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "explosives"
      }
    }
  },
  {
    type = "technology",
    name = "cliff-explosives",
    icon = "__base__/graphics/technology/cliff-explosives.png",
    icon_size = 256,
    prerequisites = {"explosives", "military-2"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cliff-explosives"
      },
      {
        type = "cliff-deconstruction-enabled",
        modifier = true
      }
    }
  },
  {
    type = "technology",
    name = "flammables",
    icon = "__base__/graphics/technology/flammables.png",
    icon_size = 256,
    prerequisites = {"oil-processing"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "land-mine",
    icon = "__base__/graphics/technology/land-mine.png",
    icon_size = 256,
    localised_description = {"technology-description.land-mine"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "land-mine"
      }
    },
    prerequisites = {"explosives", "military-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "flamethrower",
    icon = "__base__/graphics/technology/flamethrower.png",
    icon_size = 256,
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
    prerequisites = {"flammables", "military-science-pack"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "advanced-circuit",
    icon = "__base__/graphics/technology/advanced-circuit.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-circuit"
      }
    },
    prerequisites = {"plastics"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "processing-unit",
    icon = "__base__/graphics/technology/processing-unit.png",
    icon_size = 256,
    prerequisites = {"chemical-science-pack"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "processing-unit"
      }
    },
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },

  {
    type = "technology",
    name = "fluid-wagon",
    icon = "__base__/graphics/technology/fluid-wagon.png",
    icon_size = 256,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },

  {
    type = "technology",
    name = "braking-force-1",
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.1
      }
    },
    prerequisites = {"railway", "chemical-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "braking-force-2",
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "braking-force-3",
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-2", "production-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "braking-force-4",
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "braking-force-5",
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 35
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "braking-force-6",
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.15
      }
    },
    prerequisites = {"braking-force-5", "utility-science-pack"},
    unit =
    {
      count = 550,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 45
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "braking-force-7",
    icons = util.technology_icon_constant_braking_force("__base__/graphics/technology/braking-force.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "tank",
    icon = "__base__/graphics/technology/tank.png",
    icon_size = 256,
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
      }
    },
    prerequisites = {"automobilism", "military-3", "explosives"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "logistics-3",
    icon = "__base__/graphics/technology/logistics-3.png",
    icon_size = 256,
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
    prerequisites = {"production-science-pack", "lubricant"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "laser",
    icon = "__base__/graphics/technology/laser.png",
    icon_size = 256,
    prerequisites = {"battery", "chemical-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "rocketry",
    icon = "__base__/graphics/technology/rocketry.png",
    icon_size = 256,
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
    prerequisites = {"explosives", "flammables", "military-science-pack"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "explosive-rocketry",
    icon = "__base__/graphics/technology/explosive-rocketry.png",
    icon_size = 256,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "modular-armor",
    icon = "__base__/graphics/technology/armor-making.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "modular-armor"
      }
    },
    prerequisites = {"heavy-armor", "advanced-circuit"},
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "power-armor",
    icon = "__base__/graphics/technology/power-armor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "power-armor"
      }
    },
    prerequisites = {"modular-armor", "electric-engine", "processing-unit"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "power-armor-mk2",
    icon = "__base__/graphics/technology/power-armor-mk2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "power-armor-mk2"
      }
    },
    prerequisites = {"power-armor", "military-4", "speed-module-2", "efficiency-module-2"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "laser-turret",
    icon = "__base__/graphics/technology/laser-turret.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "laser-turret"
      }
    },
    prerequisites = {"laser", "military-science-pack"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "robotics",
    icon = "__base__/graphics/technology/robotics.png",
    icon_size = 256,
    prerequisites = {"electric-engine", "battery"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "flying-robot-frame"
      }
    }
  },
  {
    type = "technology",
    name = "rocket-fuel",
    icon = "__base__/graphics/technology/rocket-fuel.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-fuel"
      }
    },
    prerequisites = {"flammables", "advanced-oil-processing"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 45
    }
  },
  {
    type = "technology",
    name = "low-density-structure",
    icon = "__base__/graphics/technology/low-density-structure.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "low-density-structure"
      }
    },
    prerequisites = {"advanced-material-processing", "chemical-science-pack"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 45
    }
  },
  {
    type = "technology",
    name = "rocket-silo",
    icon = "__base__/graphics/technology/rocket-silo.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-part"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-landing-pad"
      },
      {
        type = "unlock-recipe",
        recipe = "satellite"
      }
    },
    prerequisites =
    {
      "concrete",
      "rocket-fuel",
      "electric-energy-accumulators",
      "solar-energy",
      "utility-science-pack",
      "speed-module-3",
      "productivity-module-3",
      "radar"
    },
    unit =
    {
      count = 1000,

      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "research-speed-3",
    icons = util.technology_icon_constant_speed("__base__/graphics/technology/research-speed.png"),
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.4
      }
    },
    prerequisites = {"research-speed-2", "chemical-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "research-speed-4",
    icons = util.technology_icon_constant_speed("__base__/graphics/technology/research-speed.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "research-speed-5",
    icons = util.technology_icon_constant_speed("__base__/graphics/technology/research-speed.png"),
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.5
      }
    },
    prerequisites = {"research-speed-4", "production-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "research-speed-6",
    icons = util.technology_icon_constant_speed("__base__/graphics/technology/research-speed.png"),
    effects =
    {
      {
        type = "laboratory-speed",
        modifier = 0.6
      }
    },
    prerequisites = {"research-speed-5", "utility-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "electric-energy-distribution-2",
    icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "substation"
      }
    },
    prerequisites = {"electric-energy-distribution-1", "chemical-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 45
    }
  },
  {
    type = "technology",
    name = "electric-energy-accumulators",
    icon = "__base__/graphics/technology/electric-energy-acumulators.png",
    icon_size = 256,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "advanced-material-processing-2",
    icon = "__base__/graphics/technology/advanced-material-processing-2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-furnace"
      }
    },
    prerequisites = {"advanced-material-processing", "chemical-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "effect-transmission",
    icon = "__base__/graphics/technology/effect-transmission.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "beacon"
      }
    },
    prerequisites = {"processing-unit", "production-science-pack"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "lubricant",
    icon = "__base__/graphics/technology/lubricant.png",
    icon_size = 256,
    prerequisites = {"advanced-oil-processing"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lubricant"
      }
    }
  },
  {
    type = "technology",
    name = "electric-engine",
    icon = "__base__/graphics/technology/electric-engine.png",
    icon_size = 256,
    prerequisites = {"lubricant"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-engine-unit"
      }
    }
  },
  {
    type = "technology",
    name = "battery",
    icon = "__base__/graphics/technology/battery.png",
    icon_size = 256,
    prerequisites = {"sulfur-processing"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "battery"
      }
    }
  },
  {
    type = "technology",
    name = "construction-robotics",
    icon = "__base__/graphics/technology/construction-robotics.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "roboport"
      },
      {
        type = "unlock-recipe",
        recipe = "passive-provider-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "storage-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "construction-robot"
      },
      {
        type = "create-ghost-on-entity-death",
        modifier = true
      }
    },
    prerequisites = {"robotics"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "logistic-robotics",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "roboport"
      },
      {
        type = "unlock-recipe",
        recipe = "passive-provider-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "storage-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-robot"
      },
      {
        type = "character-logistic-requests",
        modifier = true
      },
      {
        type = "character-logistic-trash-slots",
        modifier = 30
      }
    },
    prerequisites = {"robotics"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "logistic-system",
    icon = "__base__/graphics/technology/logistic-system.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "active-provider-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "requester-chest"
      },
      {
        type = "unlock-recipe",
        recipe = "buffer-chest"
      },
      {
        type = "vehicle-logistics",
        modifier = true
      }
    },
    prerequisites = {"utility-science-pack", "logistic-robotics"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "worker-robots-speed-1",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-speed-2",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.4
      }
    },
    prerequisites = {"worker-robots-speed-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-speed-3",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.45
      }
    },
    prerequisites = {"worker-robots-speed-2", "utility-science-pack"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-speed-4",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-speed-5",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.65
      }
    },
    prerequisites = {"worker-robots-speed-4", "production-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-speed-6",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.65
      }
    },
    prerequisites = {"worker-robots-speed-5", "space-science-pack"},
    unit =
    {
      count_formula = "2^(L-6)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-storage-1",
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-storage-2",
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"worker-robots-storage-1", "production-science-pack"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "worker-robots-storage-3",
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"worker-robots-storage-2", "utility-science-pack"},
    unit =
    {
      count = 450,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "energy-shield-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/energy-shield-equipment.png"),
    prerequisites = {"solar-panel-equipment", "military-science-pack"},
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 15
    }
  },
  {
    type = "technology",
    name = "night-vision-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/night-vision-equipment.png"),
    prerequisites = {"solar-panel-equipment"},
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "belt-immunity-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/belt-immunity-equipment.png"),
    prerequisites = {"solar-panel-equipment"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "belt-immunity-equipment"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "energy-shield-mk2-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/energy-shield-mk2-equipment.png"),
    prerequisites = {"energy-shield-equipment", "military-3", "low-density-structure", "power-armor"},
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "battery-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/battery-equipment.png"),
    prerequisites = {"battery", "solar-panel-equipment"},
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "battery-mk2-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/battery-mk2-equipment.png"),
    prerequisites = {"battery-equipment", "low-density-structure", "power-armor"},
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "solar-panel-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/solar-panel-equipment.png"),
    prerequisites = {"modular-armor", "solar-energy"},
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "personal-laser-defense-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/personal-laser-defense-equipment.png"),
    prerequisites = {"laser-turret", "military-3", "low-density-structure", "power-armor", "solar-panel-equipment"},
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "discharge-defense-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/discharge-defense-equipment.png"),
    prerequisites = {"laser-turret", "military-3", "power-armor", "solar-panel-equipment"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "discharge-defense-equipment"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "fission-reactor-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/fission-reactor-equipment.png"),
    prerequisites = {"utility-science-pack", "power-armor", "military-science-pack", "nuclear-power"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fission-reactor-equipment"
      }
    },
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
      time = 30
    }
  },
  {
    type = "technology",
    name = "exoskeleton-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/exoskeleton-equipment.png"),
    prerequisites = {"processing-unit", "electric-engine", "solar-panel-equipment"},
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "personal-roboport-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/personal-roboport-equipment.png"),
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "personal-roboport-equipment"
      }
    },
    prerequisites = {"construction-robotics", "solar-panel-equipment"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "personal-roboport-mk2-equipment",
    icons = util.technology_icon_constant_equipment("__base__/graphics/technology/personal-roboport-mk2-equipment.png"),
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "personal-roboport-mk2-equipment"
      }
    },
    prerequisites = {"personal-roboport-equipment", "utility-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "fluid-handling",
    icon = "__base__/graphics/technology/fluid-handling.png",
    icon_size = 256,
    prerequisites = {"automation-2", "engine"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "pump"
      },
      {
        type = "unlock-recipe",
        recipe = "barrel"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 15
    }
  },
  {
    type = "technology",
    name = "oil-gathering",
    icon = "__base__/graphics/technology/oil-gathering.png",
    icon_size = 256,
    prerequisites = {"fluid-handling"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pumpjack"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "oil-processing",
    icon = "__base__/graphics/technology/oil-processing.png",
    icon_size = 256,
    prerequisites = {"oil-gathering"},
    effects =
    {
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
        recipe = "solid-fuel-from-petroleum-gas"
      }
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "crude-oil"
    }
  },
  {
    type = "technology",
    name = "advanced-oil-processing",
    icon = "__base__/graphics/technology/advanced-oil-processing.png",
    icon_size = 256,
    prerequisites = {"chemical-science-pack"},
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
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-heavy-oil"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-light-oil"
      }
    },
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "coal-liquefaction",
    icon = "__base__/graphics/technology/coal-liquefaction.png",
    icon_size = 256,
    prerequisites = {"advanced-oil-processing", "production-science-pack"},
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "sulfur-processing",
    icon = "__base__/graphics/technology/sulfur-processing.png",
    icon_size = 256,
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "plastics",
    icon = "__base__/graphics/technology/plastics.png",
    icon_size = 256,
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 30
    }
  },
  {
    type = "technology",
    name = "modules",
    icon = "__base__/graphics/technology/module.png",
    icon_size = 256,
    prerequisites = {"advanced-circuit"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "speed-module",
    icon = "__base__/graphics/technology/speed-module-1.png",
    icon_size = 256,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "speed-module-2",
    icon = "__base__/graphics/technology/speed-module-2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "speed-module-2"
      }
    },
    prerequisites = {"speed-module", "processing-unit"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "speed-module-3",
    icon = "__base__/graphics/technology/speed-module-3.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "speed-module-3"
      }
    },
    prerequisites = {"speed-module-2", "production-science-pack"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "productivity-module",
    icon = "__base__/graphics/technology/productivity-module-1.png",
    icon_size = 256,
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "productivity-module-2",
    icon = "__base__/graphics/technology/productivity-module-2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "productivity-module-2"
      }
    },
    prerequisites = {"productivity-module", "processing-unit"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "productivity-module-3",
    icon = "__base__/graphics/technology/productivity-module-3.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "productivity-module-3"
      }
    },
    prerequisites = {"productivity-module-2", "production-science-pack"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "efficiency-module",
    icon = "__base__/graphics/technology/efficiency-module-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "efficiency-module"
      }
    },
    prerequisites = {"modules"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "efficiency-module-2",
    icon = "__base__/graphics/technology/efficiency-module-2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "efficiency-module-2"
      }
    },
    prerequisites = {"efficiency-module", "processing-unit"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "efficiency-module-3",
    icon = "__base__/graphics/technology/efficiency-module-3.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "efficiency-module-3"
      }
    },
    prerequisites = {"efficiency-module-2", "production-science-pack"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "defender",
    icon = "__base__/graphics/technology/defender.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "defender-capsule"
      },
      {
        type = "maximum-following-robots-count",
        modifier = 4
      }
    },
    prerequisites = {"military-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "distractor",
    icon = "__base__/graphics/technology/distractor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "distractor-capsule"
      }
    },
    prerequisites = {"defender", "military-3", "laser"},
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
      time = 30
    }
  },
  {
    type = "technology",
    name = "destroyer",
    icon = "__base__/graphics/technology/destroyer.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "destroyer-capsule"
      }
    },
    prerequisites = {"military-4", "distractor", "speed-module"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "uranium-mining",
    icon = "__base__/graphics/technology/uranium-mining.png",
    icon_size = 256,
    effects =
    {
      {
        type = "mining-with-fluid",
        modifier = true
      }
    },
    prerequisites = {"chemical-science-pack", "concrete"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "uranium-processing",
    icon = "__base__/graphics/technology/uranium-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "centrifuge"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-processing"
      }
    },
    prerequisites = {"uranium-mining"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "uranium-ore"
    }
  },
  {
    type = "technology",
    name = "nuclear-power",
    icon = "__base__/graphics/technology/nuclear-power.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nuclear-reactor"
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
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-fuel-cell"
      }
    },
    prerequisites = {"uranium-processing"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30,
      count = 800
    }
  },
  {
    type = "technology",
    name = "kovarex-enrichment-process",
    icon = "__base__/graphics/technology/kovarex-enrichment-process.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "kovarex-enrichment-process"
      },
      {
        type = "unlock-recipe",
        recipe = "nuclear-fuel"
      }
    },
    prerequisites = {"production-science-pack", "uranium-processing", "rocket-fuel"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 1500
    }
  },
  {
    type = "technology",
    name = "nuclear-fuel-reprocessing",
    icon = "__base__/graphics/technology/nuclear-fuel-reprocessing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nuclear-fuel-reprocessing"
      }
    },
    prerequisites = {"nuclear-power", "production-science-pack"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 50
    }
  },
  {
    type = "technology",
    name = "mining-productivity-1",
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.1
      }
    },
    prerequisites = {"advanced-circuit"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "mining-productivity-2",
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.1
      }
    },
    prerequisites = {"mining-productivity-1", "chemical-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "mining-productivity-3",
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.1
      }
    },
    prerequisites = {"mining-productivity-2", "production-science-pack", "utility-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "mining-productivity-4",
    icons = util.technology_icon_constant_productivity("__base__/graphics/technology/mining-productivity.png"),
    effects =
    {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.1
      }
    },
    prerequisites = {"mining-productivity-3", "space-science-pack"},
    unit =
    {
      count_formula = "2500*(L - 3)",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "artillery",
    icon = "__base__/graphics/technology/artillery.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "artillery-wagon"
      },
      {
        type = "unlock-recipe",
        recipe = "artillery-turret"
      },
      {
        type = "unlock-recipe",
        recipe = "artillery-shell"
      }
    },
    prerequisites = {"military-4", "tank", "concrete", "radar"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30,
      count = 2000
    }
  },
  {
    type = "technology",
    name = "spidertron",
    icon = "__base__/graphics/technology/spidertron.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "spidertron"
      }
    },
    prerequisites = {"military-4", "exoskeleton-equipment", "fission-reactor-equipment", "rocketry", "efficiency-module-3", "radar"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30,
      count = 2500
    }
  },
  {
    type = "technology",
    name = "circuit-network",
    icon = "__base__/graphics/technology/circuit-network.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-circuit-network",
        modifier = true
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
      },
      {
        type = "unlock-recipe",
        recipe = "display-panel"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-stick"
      }
    },
    prerequisites = {"logistic-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    }
  },

  {
    type = "technology",
    name = "advanced-combinators",
    icon = "__base__/graphics/technology/advanced-combinators.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "selector-combinator"
      }
    },
    prerequisites = {"circuit-network", "chemical-science-pack"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
})

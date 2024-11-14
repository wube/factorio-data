local physical_projectile_damage_1_icon = "__base__/graphics/technology/physical-projectile-damage-1.png"
local physical_projectile_damage_2_icon = "__base__/graphics/technology/physical-projectile-damage-2.png"
local stronger_explosives_1_icon = "__base__/graphics/technology/stronger-explosives-1.png"
local stronger_explosives_2_icon = "__base__/graphics/technology/stronger-explosives-2.png"
local stronger_explosives_3_icon = "__base__/graphics/technology/stronger-explosives-3.png"
local refined_flammables_icon = "__base__/graphics/technology/refined-flammables.png"
local laser_weapons_damage_1_icon = "__base__/graphics/technology/laser-weapons-damage.png"
local laser_weapons_damage_2_icon = "__base__/graphics/technology/laser-weapons-damage.png"
local laser_weapons_damage_3_icon = "__base__/graphics/technology/laser-weapons-damage.png"
local electric_weapons_damage_1_icon = "__space-age__/graphics/technology/electric-weapons-damage.png"
local electric_weapons_damage_2_icon = "__space-age__/graphics/technology/electric-weapons-damage.png"
local electric_weapons_damage_3_icon = "__space-age__/graphics/technology/electric-weapons-damage.png"
local weapon_shooting_speed_1_icon = "__base__/graphics/technology/weapon-shooting-speed-1.png"
local weapon_shooting_speed_2_icon = "__base__/graphics/technology/weapon-shooting-speed-2.png"
local weapon_shooting_speed_3_icon = "__base__/graphics/technology/weapon-shooting-speed-3.png"
local laser_shooting_speed_icon = "__base__/graphics/technology/laser-shooting-speed.png"

data:extend(
{
  {
    type = "technology",
    name = "space-platform",
    icon = "__space-age__/graphics/technology/space-platform.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "asteroid-collector"
      },
      {
        type = "unlock-recipe",
        recipe = "crusher"
      },
      {
        type = "unlock-recipe",
        recipe = "metallic-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "carbonic-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "oxide-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-bay"
      }
    },
    prerequisites = {"rocket-silo"},
    research_trigger = {type = "create-space-platform"}
  },

  {
    type = "technology",
    name = "electric-weapons-damage-1",
    icons = util.technology_icon_constant_damage(electric_weapons_damage_1_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "beam",
        modifier = 0.3
      }
    },
    prerequisites = {"destroyer"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "electric-weapons-damage-2",
    icons = util.technology_icon_constant_damage(electric_weapons_damage_2_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "beam",
        modifier = 0.4
      }
    },
    prerequisites = {"electric-weapons-damage-1", "space-science-pack"},
    unit =
    {
      count = 500,
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
    upgrade = true
  },
  {
    type = "technology",
    name = "electric-weapons-damage-3",
    icons = util.technology_icon_constant_damage(electric_weapons_damage_3_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "tesla",
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
    prerequisites = {"electric-weapons-damage-2",  "tesla-weapons"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "electric-weapons-damage-4",
    icons = util.technology_icon_constant_damage(electric_weapons_damage_3_icon),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "tesla",
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
    prerequisites = {"electric-weapons-damage-3"},
    unit =
    {
      count_formula = "2^(L-3)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },

})

data:extend(
{
  {
    type = "technology",
    name = "artillery-shell-damage-1",
    icons = util.technology_icon_constant_damage("__space-age__/graphics/technology/artillery-damage.png"),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "artillery-shell",
        modifier = 0.1
      }
    },
    prerequisites = {"artillery"},
    unit =
    {
      count_formula = "2^(L-1)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite"
  },
  {
    type = "technology",
    name = "railgun-shooting-speed-1",
    icons = util.technology_icon_constant_speed("__space-age__/graphics/technology/railgun-shooting-speed.png"),
    effects =
    {
      {
        type = "gun-speed",
        ammo_category = "railgun",
        icon = "__space-age__/graphics/icons/railgun-ammo.png",
        icon_size = 64,
        modifier = 0.2
      },
    },
    prerequisites = {"railgun"},
    unit =
    {
      count_formula = "2^(L-1)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite"
  },
  {
    type = "technology",
    name = "railgun-damage-1",
    icons = util.technology_icon_constant_damage("__space-age__/graphics/technology/railgun-damage.png"),
    effects =
    {
      {
        type = "ammo-damage",
        ammo_category = "railgun",
        modifier = 0.4
      }
    },
    prerequisites = {"railgun"},
    unit =
    {
      count_formula = "2^(L-1)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite"
  },
})

data:extend(
{
  {
    type = "technology",
    name = "space-platform-thruster",
    icon = "__space-age__/graphics/technology/space-platform-thruster.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thruster"
      },
      {
        type = "unlock-recipe",
        recipe = "ice-melting"
      },
      {
        type = "unlock-recipe",
        recipe = "thruster-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "thruster-oxidizer"
      },
    },
    prerequisites = {"space-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-vulcanus",
    icons = util.technology_icon_constant_planet("__space-age__/graphics/technology/vulcanus.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "vulcanus",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {"space-platform-thruster"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-gleba",
    icons = util.technology_icon_constant_planet("__space-age__/graphics/technology/gleba.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "gleba",
        use_icon_overlay_constant = true
      },
    },
    prerequisites = {"space-platform-thruster", "landfill"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-fulgora",
    icons = util.technology_icon_constant_planet("__space-age__/graphics/technology/fulgora.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "fulgora",
        use_icon_overlay_constant = true
      },
      {
        type = "unlock-recipe",
        recipe = "lightning-rod",
      },
    },
    prerequisites = {"space-platform-thruster", "electric-energy-accumulators"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-aquilo",
    icons = util.technology_icon_constant_planet("__space-age__/graphics/technology/aquilo.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "aquilo",
        use_icon_overlay_constant = true
      },
      {
        type = "unlock-recipe",
        recipe = "ammoniacal-solution-separation",
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-ammonia"
      },
      {
        type = "unlock-recipe",
        recipe = "ammonia-rocket-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "ice-platform",
      }
    },
    prerequisites = {"rocket-turret", "advanced-asteroid-processing", "heating-tower", "asteroid-reprocessing", "electromagnetic-science-pack"},
    unit =
    {
      count = 3000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "worker-robots-speed-7",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.65
      }
    },
    prerequisites = {"worker-robots-speed-6", "electromagnetic-science-pack"},
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
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "battery-mk3-equipment",
    icons = util.technology_icon_constant_equipment("__space-age__/graphics/technology/battery-mk3-equipment.png"),
    prerequisites = {"battery-mk2-equipment", "electromagnetic-science-pack"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "battery-mk3-equipment"
      }
    },
    unit =
    {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  }
})

data:extend(
{
  {
    type = "technology",
    name = "rocket-turret",
    icon = "__space-age__/graphics/technology/rocket-turret.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-turret"
      },
      {
        type = "unlock-recipe",
        recipe = "coal-synthesis"
      }
    },
    prerequisites = {"rocketry", "carbon-fiber", "stronger-explosives-2"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 30,
      count = 1000
    }
  },
  {
    type = "technology",
    name = "toolbelt-equipment",
    icons = util.technology_icon_constant_equipment("__space-age__/graphics/technology/toolbelt-equipment.png"),
    prerequisites = {"power-armor", "toolbelt", "carbon-fiber"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "toolbelt-equipment"
      }
    },
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "calcite-processing",
    icon = "__space-age__/graphics/technology/calcite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "acid-neutralisation"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-condensation"
      },
      {
        type = "unlock-recipe",
        recipe = "simple-coal-liquefaction"
      },
    },
    prerequisites = {"planet-discovery-vulcanus"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "calcite"
    }
  },
  {
    type = "technology",
    name = "tungsten-carbide",
    icon = "__space-age__/graphics/technology/tungsten-carbide.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "carbon"
      },
      {
        type = "unlock-recipe",
        recipe = "tungsten-carbide"
      }
    },
    prerequisites = {"planet-discovery-vulcanus"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "big-volcanic-rock"
    }
  },
  {
    type = "technology",
    name = "big-mining-drill",
    icon = "__space-age__/graphics/technology/big-mining-drill.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "big-mining-drill"
      }
    },
    prerequisites = {"foundry", "electric-mining-drill"},
    research_trigger =
    {
      type = "craft-item",
      item = "foundry"
    }
  },
  {
    type = "technology",
    name = "foundry",
    icon = "__space-age__/graphics/technology/foundry.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "foundry"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-iron-from-lava"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-copper-from-lava"
      },
      {
        type = "unlock-recipe",
        recipe = "concrete-from-molten-iron"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-low-density-structure"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-iron"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-copper"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-iron"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-steel"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-copper"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-iron-gear-wheel"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-iron-stick"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-pipe-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-copper-cable"
      },
    },
    prerequisites = {"calcite-processing", "tungsten-carbide"},
    research_trigger =
    {
      type = "craft-item",
      item = "tungsten-carbide"
    }
  },
  {
    type = "technology",
    name = "tungsten-steel",
    icon = "__space-age__/graphics/technology/tungsten-steel.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tungsten-plate"
      },
    },
    prerequisites = {"big-mining-drill"},
    research_trigger =
    {
      type = "craft-item",
      item = "big-mining-drill"
    }
  },
  {
    type = "technology",
    name = "turbo-transport-belt",
    icon = "__space-age__/graphics/technology/turbo-transport-belt.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "turbo-transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "turbo-underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "turbo-splitter"
      },
    },
    prerequisites = {"metallurgic-science-pack", "logistics-3"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "metallurgic-science-pack",
    icon = "__space-age__/graphics/technology/metallurgic-science-pack.png",
    icon_size = 256,
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "metallurgic-science-pack"
      },
    },
    prerequisites = {"tungsten-steel"},
    research_trigger =
    {
      type = "craft-item",
      item = "tungsten-plate"
    }
  },

  {
    type = "technology",
    name = "railgun",
    icon = "__space-age__/graphics/technology/railgun.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "railgun"
      },
      {
        type = "unlock-recipe",
        recipe = "railgun-turret"
      },
      {
        type = "unlock-recipe",
        recipe = "railgun-ammo"
      },
    },
    prerequisites = {"quantum-processor"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "mech-armor",
    icon = "__space-age__/graphics/technology/mech-armor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mech-armor"
      },
    },
    prerequisites = {"electromagnetic-science-pack", "power-armor-mk2"},
    unit =
    {
      count = 5000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "agriculture",
    icon = "__space-age__/graphics/technology/agriculture.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "agricultural-tower"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-spoilage"
      }
    },
    prerequisites = {"planet-discovery-gleba"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "iron-stromatolite"
    }
  },

  {
    type = "technology",
    name = "yumako",
    icon = "__space-age__/graphics/technology/yumako.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "yumako-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-bacteria"
      }
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "yumako-tree"
    }
  },

  {
    type = "technology",
    name = "biochamber",
    icon = "__space-age__/graphics/technology/biochamber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "biochamber"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-yumako-mash"
      },
      {
        type = "unlock-recipe",
        recipe = "burnt-spoilage"
      },
      {
        type = "unlock-recipe",
        recipe = "pentapod-egg"
      }
    },
    prerequisites = {"yumako", "jellynut"},
    research_trigger =
    {
      type = "craft-item",
      item = "nutrients",
      count = 10
    }
  },

  {
    type = "technology",
    name = "jellynut",
    icon = "__space-age__/graphics/technology/jellynut.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "jellynut-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-bacteria"
      }
    },
    prerequisites = {"agriculture"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "jellystem"
    }
  },

  {
    type = "technology",
    name = "bioflux",
    icon = "__space-age__/graphics/technology/bioflux.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bioflux"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-bioflux"
      }
    },
    prerequisites = {"biochamber"},
    research_trigger =
    {
      type = "craft-item",
      item = "biochamber"
    }
  },

  {
    type = "technology",
    name = "artificial-soil",
    icon = "__space-age__/graphics/technology/artificial-soil.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "artificial-yumako-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "artificial-jellynut-soil"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      item = "nutrients",
      count = 500
    },
    prerequisites = {"yumako", "jellynut"}
  },

  {
    type = "technology",
    name = "bacteria-cultivation",
    icon = "__space-age__/graphics/technology/bacteria-cultivation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "copper-bacteria-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-bacteria-cultivation"
      }
    },
    prerequisites = {"bioflux"},
    research_trigger =
    {
      type = "craft-item",
      item = "bioflux"
    }
  },

  {
    type = "technology",
    name = "bioflux-processing",
    icon = "__space-age__/graphics/technology/bioflux-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bioplastic"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-fuel-from-jelly"
      },
      {
        type = "unlock-recipe",
        recipe = "biosulfur"
      },
      {
        type = "unlock-recipe",
        recipe = "biolubricant"
      }
    },
    prerequisites = {"bioflux"},
    research_trigger =
    {
      type = "craft-item",
      item = "bioflux",
      count = 25
    }
  },

  {
    type = "technology",
    name = "agricultural-science-pack",
    icon = "__space-age__/graphics/technology/agricultural-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "agricultural-science-pack"
      },
    },
    prerequisites = {"bioflux-processing", "bacteria-cultivation", "artificial-soil"},
    research_trigger =
    {
      type = "craft-item",
      item = "bioflux",
      count = 100
    }
  },


  {
    type = "technology",
    name = "tree-seeding",
    icon = "__space-age__/graphics/technology/tree-seeding.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "wood-processing"
      }
    },
    prerequisites = {"agricultural-science-pack"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack",   1},
        {"logistic-science-pack",     1},
        {"chemical-science-pack",     1},
        {"space-science-pack",        1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },


  {
    type = "technology",
    name = "stack-inserter",
    icon = "__space-age__/graphics/technology/stack-inserter.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "stack-inserter"
      },
      {
        type = "belt-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"carbon-fiber", "production-science-pack", "utility-science-pack", "bulk-inserter"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack",   1},
        {"logistic-science-pack",     1},
        {"chemical-science-pack",     1},
        {"production-science-pack",   1},
        {"utility-science-pack",      1},
        {"space-science-pack",        1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "transport-belt-capacity-1",
    localised_description = {"technology-description.belt-capacity"},
    icons = util.technology_icon_constant_stack_size("__space-age__/graphics/technology/transport-belt-capacity.png"),
    effects =
    {
      {
        type = "belt-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"stack-inserter"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1}
      },
      time = 60
    },
    upgrade = true
  },

  {
    type = "technology",
    name = "transport-belt-capacity-2",
    localised_description = {"technology-description.belt-capacity"},
    icons = util.technology_icon_constant_stack_size("__space-age__/graphics/technology/transport-belt-capacity.png"),
    effects =
    {
      {
        type = "belt-stack-size-bonus",
        modifier = 1
      },
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      }
    },
    prerequisites = {"transport-belt-capacity-1"},
    unit =
    {
      count = 3000,
      ingredients =
      {
        {"automation-science-pack",      1},
        {"logistic-science-pack",        1},
        {"chemical-science-pack",        1},
        {"production-science-pack",      1},
        {"utility-science-pack",         1},
        {"space-science-pack",           1},
        {"agricultural-science-pack",    1}
      },
      time = 60
    },
    upgrade = true
  },

  {
    type = "technology",
    name = "captivity",
    icon = "__space-age__/graphics/technology/captivity.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "capture-robot-rocket"
      },
      {
        type = "unlock-recipe",
        recipe = "biter-egg"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-biter-egg"
      }
    },
    prerequisites = {"agricultural-science-pack", "military-3", "rocketry"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}

      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "biolab",
    icon = "__space-age__/graphics/technology/biolab.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "biolab"
      }
    },
    prerequisites = {"biter-egg-handling", "production-science-pack", "utility-science-pack", "uranium-processing"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}

      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "biter-egg-handling",
    icon = "__space-age__/graphics/technology/biter-egg-handling.png",
    icon_size = 256,
    prerequisites = {"captivity"},
    research_trigger =
    {
      type = "capture-spawner"
    }
  },

  {
    type = "technology",
    name = "overgrowth-soil",
    icon = "__space-age__/graphics/technology/overgrowth-soil.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "overgrowth-yumako-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "overgrowth-jellynut-soil"
      }
    },
    prerequisites = {"biter-egg-handling", "production-science-pack", "utility-science-pack"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "carbon-fiber",
    icon = "__space-age__/graphics/technology/carbon-fiber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "carbon-fiber",
      },
    },
    prerequisites = {"agricultural-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "health",
    icon = "__space-age__/graphics/technology/health.png",
    icon_size = 256,
    effects =
    {
      {type = "character-health-bonus", modifier = 50}
    },
    prerequisites = {"agricultural-science-pack", "utility-science-pack", "military-science-pack"},
    unit =
    {
      count_formula = "2^L*50",
      ingredients =
      {
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite"
  },
  {
    type = "technology",
    name = "fish-breeding",
    icon = "__space-age__/graphics/technology/fish-breeding.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fish-breeding"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-fish"
      }
    },
    prerequisites = {"tree-seeding"},
    unit =
    {
      count_formula = "500",
      ingredients =
      {
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "holmium-processing",
    icon = "__space-age__/graphics/technology/holmium-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "holmium-solution",
      },
      {
        type = "unlock-recipe",
        recipe = "holmium-plate",
      },
    },
    prerequisites = {"recycling"},
    research_trigger =
    {
      type = "craft-item",
      item = "holmium-ore"
    }
  },

  {
    type = "technology",
    name = "electromagnetic-plant",
    icon = "__space-age__/graphics/technology/electromagnetic-plant.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electromagnetic-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "superconductor",
      },
      {
        type = "unlock-recipe",
        recipe = "supercapacitor",
      },
      {
        type = "unlock-recipe",
        recipe = "electrolyte",
      },
    },
    prerequisites = {"holmium-processing"},
    research_trigger =
    {
      type = "craft-item",
      item = "holmium-plate",
      count = 50
    }
  },

  {
    type = "technology",
    name = "electromagnetic-science-pack",
    icon = "__space-age__/graphics/technology/electromagnetic-science-pack.png",
    icon_size = 256,
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electromagnetic-science-pack",
      },
    },
    prerequisites = {"electromagnetic-plant"},
    research_trigger =
    {
      type = "craft-item",
      item = "supercapacitor"
    }
  },

  {
    type = "technology",
    name = "lightning-collector",
    icon = "__space-age__/graphics/technology/lightning-collector.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lightning-collector",
      },
    },
    prerequisites = {"electromagnetic-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "rail-support-foundations",
    icon = "__space-age__/graphics/technology/rail-support-foundations.png",
    icon_size = 256,
    effects =
    {
      {
        type = "rail-support-on-deep-oil-ocean",
        modifier = true
      }
    },
    prerequisites = {"electromagnetic-science-pack", "utility-science-pack", "metallurgic-science-pack", "elevated-rail"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 30
    }
  },

  {
    type = "technology",
    name = "tesla-weapons",
    icon = "__space-age__/graphics/technology/tesla-weapons.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "teslagun",
      },
      {
        type = "unlock-recipe",
        recipe = "tesla-turret",
      },
      {
        type = "unlock-recipe",
        recipe = "tesla-ammo",
      },
    },
    prerequisites = {"electromagnetic-science-pack", "military-4"},
    unit =
    {
      count = 1500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "heating-tower",
    icon = "__space-age__/graphics/technology/heating-tower.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "heating-tower"
      },
      {
        type = "unlock-recipe",
        recipe = "heat-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "heat-exchanger"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-turbine"
      }
    },
    prerequisites = {"planet-discovery-gleba"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "copper-stromatolite"
    }
  },
  {
    type = "technology",
    name = "lithium-processing",
    icon = "__space-age__/graphics/technology/lithium-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lithium"
      },
      {
        type = "unlock-recipe",
        recipe = "lithium-plate"
      }
    },
    prerequisites = {"planet-discovery-aquilo"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "lithium-iceberg-big"
    }
  },

  {
    type = "technology",
    name = "cryogenic-plant",
    icon = "__space-age__/graphics/technology/cryogenic-plant.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cryogenic-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "fluoroketone"
      },
      {
        type = "unlock-recipe",
        recipe = "fluoroketone-cooling"
      }
    },
    prerequisites = {"lithium-processing"},
    research_trigger =
    {
      type = "craft-item",
      item = "lithium-plate"
    }
  },


  {
    type = "technology",
    name = "asteroid-reprocessing",
    icon = "__space-age__/graphics/technology/asteroid-reprocessing.png",
    icon_size = 256,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "metallic-asteroid-reprocessing"
      },
      {
        type = "unlock-recipe",
        recipe = "oxide-asteroid-reprocessing"
      },
      {
        type = "unlock-recipe",
        recipe = "carbonic-asteroid-reprocessing"
      },
    },
    prerequisites = {"metallurgic-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "advanced-asteroid-processing",
    icon = "__space-age__/graphics/technology/advanced-asteroid-processing.png",
    icon_size = 256,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-metallic-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-carbonic-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-oxide-asteroid-crushing"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-thruster-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-thruster-oxidizer"
      }
    },
    prerequisites = {"agricultural-science-pack", "production-science-pack", "utility-science-pack"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "quantum-processor",
    icon = "__space-age__/graphics/technology/quantum-processor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "quantum-processor",
      },
    },
    prerequisites = {"biter-egg-handling", "cryogenic-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "cryogenic-science-pack",
    icon = "__space-age__/graphics/technology/cryogenic-science-pack.png",
    icon_size = 256,
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cryogenic-science-pack",
      },
    },
    prerequisites = {"cryogenic-plant"},
    research_trigger =
    {
      type = "craft-item",
      item = "cryogenic-plant"
    }
  },

  {
    type = "technology",
    name = "fusion-reactor",
    icon = "__space-age__/graphics/technology/fusion-reactor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fusion-reactor"
      },
      {
        type = "unlock-recipe",
        recipe = "fusion-generator"
      },
      {
        type = "unlock-recipe",
        recipe = "fusion-power-cell",
      }
    },
    prerequisites = {"quantum-processor"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "fusion-reactor-equipment",
    icons = util.technology_icon_constant_equipment("__space-age__/graphics/technology/fusion-reactor-equipment.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fusion-reactor-equipment"
      }
    },
    prerequisites = {"fusion-reactor", "fission-reactor-equipment"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "captive-biter-spawner",
    icon = "__space-age__/graphics/technology/captive-biter-spawner.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "captive-biter-spawner"
      }
    },
    prerequisites = {"cryogenic-science-pack", "biter-egg-handling", "kovarex-enrichment-process"},
    unit =
    {
      count = 3000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "promethium-science-pack",
    icon = "__space-age__/graphics/technology/promethium-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "solar-system-edge"
      },
      {
        type = "unlock-space-location",
        space_location = "shattered-planet"
      },
      {
        type = "unlock-recipe",
        recipe = "promethium-science-pack",
      },
    },
    prerequisites = {"fusion-reactor"},
    unit =
    {
      count_formula = "2000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "foundation",
    icon = "__space-age__/graphics/technology/foundation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "foundation",
      }
    },
    prerequisites = {"cryogenic-science-pack"},
    unit =
    {
      count_formula = "2000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "asteroid-productivity",
    icons = util.technology_icon_constant_productivity("__space-age__/graphics/technology/asteroid-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "carbonic-asteroid-crushing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "oxide-asteroid-crushing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "metallic-asteroid-crushing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "advanced-carbonic-asteroid-crushing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "advanced-oxide-asteroid-crushing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "advanced-metallic-asteroid-crushing",
        change = 0.1
      }
    },
    prerequisites = {"advanced-asteroid-processing"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "research-productivity",
    icon = "__space-age__/graphics/technology/research-productivity.png",
    icon_size = 256,
    icon_size = 256,
    effects =
    {
      {
        type = "laboratory-productivity",
        modifier = 0.10
      },
    },
    prerequisites = {"promethium-science-pack"},
    unit =
    {
      count_formula = "1.2^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"cryogenic-science-pack", 1},
        {"promethium-science-pack", 1}
      },
      time = 120
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "processing-unit-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/processing-unit-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "processing-unit",
        change = 0.1
      }
    },
    prerequisites = {"electromagnetic-science-pack", "production-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"electromagnetic-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "scrap-recycling-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/scrap-recycling-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "scrap-recycling",
        change = 0.1
      }
    },
    prerequisites = {"electromagnetic-science-pack", "production-science-pack"},
    unit =
    {
      count_formula = "1.5^L*500",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"electromagnetic-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "steel-plate-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/steel-plate-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "steel-plate",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "casting-steel",
        change = 0.1
      }
    },
    prerequisites = {"production-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "low-density-structure-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/low-density-structure-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "low-density-structure",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "casting-low-density-structure",
        change = 0.1
      }
    },
    prerequisites = {"production-science-pack", "metallurgic-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"metallurgic-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "plastic-bar-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/plastics-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "plastic-bar",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "bioplastic",
        change = 0.1
      },
    },
    prerequisites = {"agricultural-science-pack", "production-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "rocket-fuel-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/rocket-fuel-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "rocket-fuel",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "rocket-fuel-from-jelly",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "ammonia-rocket-fuel",
        change = 0.1
      }
    },
    prerequisites = {"agricultural-science-pack", "production-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "rocket-part-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__space-age__/graphics/technology/rocket-part-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "rocket-part",
        change = 0.1
      }
    },
    prerequisites = {"cryogenic-science-pack"},
    unit =
    {
      count_formula = "1.5^L*2000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"cryogenic-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  }
}
)

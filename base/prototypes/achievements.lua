data:extend(
{
  {
    type = "build-entity-achievement",
    name = "automate-this",
    order = "a[progress]-a[automate-this]",
    to_build = "assembling-machine-1",
    icon = "__base__/graphics/achievement/automate-this.png",
    icon_size = 128
  },
  {
    type = "build-entity-achievement",
    name = "getting-on-track",
    order = "a[progress]-b[getting-on-track]",
    to_build = "locomotive",
    icon = "__base__/graphics/achievement/getting-on-track.png",
    icon_size = 128
  },
  {
    type = "build-entity-achievement",
    name = "arachnophilia",
    order = "a[progress]-c[arachnophilia]",
    to_build = "spidertron",
    icon = "__base__/graphics/achievement/arachnophilia.png",
    icon_size = 128
  },
  {
    type = "research-achievement",
    name = "eco-unfriendly",
    order = "a[progress]-d[eco-unfriendly]",
    technology = "oil-processing",
    icon = "__base__/graphics/achievement/eco-unfriendly.png",
    icon_size = 128
  },
  {
    type = "use-entity-in-energy-production-achievement",
    name = "steam-power",
    order = "a[progress]-e[energy-production]-a[steam]",
    entity = "steam-engine",
    icon = "__base__/graphics/achievement/steam-power.png",
    icon_size = 128,
  },
  {
    type = "use-entity-in-energy-production-achievement",
    name = "solar-power",
    order = "a[progress]-e[energy-production]-b[solar]",
    entity = "solar-panel",
    icon = "__base__/graphics/achievement/solar-power.png",
    icon_size = 128,
  },
  {
    type = "use-entity-in-energy-production-achievement",
    name = "nuclear-power",
    order = "a[progress]-e[energy-production]-c[nuclear]",
    entity = "steam-turbine",
    consumed_condition = "uranium-fuel-cell",
    icon = "__base__/graphics/achievement/nuclear-power.png",
    icon_size = 128,
  },
  {
    type = "produce-achievement",
    name = "crafting-with-speed",
    order = "a[progress]-h[crafting-tier-3-module]-a[speed]",
    item_product = "speed-module-3",
    amount = 1,
    limited_to_one_game = false,
    icon = "__base__/graphics/achievement/crafting-with-speed.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "crafting-with-efficiency",
    order = "a[progress]-h[crafting-tier-3-module]-b[efficiency]",
    item_product = "efficiency-module-3",
    amount = 1,
    limited_to_one_game = false,
    icon = "__base__/graphics/achievement/crafting-with-efficiency.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "crafting-with-productivity",
    order = "a[progress]-h[crafting-tier-3-module]-c[productivity]",
    item_product = "productivity-module-3",
    amount = 1,
    limited_to_one_game = false,
    icon = "__base__/graphics/achievement/crafting-with-productivity.png",
    icon_size = 128
  },
  {
    type = "complete-objective-achievement",
    name = "smoke-me-a-kipper-i-will-be-back-for-breakfast",
    order = "a[progress]-x[finish-game]-a[base]",
    objective_condition = "rocket-launched",
    icon = "__base__/graphics/achievement/smoke-me-a-kipper-i-will-be-back-for-breakfast.png",
    icon_size = 128
  },
  {
    type = "group-attack-achievement",
    name = "it-stinks-and-they-dont-like-it",
    order = "b[exploration]-a[it-stinks-and-they-dont-like-it]",
    amount = 1,
    entities =
    {
      "small-biter",
      "medium-biter",
      "big-biter",
      "behemoth-biter",
      "small-spitter",
      "medium-spitter",
      "big-spitter",
      "behemoth-spitter"
    },
    icon = "__base__/graphics/achievement/it-stinks-and-they-dont-like-it.png",
    icon_size = 128
  },
  {
    type = "construct-with-robots-achievement",
    name = "automated-construction",
    order = "b[exploration]-b[construct-with-robots]-a[100]",
    amount = 100,
    limited_to_one_game = false,
    steam_stats_name = "constructed-by-robots",
    icon = "__base__/graphics/achievement/automated-construction.png",
    icon_size = 128
  },
  {
    type = "construct-with-robots-achievement",
    name = "you-are-doing-it-right",
    order = "b[exploration]-b[construct-with-robots]-b[more-than-manually]",
    more_than_manually = true,
    limited_to_one_game = true,
    icon = "__base__/graphics/achievement/you-are-doing-it-right.png",
    icon_size = 128
  },
  {
    type = "deconstruct-with-robots-achievement",
    name = "automated-cleanup",
    order = "b[exploration]-c[deconstruct-with-robots]",
    amount = 100,
    steam_stats_name = "deconstructed-by-robots",
    icon = "__base__/graphics/achievement/automated-cleanup.png",
    icon_size = 128
  },
  {
    type = "deliver-by-robots-achievement",
    name = "you-have-got-a-package",
    order = "b[exploration]-d[deliver-by-robots]-a",
    amount = 1,
    icon = "__base__/graphics/achievement/you-have-got-a-package.png",
    icon_size = 128
  },
  {
    type = "deliver-by-robots-achievement",
    name = "delivery-service",
    order = "b[exploration]-d[deliver-by-robots]-b",
    amount = 10000,
    steam_stats_name = "delivered-by-robots",
    icon = "__base__/graphics/achievement/delivery-service.png",
    icon_size = 128
  },
  {
    type = "train-path-achievement",
    name = "trans-factorio-express",
    order = "b[exploration]-e[train-path]",
    minimum_distance = 1000,
    steam_stats_name = "longest-train-path",
    icon = "__base__/graphics/achievement/trans-factorio-express.png",
    icon_size = 128
  },
  {
    type = "player-damaged-achievement",
    name = "watch-your-step",
    order = "b[exploration]-f[watch-your-step]",
    type_of_dealer = "locomotive",
    minimum_damage = 0,
    should_survive = false,
    icon = "__base__/graphics/achievement/watch-your-step.png",
    icon_size = 128
  },
  {
    type = "player-damaged-achievement",
    name = "golem",
    order = "b[exploration]-g[golem]",
    should_survive = true,
    minimum_damage = 500,
    steam_stats_name = "surived-damage-in-one-hit",
    icon = "__base__/graphics/achievement/golem.png",
    icon_size = 128
  },
  {
    type = "deplete-resource-achievement",
    name = "mining-with-determination",
    order = "b[exploration]-h[mining-with-determination]",
    icon = "__base__/graphics/achievement/mining-with-determination.png",
    icon_size = 128
  },
  {
    type = "build-entity-achievement",
    name = "getting-on-track-like-a-pro",
    order = "c[teaching]-a[getting-on-track-like-a-pro]",
    to_build = "locomotive",
    within = 90 * minute,
    icon = "__base__/graphics/achievement/getting-on-track-like-a-pro.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "mass-production-1",
    order = "d[production]-b[electronic-circuit-production]-a",
    item_product = "electronic-circuit",
    amount = 10000,
    limited_to_one_game = false,
    steam_stats_name = "electronic-circuits-production-overall",
    icon = "__base__/graphics/achievement/mass-production-1.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "mass-production-2",
    order = "d[production]-b[electronic-circuit-production]-b",
    item_product = "electronic-circuit",
    amount = 1000000,
    limited_to_one_game = false,
    steam_stats_name = "electronic-circuits-production-overall",
    icon = "__base__/graphics/achievement/mass-production-2.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "mass-production-3",
    order = "d[production]-b[electronic-circuit-production]-c",
    item_product = "electronic-circuit",
    amount = 20000000,
    limited_to_one_game = false,
    steam_stats_name = "electronic-circuits-production-overall",
    icon = "__base__/graphics/achievement/mass-production-3.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "circuit-veteran-1",
    order = "d[production]-c[advanced-circuit-production]-a",
    item_product = "advanced-circuit",
    amount = 1000,
    steam_stats_name = "advanced-circuits-per-hour",
    icon = "__base__/graphics/achievement/circuit-veteran-1.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "circuit-veteran-2",
    order = "d[production]-c[advanced-circuit-production]-b",
    item_product = "advanced-circuit",
    amount = 10000,
    steam_stats_name = "advanced-circuits-per-hour",
    icon = "__base__/graphics/achievement/circuit-veteran-2.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "circuit-veteran-3",
    order = "d[production]-c[advanced-circuit-production]-c",
    item_product = "advanced-circuit",
    amount = 25000,
    steam_stats_name = "advanced-circuits-per-hour",
    icon = "__base__/graphics/achievement/circuit-veteran-3.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "computer-age-1",
    order = "d[production]-d[processing-unit-production]-a",
    item_product = "processing-unit",
    amount = 500,
    steam_stats_name = "processing-units-per-hour",
    icon = "__base__/graphics/achievement/computer-age-1.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "computer-age-2",
    order = "d[production]-d[processing-unit-production]-b",
    item_product = "processing-unit",
    amount = 1000,
    steam_stats_name = "processing-units-per-hour",
    icon = "__base__/graphics/achievement/computer-age-2.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "computer-age-3",
    order = "d[production]-d[processing-unit-production]-c",
    item_product = "processing-unit",
    amount = 5000,
    steam_stats_name = "processing-units-per-hour",
    icon = "__base__/graphics/achievement/computer-age-3.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "iron-throne-1",
    order = "d[production]-e[iron-throne-1]",
    item_product = "iron-plate",
    amount = 20000,
    steam_stats_name = "iron-plates-per-hour",
    icon = "__base__/graphics/achievement/iron-throne-1.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "iron-throne-2",
    order = "d[production]-e[iron-throne-2]",
    item_product = "iron-plate",
    amount = 200000,
    steam_stats_name = "iron-plates-per-hour",
    icon = "__base__/graphics/achievement/iron-throne-2.png",
    icon_size = 128
  },
  {
    type = "produce-per-hour-achievement",
    name = "iron-throne-3",
    order = "d[production]-e[iron-throne-3]",
    item_product = "iron-plate",
    amount = 400000,
    steam_stats_name = "iron-plates-per-hour",
    icon = "__base__/graphics/achievement/iron-throne-3.png",
    icon_size = 128
  },
  {
    type = "dont-use-entity-in-energy-production-achievement",
    name = "solaris",
    order = "d[production]-g[solaris]",
    excluded = {"steam-engine", "steam-turbine"},
    included = "solar-panel",
    minimum_energy_produced = "10GJ",
    last_hour_only = true,
    icon = "__base__/graphics/achievement/solaris.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-automation",
    order = "e[research]-a[research-with]-a[automation]",
    science_pack = "automation-science-pack",
    icon = "__base__/graphics/achievement/research-with-automation.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-logistics",
    order = "e[research]-a[research-with]-b[logistics]",
    science_pack = "logistic-science-pack",
    icon = "__base__/graphics/achievement/research-with-logistics.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-military",
    order = "e[research]-a[research-with]-c[military]",
    science_pack = "military-science-pack",
    icon = "__base__/graphics/achievement/research-with-military.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-chemicals",
    order = "e[research]-a[research-with]-d[chemicals]",
    science_pack = "chemical-science-pack",
    icon = "__base__/graphics/achievement/research-with-chemicals.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-production",
    order = "e[research]-a[research-with]-e[production]",
    science_pack = "production-science-pack",
    icon = "__base__/graphics/achievement/research-with-production.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-utility",
    order = "e[research]-a[research-with]-f[utility]",
    science_pack = "utility-science-pack",
    icon = "__base__/graphics/achievement/research-with-utility.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-space",
    order = "e[research]-a[research-with]-g[space]",
    science_pack = "space-science-pack",
    icon = "__base__/graphics/achievement/research-with-space.png",
    icon_size = 128
  },
  {
    type = "research-achievement",
    name = "tech-maniac",
    order = "e[research]-b[tech-maniac]",
    research_all = true,
    icon = "__base__/graphics/achievement/tech-maniac.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "pest-control",
    order = "f[kill]-a[pest-control]",
    to_kill = {"biter-spawner", "spitter-spawner"},
    personally = false,
    amount = 1,
    icon = "__base__/graphics/achievement/pest-control.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "steamrolled",
    order = "f[kill]-b[steamrolled]",
    type_to_kill = "unit-spawner",
    damage_type = "impact",
    in_vehicle = true,
    personally = true,
    amount = 10,
    steam_stats_name = "spawners-killed-by-impact",
    icon = "__base__/graphics/achievement/steamrolled.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "pyromaniac",
    order = "f[kill]-c[pyromaniac]",
    type_to_kill = "tree",
    amount = 10000,
    damage_type = "fire",
    steam_stats_name = "trees-destroyed-by-fire",
    icon = "__base__/graphics/achievement/pyromaniac.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "run-forrest-run",
    order = "f[kill]-d[run-forrest-run]",
    type_to_kill = "tree",
    damage_type = "impact",
    in_vehicle = true,
    personally = true,
    amount = 100,
    steam_stats_name = "trees-destroyed-by-impact",
    icon = "__base__/graphics/achievement/run-forrest-run.png",
    icon_size = 128
  },
  {
    type = "destroy-cliff-achievement",
    name = "terraformer",
    order = "f[kill]-e[terraformer]",
    icon = "__base__/graphics/achievement/terraformer.png",
    icon_size = 128
  },
  {
    type = "shoot-achievement",
    name = "destroyer-of-worlds",
    order = "f[kill]-f[destroyer-of-worlds]",
    ammo_type = "atomic-bomb",
    amount = 1,
    icon = "__base__/graphics/achievement/destroyer-of-worlds.png",
    icon_size = 128
  },
  {
    type = "combat-robot-count-achievement",
    name = "minions",
    order = "f[kill]-g[minions]",
    count = 100,
    steam_stats_name = "combat-robots",
    icon = "__base__/graphics/achievement/minions.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "art-of-siege",
    order = "f[kill]-h[art-of-siege]",
    type_to_kill = "unit-spawner",
    damage_dealer = "artillery-turret",
    amount = 1,
    icon = "__base__/graphics/achievement/art-of-siege.png",
    icon_size = 128
  },
  {
    type = "dont-kill-manually-achievement",
    name = "keeping-your-hands-clean",
    order = "f[kill]-i[keeping-your-hands-clean]",
    type_not_to_kill = "unit-spawner",
    allowed_without_fight = false,
    icon = "__base__/graphics/achievement/keeping-your-hands-clean.png",
    icon_size = 128
  },
  {
    type = "dont-craft-manually-achievement",
    name = "lazy-bastard",
    order = "h[limitation]-a[lazy-bastard]",
    objective_condition = "rocket-launched",
    amount = 111,
    icon = "__base__/graphics/achievement/lazy-bastard.png",
    icon_size = 128
  },
  {
    type = "dont-use-entity-in-energy-production-achievement",
    name = "steam-all-the-way",
    order = "h[limitation]-b[steam-all-the-way]",
    objective_condition = "rocket-launched",
    allowed_without_fight = false,
    excluded = "solar-panel",
    icon = "__base__/graphics/achievement/steam-all-the-way.png",
    icon_size = 128
  },
  {
    type = "dont-build-entity-achievement",
    name = "raining-bullets",
    order = "h[limitation]-c[raining-bullets]",
    objective_condition = "rocket-launched",
    dont_build = "laser-turret",
    allowed_without_fight = false,
    icon = "__base__/graphics/achievement/raining-bullets.png",
    icon_size = 128
  },
  {
    type = "dont-build-entity-achievement",
    name = "logistic-network-embargo",
    order = "h[limitation]-d[logistic-network-embargo]",
    objective_condition = "late-research",
    research_with = {"space-science-pack"},
    dont_build = {"active-provider-chest", "requester-chest", "buffer-chest"},
    icon = "__base__/graphics/achievement/logistic-network-embargo.png",
    icon_size = 128
  },
  {
    type = "complete-objective-achievement",
    name = "no-time-for-chitchat",
    order = "h[limitation]-e[no-time-for-chitchat]",
    objective_condition = "rocket-launched",
    within = 15 * hour,
    allowed_without_fight = false,
    icon = "__base__/graphics/achievement/no-time-for-chitchat.png",
    icon_size = 128
  },
  {
    type = "complete-objective-achievement",
    name = "there-is-no-spoon",
    order = "h[limitation]-f[there-is-no-spoon]",
    objective_condition = "rocket-launched",
    within = 8 * hour,
    allowed_without_fight = false,
    icon = "__base__/graphics/achievement/there-is-no-spoon.png",
    icon_size = 128
  },
  {
    type = "achievement",
    name = "so-long-and-thanks-for-all-the-fish",
    order = "h[secret]-a[so-long-and-thanks-for-all-the-fish]",
    icon = "__base__/graphics/achievement/so-long-and-thanks-for-all-the-fish.png",
    icon_size = 128
  }
})

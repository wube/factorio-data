data:extend(
{
  {
    type = "build-entity-achievement",
    name = "getting-on-track",
    order = "a[progress]-a[getting-on-track]",
    to_build = "locomotive",
    icon = "__base__/graphics/achievement/getting-on-track.png"
  },
  {
    type = "research-achievement",
    name = "eco-unfriendly",
    order = "a[progress]-b[eco-unfriendly]",
    technology = "oil-processing",
    icon = "__base__/graphics/achievement/eco-unfriendly.png"
  },
  {
    type = "research-achievement",
    name = "tech-maniac",
    order = "a[progress]-c[tech-maniac]",
    research_all = true,
    icon = "__base__/graphics/achievement/tech-maniac.png"
  },
  {
    type = "finish-the-game-achievement",
    name = "smoke-me-a-kipper-i-will-be-back-for-breakfast",
    order = "a[progress]-d[smoke-me-a-kipper-i-will-be-back-for-breakfast]",
    icon = "__base__/graphics/achievement/smoke-me-a-kipper-i-will-be-back-for-breakfast.png"
  },
  {
    type = "group-attack-achievement",
    name = "it-stinks-and-they-dont-like-it",
    order = "b[exploration]-a[it-stinks-and-they-dont-like-it]",
    amount = 1,
    icon = "__base__/graphics/achievement/it-stinks-and-they-dont-like-it.png"
  },
  {
    type = "construct-with-robots-achievement",
    name = "automated-construction",
    order = "b[exploration]-b[construct-with-robots]-a[100]",
    amount = 100,
    steam_stats_name = "constructed-by-robots",
    icon = "__base__/graphics/achievement/automated-construction.png",
    limited_to_one_game = false
  },
  {
    type = "construct-with-robots-achievement",
    name = "you-are-doing-it-right",
    order = "b[exploration]-b[construct-with-robots]-b[more-than-manually]",
    more_than_manually = true,
    icon = "__base__/graphics/achievement/you-are-doing-it-right.png",
    limited_to_one_game = true
  },
  {
    type = "deconstruct-with-robots-achievement",
    name = "automated-cleanup",
    order = "b[exploration]-c[deconstruct-with-robots]",
    amount = 100,
    steam_stats_name = "deconstructed-by-robots",
    icon = "__base__/graphics/achievement/automated-cleanup.png",
  },
  {
    type = "deliver-by-robots-achievement",
    name = "you-have-got-a-package",
    order = "b[exploration]-d[deliver-by-robots]-a",
    amount = 1,
    icon = "__base__/graphics/achievement/you-have-got-a-package.png",
  },
  {
    type = "deliver-by-robots-achievement",
    name = "delivery-service",
    order = "b[exploration]-d[deliver-by-robots]-b",
    amount = 10000,
    steam_stats_name = "delivered-by-robots",
    icon = "__base__/graphics/achievement/delivery-service.png",
  },
  {
    type = "train-path-achievement",
    name = "trans-factorio-express",
    order = "b[exploration]-e[train-path]",
    minimum_distance = 1000,
    steam_stats_name = "longest-train-path",
    icon = "__base__/graphics/achievement/trans-factorio-express.png",
  },
  {
    type = "player-damaged-achievement",
    name = "watch-your-step",
    order = "b[exploration]-f[watch-your-step]",
    type_of_dealer = "locomotive",
    minimum_damage = 0,
    should_survive = false,
    icon = "__base__/graphics/achievement/watch-your-step.png",
  },
  {
    type = "player-damaged-achievement",
    name = "golem",
    order = "b[exploration]-g[golem]",
    should_survive = true,
    minimum_damage = 500,
    steam_stats_name = "surived-damage-in-one-hit",
    icon = "__base__/graphics/achievement/golem.png",
  },
  {
    type = "build-entity-achievement",
    name = "getting-on-track-like-a-pro",
    order = "c[teaching]-a[getting-on-track-like-a-pro]",
    to_build = "locomotive",
    icon = "__base__/graphics/achievement/getting-on-track-like-a-pro.png",
    until_second = 90 * 60 -- 90 minutes
  },
  {
    type = "produce-achievement",
    name = "mass-production-1",
    order = "d[production]-b[electronic-circuit-production]-a",
    item_product = "electronic-circuit",
    amount = 10000,
    steam_stats_name = "electronic-circuits-production-overall",
    icon = "__base__/graphics/achievement/mass-production-1.png",
    limited_to_one_game = false
  },
  {
    type = "produce-achievement",
    name = "mass-production-2",
    order = "d[production]-b[electronic-circuit-production]-b",
    item_product = "electronic-circuit",
    amount = 1000000,
    steam_stats_name = "electronic-circuits-production-overall",
    icon = "__base__/graphics/achievement/mass-production-2.png",
    limited_to_one_game = false
  },
  {
    type = "produce-achievement",
    name = "mass-production-3",
    order = "d[production]-b[electronic-circuit-production]-c",
    item_product = "electronic-circuit",
    amount = 20000000,
    steam_stats_name = "electronic-circuits-production-overall",
    icon = "__base__/graphics/achievement/mass-production-3.png",
    limited_to_one_game = false
  },
  {
    type = "produce-per-hour-achievement",
    name = "circuit-veteran-1",
    order = "d[production]-c[advanced-circuit-production]-a",
    item_product = "advanced-circuit",
    amount = 1000,
    steam_stats_name = "advanced-circuits-per-hour",
    icon = "__base__/graphics/achievement/circuit-veteran-1.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "circuit-veteran-2",
    order = "d[production]-c[advanced-circuit-production]-b",
    item_product = "advanced-circuit",
    amount = 10000,
    steam_stats_name = "advanced-circuits-per-hour",
    icon = "__base__/graphics/achievement/circuit-veteran-2.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "circuit-veteran-3",
    order = "d[production]-c[advanced-circuit-production]-c",
    item_product = "advanced-circuit",
    amount = 25000,
    steam_stats_name = "advanced-circuits-per-hour",
    icon = "__base__/graphics/achievement/circuit-veteran-3.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "computer-age-1",
    order = "d[production]-d[processing-unit-production]-a",
    item_product = "processing-unit",
    amount = 500,
    steam_stats_name = "processing-units-per-hour",
    icon = "__base__/graphics/achievement/computer-age-1.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "computer-age-2",
    order = "d[production]-d[processing-unit-production]-b",
    item_product = "processing-unit",
    amount = 1000,
    steam_stats_name = "processing-units-per-hour",
    icon = "__base__/graphics/achievement/computer-age-2.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "computer-age-3",
    order = "d[production]-d[processing-unit-production]-c",
    item_product = "processing-unit",
    amount = 5000,
    steam_stats_name = "processing-units-per-hour",
    icon = "__base__/graphics/achievement/computer-age-3.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "iron-throne-1",
    order = "d[production]-e[iron-throne-1]",
    item_product = "iron-plate",
    amount = 20000,
    steam_stats_name = "iron-plates-per-hour",
    icon = "__base__/graphics/achievement/iron-throne-1.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "iron-throne-2",
    order = "d[production]-e[iron-throne-2]",
    item_product = "iron-plate",
    amount = 200000,
    steam_stats_name = "iron-plates-per-hour",
    icon = "__base__/graphics/achievement/iron-throne-2.png"
  },
  {
    type = "produce-per-hour-achievement",
    name = "iron-throne-3",
    order = "d[production]-e[iron-throne-3]",
    item_product = "iron-plate",
    amount = 400000,
    steam_stats_name = "iron-plates-per-hour",
    icon = "__base__/graphics/achievement/iron-throne-3.png"
  },
  {
    type = "dont-use-entity-in-energy-production-achievement",
    name = "solaris",
    order = "d[production]-e[solaris]",
    last_hour_only = true,
    excluded = {"steam-engine", "steam-turbine"},
    included = "solar-panel",
    minimum_energy_produced = "10GJ",
    icon = "__base__/graphics/achievement/solaris.png"
  },
  {
    type = "kill-achievement",
    name = "steamrolled",
    order = "e[kill]-a[steamrolled]",
    type_to_kill = "unit-spawner",
    damage_type = "impact",
    in_vehicle = true,
    personally = true,
    amount = 10,
    steam_stats_name = "spawners-killed-by-impact",
    icon = "__base__/graphics/achievement/steamrolled.png"
  },
  {
    type = "kill-achievement",
    name = "pyromaniac",
    order = "e[kill]-b[pyromaniac]",
    type_to_kill = "tree",
    amount = 10000,
    damage_type = "fire",
    steam_stats_name = "trees-destroyed-by-fire",
    icon = "__base__/graphics/achievement/pyromaniac.png"
  },
  {
    type = "kill-achievement",
    name = "run-forrest-run",
    order = "e[kill]-c[run-forrest-run]",
    type_to_kill = "tree",
    in_vehicle = true,
    personally = true,
    amount = 100,
    steam_stats_name = "trees-destroyed-by-impact",
    icon = "__base__/graphics/achievement/run-forrest-run.png"
  },
  {
    type = "combat-robot-count",
    name = "minions",
    order = "e[kill]-d[minions]",
    count = 100,
    steam_stats_name = "combat-robots",
    icon = "__base__/graphics/achievement/minions.png"
  },
  {
    type = "dont-craft-manually-achievement",
    name = "lazy-bastard",
    order = "f[limitation]-a[lazy-bastard]",
    amount = 111,
    icon = "__base__/graphics/achievement/lazy-bastard.png"
  },
  {
    type = "dont-use-entity-in-energy-production-achievement",
    name = "steam-all-the-way",
    allowed_in_peaceful_mode = false,
    excluded = "solar-panel",
    order = "f[limitation]-b[steam-all-the-way]",
    icon = "__base__/graphics/achievement/steam-all-the-way.png"
  },
  {
    type = "dont-build-entity-achievement",
    name = "raining-bullets",
    order = "f[limitation]-c[raining-bullets]",
    dont_build = "laser-turret",
    allowed_in_peaceful_mode = false,
    icon = "__base__/graphics/achievement/raining-bullets.png"
  },
  {
    type = "dont-build-entity-achievement",
    name = "logistic-network-embargo",
    order = "f[limitation]-d[logistic-network-embargo]",
    dont_build = {"logistic-chest-active-provider", "logistic-chest-requester"},
    icon = "__base__/graphics/achievement/logistic-network-embargo.png"
  },
  {
    type = "finish-the-game-achievement",
    name = "no-time-for-chitchat",
    until_second = 60 * 60 * 15, -- 15 hours
    allowed_in_peaceful_mode = false,
    order = "f[limitation]-e[no-time-for-chitchat]",
    icon = "__base__/graphics/achievement/no-time-for-chitchat.png"
  },
  {
    type = "finish-the-game-achievement",
    name = "there-is-no-spoon",
    until_second = 60 * 60 * 8, -- 8 hours
    allowed_in_peaceful_mode = false,
    order = "f[limitation]-f[there-is-no-spoon]",
    icon = "__base__/graphics/achievement/there-is-no-spoon.png"
  },
  {
    type = "achievement",
    name = "so-long-and-thanks-for-all-the-fish",
    order = "g[secret]-a[so-long-and-thanks-for-all-the-fish]",
    icon = "__base__/graphics/achievement/so-long-and-thanks-for-all-the-fish.png"
  }
})

data:extend(
{
  {
    type = "use-entity-in-energy-production-achievement",
    name = "fusion-power",
    order = "a[progress]-e[energy-production]-d[fusion]",
    entity = "fusion-generator",
    icon = "__space-age__/graphics/achievement/fusion-power.png",
    icon_size = 128,
  },
  {
    type = "create-platform-achievement",
    name = "reach-for-the-stars",
    order = "a[progress]-f[reach-for-the-stars]",
    amount = 1,
    icon = "__space-age__/graphics/achievement/reach-for-the-stars.png",
    icon_size = 128,
  },
  {
    type = "change-surface-achievement",
    name = "visit-fulgora",
    order = "a[progress]-g[visit-planet]-a[fulgora]",
    surface = "fulgora",
    icon = "__space-age__/graphics/achievement/visit-fulgora.png",
    icon_size = 128,
  },
  {
    type = "change-surface-achievement",
    name = "visit-gleba",
    order = "a[progress]-g[visit-planet]-b[gleba]",
    surface = "gleba",
    icon = "__space-age__/graphics/achievement/visit-gleba.png",
    icon_size = 128,
  },
  {
    type = "change-surface-achievement",
    name = "visit-vulcanus",
    order = "a[progress]-g[visit-planet]-c[vulcanus]",
    surface = "vulcanus",
    icon = "__space-age__/graphics/achievement/visit-vulcanus.png",
    icon_size = 128,
  },
  {
    type = "change-surface-achievement",
    name = "visit-aquilo",
    order = "a[progress]-g[visit-planet]-d[aquilo]",
    surface = "aquilo",
    icon = "__space-age__/graphics/achievement/visit-aquilo.png",
    icon_size = 128,
  },
  {
    type = "produce-achievement",
    name = "crafting-with-quality",
    order = "a[progress]-h[crafting-tier-3-module]-d[quality]",
    item_product = "quality-module-3",
    amount = 1,
    limited_to_one_game = false,
    icon = "__space-age__/graphics/achievement/crafting-with-quality.png",
    icon_size = 128
  },
  {
    type = "complete-objective-achievement",
    name = "second-star-to-the-right-and-straight-on-till-morning",
    order = "a[progress]-x[finish-game]-b[space-age]",
    objective_condition = "game-finished",
    icon = "__space-age__/graphics/achievement/second-star-to-the-right-and-straight-on-till-morning.png",
    icon_size = 128
  },
  {
    type = "group-attack-achievement",
    name = "it-stinks-and-they-do-like-it",
    order = "b[exploration]-i[it-stinks-and-they-do-like-it]",
    amount = 1,
    entities =
    {
      "small-strafer-pentapod",
      "medium-strafer-pentapod",
      "big-strafer-pentapod",
      "small-stomper-pentapod",
      "medium-stomper-pentapod",
      "big-stomper-pentapod",
      "small-wriggler-pentapod",
      "medium-wriggler-pentapod",
      "big-wriggler-pentapod"
    },
    icon = "__space-age__/graphics/achievement/it-stinks-and-they-do-like-it.png",
    icon_size = 128
  },
  {
    type = "group-attack-achievement",
    name = "get-off-my-lawn",
    order = "b[exploration]-j[get-off-my-lawn]",
    amount = 1,
    entities =
    {
      "small-demolisher",
      "medium-demolisher",
      "big-demolisher"
    },
    icon = "__space-age__/graphics/achievement/get-off-my-lawn.png",
    icon_size = 128
  },
  {
    type = "space-connection-distance-traveled-achievement",
    name = "shattered-planet-1",
    order = "b[exploration]-k[shattered-planet-1]",
    distance = 10000,
    reversed = false,
    tracked_connection = "solar-system-edge-shattered-planet",
    icon = "__space-age__/graphics/achievement/shattered-planet-1.png",
    icon_size = 128
  },
  {
    type = "space-connection-distance-traveled-achievement",
    name = "shattered-planet-2",
    order = "b[exploration]-l[shattered-planet-2]",
    distance = 30000,
    reversed = false,
    tracked_connection = "solar-system-edge-shattered-planet",
    icon = "__space-age__/graphics/achievement/shattered-planet-2.png",
    icon_size = 128
  },
  {
    type = "space-connection-distance-traveled-achievement",
    name = "shattered-planet-3",
    order = "b[exploration]-m[shattered-planet-3]",
    distance = 60000,
    reversed = false,
    tracked_connection = "solar-system-edge-shattered-planet",
    icon = "__space-age__/graphics/achievement/shattered-planet-3.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-metallurgics",
    order = "e[research]-a[research-with]-h[metallurgics]",
    science_pack = "metallurgic-science-pack",
    icon = "__space-age__/graphics/achievement/research-with-metallurgics.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-agriculture",
    order = "e[research]-a[research-with]-i[agriculture]",
    science_pack = "agricultural-science-pack",
    icon = "__space-age__/graphics/achievement/research-with-agriculture.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-electromagnetics",
    order = "e[research]-a[research-with]-j[electromagnetics]",
    science_pack = "electromagnetic-science-pack",
    icon = "__space-age__/graphics/achievement/research-with-electromagnetics.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-cryogenics",
    order = "e[research]-a[research-with]-k[cryogenics]",
    science_pack = "cryogenic-science-pack",
    icon = "__space-age__/graphics/achievement/research-with-cryogenics.png",
    icon_size = 128
  },
  {
    type = "research-with-science-pack-achievement",
    name = "research-with-promethium",
    order = "e[research]-a[research-with]-l[promethium]",
    science_pack = "promethium-science-pack",
    icon = "__space-age__/graphics/achievement/research-with-promethium.png",
    icon_size = 128
  },
  {
    type = "dont-research-before-researching-achievement",
    name = "rush-to-space",
    order = "e[research]-c[rush-to-space]",
    dont_research = {"production-science-pack", "utility-science-pack"},
    research_with = {"metallurgic-science-pack", "electromagnetic-science-pack", "agricultural-science-pack"},
    icon = "__space-age__/graphics/achievement/rush-to-space.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "if-it-bleeds",
    order = "f[kill]-j[if-it-bleeds]",
    to_kill = {"small-demolisher"},
    personally = false,
    amount = 1,
    icon = "__space-age__/graphics/achievement/if-it-bleeds.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "we-need-bigger-guns",
    order = "f[kill]-k[we-need-bigger-guns]",
    to_kill = {"medium-demolisher"},
    personally = false,
    amount = 1,
    icon = "__space-age__/graphics/achievement/we-need-bigger-guns.png",
    icon_size = 128
  },
  {
    type = "kill-achievement",
    name = "size-doesnt-matter",
    order = "f[kill]-l[size-doesnt-matter]",
    to_kill = {"big-demolisher"},
    personally = false,
    amount = 1,
    icon = "__space-age__/graphics/achievement/size-doesnt-matter.png",
    icon_size = 128
  },
  {
    type = "module-transfer-achievement",
    name = "make-it-better",
    order = "g[quality]-a[make-it-better]",
    module = {"quality-module", "quality-module-2", "quality-module-3"},
    amount = 1,
    icon = "__space-age__/graphics/achievement/make-it-better.png",
    icon_size = 128
  },
  {
    type = "equip-armor-achievement",
    name = "look-at-my-shiny-rare-armor",
    order = "g[quality]-b[look-at-my-shiny-rare-armor]",
    armor = "power-armor-mk2",
    alternative_armor = "mech-armor",
    limit_quality = "rare",
    icon = "__space-age__/graphics/achievement/look-at-my-shiny-rare-armor.png",
    icon_size = 128
  },
  {
    type = "use-item-achievement",
    name = "todays-fish-is-trout-a-la-creme",
    order = "g[quality]-c[todays-fish-is-trout-a-la-creme]",
    to_use = "raw-fish",
    limit_quality = "legendary",
    icon = "__space-age__/graphics/achievement/todays-fish-is-trout-a-la-creme.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "my-modules-are-legendary",
    order = "g[quality]-d[my-modules-are-legendary]",
    item_product = { name = "quality-module-3", quality = "legendary" },
    amount = 1,
    limited_to_one_game = false,
    icon = "__space-age__/graphics/achievement/my-modules-are-legendary.png",
    icon_size = 128
  },
  {
    type = "place-equipment-achievement",
    name = "no-room-for-more",
    order = "g[quality]-e[no-room-for-more]",
    armor = "mech-armor",
    limit_quality = "legendary",
    limit_equip_quality = "legendary",
    amount = 1,
    icon = "__space-age__/graphics/achievement/no-room-for-more.png",
    icon_size = 128
  },
  {
    type = "complete-objective-achievement",
    name = "work-around-the-clock",
    order = "h[limitation]-g[work-around-the-clock]",
    objective_condition = "game-finished",
    within = 100 * hour,
    allowed_without_fight = false,
    icon = "__space-age__/graphics/achievement/work-around-the-clock.png",
    icon_size = 128
  },
  {
    type = "complete-objective-achievement",
    name = "express-delivery",
    order = "h[limitation]-j[express-delivery]",
    objective_condition = "game-finished",
    within = 40 * hour,
    allowed_without_fight = false,
    icon = "__space-age__/graphics/achievement/express-delivery.png",
    icon_size = 128
  }
})

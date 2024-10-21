data:extend(
{
  {
    type = "autoplace-control",
    name = "vulcanus_coal",
    localised_name = {"", "[entity=coal] ", {"entity-name.coal"}},
    richness = true,
    order = "b-a",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "tungsten_ore",
    localised_name = {"", "[entity=tungsten-ore] ", {"entity-name.tungsten-ore"}},
    richness = true,
    order = "b-d",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "calcite",
    localised_name = {"", "[entity=calcite] ", {"entity-name.calcite"}},
    richness = true,
    order = "b-c",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "sulfuric_acid_geyser",
    localised_name = {"", "[entity=sulfuric-acid-geyser] ", {"entity-name.sulfuric-acid-geyser"}},
    richness = true,
    order = "b-c",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "gleba_stone",
    localised_name = {"", "[entity=stone] ", {"entity-name.stone"}},
    richness = true,
    order = "c-a",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "scrap",
    localised_name = {"", "[entity=scrap] ", {"entity-name.scrap"}},
    richness = true,
    order = "d-a",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "aquilo_crude_oil",
    localised_name = {"", "[entity=crude-oil] ", {"entity-name.crude-oil"}},
    richness = true,
    order = "e-a",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "fluorine_vent",
    localised_name = {"", "[entity=fluorine-vent] ", {"entity-name.fluorine-vent"}},
    richness = true,
    order = "e-c",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "lithium_brine",
    localised_name = {"", "[entity=lithium-brine] ", {"entity-name.lithium-brine"}},
    richness = true,
    order = "e-b",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "gleba_cliff",
    order = "c-z-b",
    category = "cliff"
  },
  {
    type = "autoplace-control",
    name = "fulgora_cliff",
    order = "c-z-c",
    category = "cliff"
  },
  {
    type = "autoplace-control",
    name = "vulcanus_volcanism",
    order = "c-z-a",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "gleba_water",
    order = "c-z-b",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "gleba_plants",
    order = "c-z-c",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "fulgora_islands",
    order = "c-z-d",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "gleba_enemy_base",
    richness = false,
    order = "z",
    category = "enemy",
    can_be_disabled = false
  }
}
)

data.raw["autoplace-control"]["enemy-base"].can_be_disabled = false

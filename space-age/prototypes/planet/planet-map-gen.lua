local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")
-- get nauvis from base.

planet_map_gen.vulcanus = function()
  return
  {
    property_expression_names =
    {
      elevation = "vulcanus_elevation",
      temperature = "vulcanus_temperature",
      moisture = "vulcanus_moisture",
      aux = "vulcanus_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability",
      ["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness",
      ["entity:coal:probability"] = "vulcanus_coal_probability",
      ["entity:coal:richness"] = "vulcanus_coal_richness",
      ["entity:calcite:probability"] = "vulcanus_calcite_probability",
      ["entity:calcite:richness"] = "vulcanus_calcite_richness",
      ["entity:sulfuric-acid-geyser:probability"] = "vulcanus_sulfuric_acid_geyser_probability",
      ["entity:sulfuric-acid-geyser:richness"] = "vulcanus_sulfuric_acid_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-vulcanus",
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70
    },
    territory_settings =
    {
      units = {"small-demolisher", "medium-demolisher", "big-demolisher"},
      territory_index_expression = "demolisher_territory_expression",
      territory_variation_expression = "demolisher_variation_expression",
      minimum_territory_size = 10
    },
    autoplace_controls =
    {
      ["vulcanus_coal"] = {},
      ["sulfuric_acid_geyser"] = {},
      ["tungsten_ore"] = {},
      ["calcite"] = {},
      ["vulcanus_volcanism"] = {},
      --["rocks"] = {}, -- can't add the rocks control otherwise nauvis rocks spawn
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --nauvis tiles
          ["volcanic-soil-dark"] = {},
          ["volcanic-soil-light"] = {},
          ["volcanic-ash-soil"] = {},
          --end of nauvis tiles
          ["volcanic-ash-flats"] = {},
          ["volcanic-ash-light"] = {},
          ["volcanic-ash-dark"] = {},
          ["volcanic-cracks"] = {},
          ["volcanic-cracks-warm"] = {},
          ["volcanic-folds"] = {},
          ["volcanic-folds-flat"] = {},
          ["lava"] = {},
          ["lava-hot"] = {},
          ["volcanic-folds-warm"] = {},
          ["volcanic-pumice-stones"] = {},
          ["volcanic-cracks-hot"] = {},
          ["volcanic-jagged-ground"] = {},
          ["volcanic-smooth-stone"] = {},
          ["volcanic-smooth-stone-warm"] = {},
          ["volcanic-ash-cracks"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          -- nauvis decoratives
          ["v-brown-carpet-grass"] = {},
          ["v-green-hairy-grass"] = {},
          ["v-brown-hairy-grass"] = {},
          ["v-red-pita"] = {},
          -- end of nauvis
          ["vulcanus-rock-decal-large"] = {},
          ["vulcanus-crack-decal-large"] = {},
          ["vulcanus-crack-decal-huge-warm"] = {},
          ["vulcanus-dune-decal"] = {},
          ["vulcanus-sand-decal"] = {},
          ["vulcanus-lava-fire"] = {},
          ["calcite-stain"] = {},
          ["calcite-stain-small"] = {},
          ["sulfur-stain"] = {},
          ["sulfur-stain-small"] = {},
          ["sulfuric-acid-puddle"] = {},
          ["sulfuric-acid-puddle-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["medium-volcanic-rock"] = {},
          ["tiny-volcanic-rock"] = {},
          ["tiny-rock-cluster"] = {},
          ["small-sulfur-rock"] = {},
          ["tiny-sulfur-rock"] = {},
          ["sulfur-rock-cluster"] = {},
          ["waves-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["coal"] = {},
          ["calcite"] = {},
          ["sulfuric-acid-geyser"] = {},
          ["tungsten-ore"] = {},
          ["huge-volcanic-rock"] = {},
          ["big-volcanic-rock"] = {},
          ["crater-cliff"] = {},
          ["vulcanus-chimney"] = {},
          ["vulcanus-chimney-faded"] = {},
          ["vulcanus-chimney-cold"] = {},
          ["vulcanus-chimney-short"] = {},
          ["vulcanus-chimney-truncated"] = {},
          ["ashland-lichen-tree"] = {},
          ["ashland-lichen-tree-flaming"] = {},
        }
      }
    }
  }
end

planet_map_gen.gleba = function()
  return
  {
    cliff_settings =
    {
      name = "cliff-gleba",
      control = "gleba_cliff",
      cliff_elevation_0 = 40,
      cliff_elevation_interval = 60,
      richness = 0.80,
      cliff_smoothing = 0 -- Not critical but looks better
    },
    property_expression_names =
    {
      elevation = "gleba_elevation",
      aux = "gleba_aux",
      moisture = "gleba_moisture",
      temperature = "gleba_temperature",
      cliffiness = "gleba_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      enemy_base_radius = "gleba_enemy_base_radius",
      enemy_base_frequency = "gleba_enemy_base_frequency",
      ["entity:stone:richness"] = "gleba_stone_richness",
      ["entity:stone:probability"] = "gleba_stone_probability",

      ["decorative:red-desert-bush:probability"] = "gleba_red_desert_bush_probability",
      ["decorative:white-desert-bush:probability"] = "gleba_white_desert_bush_probability",
      ["decorative:red-pita:probability"] = "gleba_red_pita_probability",
      ["decorative:green-bush-mini:probability"] = "gleba_green_bush_probability",
      ["decorative:green-croton:probability"] = "gleba_green_cronton_probability",
      ["decorative:green-pita:probability"] = "gleba_green_pita_probability",
      ["decorative:green-pita-mini:probability"] = "gleba_green_pita_mini_probability",
      ["decorative:lichen-decal:probability"] = "gleba_orange_lichen_probability",
      ["decorative:shroom-decal:probability"] = "gleba_carpet_shroom_probability",
      ["decorative:cracked-mud-decal:probability"] = "gleba_cracked_mud_probability",
      ["decorative:light-mud-decal:probability"] = "gleba_light_mud_probability",
      ["decorative:dark-mud-decal:probability"] = "gleba_dark_mud_probability",
      ["decorative:green-carpet-grass:probability"] = "gleba_green_carpet_grass_probability",
      ["decorative:green-hairy-grass:probability"] = "gleba_green_hairy_grass_probability"
    },
    autoplace_controls =
    {
      ["gleba_stone"] = {},
      ["gleba_plants"] = {},
      ["gleba_enemy_base"] = {},
      ["gleba_water"] = {},
      ["gleba_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["natural-yumako-soil"] = {},
          ["natural-jellynut-soil"] = {},
          ["wetland-yumako"] = {},
          ["wetland-jellynut"] = {},
          ["wetland-blue-slime"] = {},
          ["wetland-light-green-slime"] = {},
          ["wetland-green-slime"] = {},
          ["wetland-light-dead-skin"] = {},
          ["wetland-dead-skin"] = {},
          ["wetland-pink-tentacle"] = {},
          ["wetland-red-tentacle"] = {},
          ["gleba-deep-lake"] = {},
          ["lowland-brown-blubber"] = {},
          ["lowland-olive-blubber"] = {},
          ["lowland-olive-blubber-2"] = {},
          ["lowland-olive-blubber-3"] = {},
          ["lowland-pale-green"] = {},
          ["lowland-cream-cauliflower"] = {},
          ["lowland-cream-cauliflower-2"] = {},
          ["lowland-dead-skin"] = {},
          ["lowland-dead-skin-2"] = {},
          ["lowland-cream-red"] = {},
          ["lowland-red-vein"] = {},
          ["lowland-red-vein-2"] = {},
          ["lowland-red-vein-3"] = {},
          ["lowland-red-vein-4"] = {},
          ["lowland-red-vein-dead"] = {},
          ["lowland-red-infection"] = {},
          ["midland-turquoise-bark"] = {},
          ["midland-turquoise-bark-2"] = {},
          ["midland-cracked-lichen"] = {},
          ["midland-cracked-lichen-dull"] = {},
          ["midland-cracked-lichen-dark"] = {},
          ["midland-yellow-crust"] = {},
          ["midland-yellow-crust-2"] = {},
          ["midland-yellow-crust-3"] = {},
          ["midland-yellow-crust-4"] = {},
          ["highland-dark-rock"] = {},
          ["highland-dark-rock-2"] = {},
          ["highland-yellow-rock"] = {},
          ["pit-rock"] = {}
        }

      },
      ["decorative"] =
      {
        settings =
        {
          ["yellow-lettuce-lichen-1x1"] = {},
          ["yellow-lettuce-lichen-3x3"] = {},
          ["yellow-lettuce-lichen-6x6"] = {},
          ["yellow-lettuce-lichen-cups-1x1"] = {},
          ["yellow-lettuce-lichen-cups-3x3"] = {},
          ["yellow-lettuce-lichen-cups-6x6"] = {},
          ["green-lettuce-lichen-1x1"] = {},
          ["green-lettuce-lichen-3x3"] = {},
          ["green-lettuce-lichen-6x6"] = {},
          ["green-lettuce-lichen-water-1x1"] = {},
          ["green-lettuce-lichen-water-3x3"] = {},
          ["green-lettuce-lichen-water-6x6"] = {},
          ["honeycomb-fungus"] = {},
          ["honeycomb-fungus-1x1"] = {},
          ["honeycomb-fungus-decayed"] = {},
          ["split-gill-1x1"] = {},
          ["split-gill-2x2"] = {},
          ["split-gill-dying-1x1"] = {},
          ["split-gill-dying-2x2"] = {},
          ["split-gill-red-1x1"] = {},
          ["split-gill-red-2x2"] = {},
          ["veins"] = {},
          ["veins-small"] = {},
          ["mycelium"] = {},
          ["coral-water"] = {},
          ["coral-land"] = {},
          ["black-sceptre"] = {},
          ["pink-phalanges"] = {},
          ["pink-lichen-decal"] = {},
          ["red-lichen-decal"] = {},
          ["green-cup"] = {},
          ["brown-cup"] = {},
          ["blood-grape"] = {},
          ["blood-grape-vibrant"] = {},
          ["brambles"] = {},
          ["polycephalum-slime"] = {},
          ["polycephalum-balloon"] = {},
          ["fuchsia-pita"] = {},
          ["wispy-lichen"] = {},
          ["grey-cracked-mud-decal"] = {},
          ["barnacles-decal"] = {},
          ["coral-stunted"] = {},
          ["coral-stunted-grey"] = {},
          ["nerve-roots-veins-dense"] = {},
          ["nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["curly-roots-orange"] = {},
          ["knobbly-roots"] = {},
          ["knobbly-roots-orange"] = {},
          ["matches-small"] = {},
          ["pale-lettuce-lichen-cups-1x1"] = {},
          ["pale-lettuce-lichen-cups-3x3"] = {},
          ["pale-lettuce-lichen-cups-6x6"] = {},
          ["pale-lettuce-lichen-1x1"] = {},
          ["pale-lettuce-lichen-3x3"] = {},
          ["pale-lettuce-lichen-6x6"] = {},
          ["pale-lettuce-lichen-water-1x1"] = {},
          ["pale-lettuce-lichen-water-3x3"] = {},
          ["pale-lettuce-lichen-water-6x6"] = {},
          ["white-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-hairy-grass"] = {},

          --shared
          ["light-mud-decal"] = {},
          ["dark-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["red-pita"] = {},
          ["green-bush-mini"] = {},
          ["green-croton"] = {},
          ["green-pita"] = {},
          ["green-pita-mini"] = {},
          ["lichen-decal"] = {},
          ["shroom-decal"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["stone"] = {},
          ["iron-stromatolite"] = {},
          ["copper-stromatolite"] = {}
        }
      }
    }
  }
end


planet_map_gen.fulgora = function()
  return
  {
    property_expression_names =
    {
      elevation = "fulgora_elevation",
      temperature = "temperature_basic",
      moisture = "moisture_basic",
      aux = "aux_basic",
      cliffiness = "fulgora_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
    },
    cliff_settings =
    {
      name = "cliff-fulgora",
      control = "fulgora_cliff",
      cliff_elevation_0 = 80,
      -- Ideally the first cliff would be at elevation 0 on the coastline, but that doesn't work,
      -- so instead the coastline is moved to elevation 80.
      -- Also there needs to be a large cliff drop at the coast to avoid the janky cliff smoothing
      -- but it also fails if a corner goes below zero, so we need an extra buffer of 40.
      -- So the first cliff is at 80, and terrain near the cliff shouln't go close to 0 (usually above 40).
      cliff_elevation_interval = 40,
      cliff_smoothing = 0, -- This is critical for correct cliff placement on the coast.
      richness = 0.95
    },
    autoplace_controls =
    {
      ["scrap"] = {},
      ["fulgora_islands"] = {},
      ["fulgora_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["oil-ocean-shallow"] = {},
          ["oil-ocean-deep"] = {},
          ["fulgoran-rock"] = {},
          ["fulgoran-dust"] = {},
          ["fulgoran-sand"] = {},
          ["fulgoran-dunes"] = {},
          ["fulgoran-walls"] = {},
          ["fulgoran-paving"] = {},
          ["fulgoran-conduit"] = {},
          ["fulgoran-machinery"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["fulgoran-ruin-tiny"] = {},
          ["fulgoran-gravewort"] = {},
          ["urchin-cactus"] = {},
          ["medium-fulgora-rock"] = {},
          ["small-fulgora-rock"] = {},
          ["tiny-fulgora-rock"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["scrap"] = {},
          ["fulgoran-ruin-vault"] = {},
          ["fulgoran-ruin-attractor"] = {},
          ["fulgoran-ruin-colossal"] = {},
          ["fulgoran-ruin-huge"] = {},
          ["fulgoran-ruin-big"] = {},
          ["fulgoran-ruin-stonehenge"] = {},
          ["fulgoran-ruin-medium"] = {},
          ["fulgoran-ruin-small"] = {},
          ["fulgurite"] = {},
          ["big-fulgora-rock"] = {}
        }
      }
    }
  }
end



planet_map_gen.aquilo = function()
  return
  {
    property_expression_names =
    {
      elevation = "aquilo_elevation",
      temperature = "aquilo_temperature",
      moisture = "moisture_basic",
      aux = "aquilo_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:crude-oil:probability"] = "aquilo_crude_oil_probability",
      ["entity:crude-oil:richness"] = "aquilo_crude_oil_richness"
    },
    autoplace_controls =
    {
      ["lithium_brine"] = {},
      ["fluorine_vent"] = {},
      ["aquilo_crude_oil"] = {}
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["snow-flat"] = {},
          ["snow-crests"] = {},
          ["snow-lumpy"] = {},
          ["snow-patchy"] = {},
          ["ice-rough"] = {},
          ["ice-smooth"] = {},
          ["brash-ice"] = {},
          ["ammoniacal-ocean"] = {},
          ["ammoniacal-ocean-2"] = {}
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["lithium-iceberg-medium"] = {},
          ["lithium-iceberg-small"] = {},
          ["lithium-iceberg-tiny"] = {},
          ["floating-iceberg-large"] = {},
          ["floating-iceberg-small"] = {},
          ["aqulio-ice-decal-blue"] = {},
          ["aqulio-snowy-decal"] = {},
          ["snow-drift-decal"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["crude-oil"] = {},
          ["lithium-brine"] = {},
          ["fluorine-vent"] = {},
          ["lithium-iceberg-huge"] = {},
          ["lithium-iceberg-big"] = {}
        }
      }
    }
  }
end

return planet_map_gen

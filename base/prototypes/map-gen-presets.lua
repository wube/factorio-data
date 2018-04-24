data:extend(
{
  {
    type = "map-gen-presets",
    name = "default",
    -- default changes nothing
    default =
    {
      default = true,
      order = "a"
    },
    ["rich-resources"] =
    {
      order = "b",
      basic_settings =
      {
        autoplace_controls =
        {
          ["iron-ore"] = { richness = "very-good"},
          ["copper-ore"] = { richness = "very-good"},
          ["stone"] = { richness = "very-good"},
          ["coal"] = { richness = "very-good"},
          ["uranium-ore"] = { richness = "very-good"},
          ["crude-oil"] = { richness = "very-good"}
        }
      }
    },
    ["marathon"] =
    {
      order = "c",
      advanced_settings =
      {
        difficulty_settings =
        {
          recipe_difficulty = defines.difficulty_settings.recipe_difficulty.expensive,
          technology_difficulty = defines.difficulty_settings.technology_difficulty.expensive,
          technology_price_multiplier = 4
        }
      }
    },
    ["dangerous"] =
    {
      order = "d",
      basic_settings =
      {
        autoplace_controls =
        {
          ["enemy-base"] = { frequency = "very-high"}
        }
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.00002,
          pollution_factor = 0.00002
        }
      }
    },
    ["death-world"] =
    {
      order = "d",
      basic_settings =
      {
        autoplace_controls =
        {
          ["enemy-base"] = { frequency = "very-high"}
        }
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.00002,
          pollution_factor = 0.00002
        },
        difficulty_settings =
        {
          recipe_difficulty = defines.difficulty_settings.recipe_difficulty.expensive,
          technology_difficulty = defines.difficulty_settings.technology_difficulty.expensive,
          technology_price_multiplier = 4
        }
      }
    },
    ["rail-world"] =
    {
      order = "e",
      basic_settings =
      {
        autoplace_controls = {
          coal = {
            frequency = "very-low",
            size = "high"
          },
          ["copper-ore"] = {
            frequency = "very-low",
            size = "high"
          },
          ["crude-oil"] = {
            frequency = "low",
            size = "high"
          },
          ["uranium-ore"] = {
            frequency = "low",
            size = "high"
          },
          ["enemy-base"] = {
            frequency = "low",
          },
          ["iron-ore"] = {
            frequency = "very-low",
            size = "high"
          },
          stone = {
            frequency = "very-low",
            size = "high"
          }
        },
        terrain_segmentation = "very-low",
        water = "high",
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.000002
        },
        enemy_expansion =
        {
         enabled = false
        }
      }
    }
  }
})

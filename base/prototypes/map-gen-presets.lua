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
        property_expression_names = {},
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
      basic_settings =
      {
        property_expression_names = {},
      },
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
    ["death-world"] =
    {
      order = "d",
      basic_settings =
      {
        property_expression_names = {},
        autoplace_controls =
        {
          ["enemy-base"] = { frequency = "very-high", size = "very-big"}
        },
        starting_area = "small"
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.00002,
          pollution_factor = 0.0000012
        },
        pollution =
        {
          ageing = 0.5,
          enemy_attack_pollution_consumption_modifier = 0.5
        },
      }
    },
    ["death-world-marathon"] =
    {
      order = "d",
      basic_settings =
      {
        property_expression_names = {},
        autoplace_controls =
        {
          ["enemy-base"] = { frequency = "very-high", size = "very-big"}
        },
        starting_area = "small"
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.000015,
          pollution_factor = 0.0000010
        },
        pollution =
        {
          ageing = 0.5,
          enemy_attack_pollution_consumption_modifier = 0.8
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
        property_expression_names = {},
        autoplace_controls =
        {
          coal =
          {
            frequency = 0.33333333333,
            size = 3
          },
          ["copper-ore"] =
          {
            frequency = 0.33333333333,
            size = 3
          },
          ["crude-oil"] =
          {
            frequency = 0.33333333333,
            size = 3
          },
          ["uranium-ore"] =
          {
            frequency = 0.33333333333,
            size = 3
          },
          ["iron-ore"] =
          {
            frequency = 0.33333333333,
            size = 3
          },
          stone =
          {
            frequency = 0.33333333333,
            size = 3
          },
          ["enemy-base"] =
          {
            size = 1
          }
        },
        terrain_segmentation = 0.5,
        water = 1.5
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
    },
    ["ribbon-world"] =
    {
      order = "f",
      basic_settings =
      {
        autoplace_controls =
        {
          coal =
          {
            frequency = 3,
            size = 0.5,
            richness = 2
          },
          ["copper-ore"] =
          {
            frequency = 3,
            size = 0.5,
            richness = 2
          },
          ["crude-oil"] =
          {
            frequency = 3,
            size = 0.5,
            richness = 2
          },
          ["uranium-ore"] =
          {
            frequency = 3,
            size = 0.5,
            richness = 2
          },
          ["iron-ore"] =
          {
            frequency = 3,
            size = 0.5,
            richness = 2
          },
          stone =
          {
            frequency = 3,
            size = 0.5,
            richness = 2
          }
        },
        terrain_segmentation = 4,
        water = 0.25,
        starting_area = 3,
        height = 128 --4 chunks, about 1 screen of height.
      }
    },
    ["island"] =
    {
      order = "g",
      basic_settings =
      {
        property_expression_names =
        {
          elevation = "0_17-island",
        },
        autoplace_controls = {},
        terrain_segmentation = 1,
      }
    },
  }
})

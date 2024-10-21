local planet_map_gen = {}

planet_map_gen.nauvis = function()
  return
  {
    aux_climate_control = true,
    moisture_climate_control = true,
    property_expression_names =
    { -- Warning: anything set here overrides any selections made in the map setup screen so the options do nothing.
      --cliff_elevation = "cliff_elevation_nauvis",
      --cliffiness = "cliffiness_nauvis",
      --elevation = "elevation_island"
    },
    cliff_settings =
    {
      name = "cliff",
      control = "nauvis_cliff",
      cliff_smoothing = 0
    },
    autoplace_controls =
    {
      ["iron-ore"] = {},
      ["copper-ore"] = {},
      ["stone"] = {},
      ["coal"] = {},
      ["uranium-ore"] = {},
      ["crude-oil"] = {},
      ["water"] = {},
      ["trees"] = {},
      ["enemy-base"] = {},
      ["rocks"] = {},
      ["starting_area_moisture"] = {},
      ["nauvis_cliff"] = {}
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["grass-1"] = {},
          ["grass-2"] = {},
          ["grass-3"] = {},
          ["grass-4"] = {},
          ["dry-dirt"] = {},
          ["dirt-1"] = {},
          ["dirt-2"] = {},
          ["dirt-3"] = {},
          ["dirt-4"] = {},
          ["dirt-5"] = {},
          ["dirt-6"] = {},
          ["dirt-7"] = {},
          ["sand-1"] = {},
          ["sand-2"] = {},
          ["sand-3"] = {},
          ["red-desert-0"] = {},
          ["red-desert-1"] = {},
          ["red-desert-2"] = {},
          ["red-desert-3"] = {},
          ["water"] = {},
          ["deepwater"] = {}
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["brown-hairy-grass"] = {},
          ["green-hairy-grass"] = {},
          ["brown-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-small-grass"] = {},
          ["green-asterisk"] = {},
          ["brown-asterisk-mini"] = {},
          ["green-asterisk-mini"] = {},
          ["brown-asterisk"] = {},
          ["red-asterisk"] = {},
          ["dark-mud-decal"] = {},
          ["light-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-decal"] = {},
          ["sand-decal"] = {},
          ["sand-dune-decal"] = {},
          ["green-pita"] = {},
          ["red-pita"] = {},
          ["green-croton"] = {},
          ["red-croton"] = {},
          ["green-pita-mini"] = {},
          ["brown-fluff"] = {},
          ["brown-fluff-dry"] = {},
          ["green-desert-bush"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["garballo-mini-dry"] = {},
          ["garballo"] = {},
          ["green-bush-mini"] = {},
          ["medium-rock"] = {},
          ["small-rock"] = {},
          ["tiny-rock"] = {},
          ["medium-sand-rock"] = {},
          ["small-sand-rock"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["iron-ore"] = {},
          ["copper-ore"] = {},
          ["stone"] = {},
          ["coal"] = {},
          ["crude-oil"] = {},
          ["uranium-ore"] = {},
          ["fish"] = {},
          ["big-sand-rock"] = {},
          ["huge-rock"] = {},
          ["big-rock"] = {},
        }
      }
    }
  }
end

return planet_map_gen

local base_tile_pollution_values = require("__base__/prototypes/tile/tile-pollution-values")
local space_age_tile_pollution_values =
{
  lava =       { pollution = 0.000030 },
  vulcanus =   { pollution = 0.000030 },
  fulgora =    { pollution = 0.000030 }, -- has pollution turned off completely
  gleba =      { spores    = 0.000010 },
  ice =        { pollution = 0.000005 }
}
return util.merge{base_tile_pollution_values, space_age_tile_pollution_values}

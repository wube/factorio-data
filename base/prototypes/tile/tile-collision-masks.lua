local tile_collision_masks = {}

tile_collision_masks.out_of_map =
{layers={
  ground_tile=true,
  water_tile=true,
  resource=true,
  floor=true,
  item=true,
  object=true,
  player=true,
  doodad=true
}}

tile_collision_masks.water =
{layers={
  water_tile=true,
  resource=true,
  item=true,
  player=true,
  doodad=true,
  floor=true
}}

tile_collision_masks.ammoniacal_ocean =
{layers={
  water_tile=true,
  --resource=true,
  item=true,
  player=true,
  doodad=true,
  floor=true
}}

tile_collision_masks.shallow_water =
{layers={
  -- Character collides only with player-layer and train-layer,
  -- this can have any tile collision masks it doesn't matter for being walkable by character but not buildable.
  -- Having water-tile prevents placing paths, ground-tile prevents placing landfill.
  -- Not sure what other side effects could different combinations of tile masks cause.
  water_tile=true,
  --item=true, -- allow egg items in water
  resource=true,
  --object=true,
  floor=true
  --doodad=true
}}

tile_collision_masks.ground =
{layers={
  ground_tile=true
}}

tile_collision_masks.lava =
{layers={
  water_tile=true,
  item=true,
  resource=true,
  player=true,
  doodad=true,
  --object=true,
  lava_tile=true,
  rail=true -- to prevent rail supports from being buildable on lava, guarded by TEST(RailSupportOverTilesAssumptions)
}}

tile_collision_masks.oil_ocean_shallow =
{layers={ -- allow only player, vehicles, and elevated rail pillars. No other structures, rail, belts, etc.
  water_tile=true,
  resource=true
}}

tile_collision_masks.oil_ocean_deep =
{layers={
  -- Same as above but with rail-support-layer.
  water_tile=true,
  resource=true,
  rail_support=true
}}

tile_collision_masks.meltable_tile =
{layers={
  ground_tile=true,
  meltable=true
}}

return tile_collision_masks

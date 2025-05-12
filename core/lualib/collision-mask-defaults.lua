local building = function() return {layers={item=true, meltable=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}} end
local building_unheated = function() return {layers={item=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}} end
local building_tall = function() return {layers={item=true, meltable=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true, elevated_rail=true}} end
local building_walkable = function() return {layers={item=true, meltable=true, floor=true, car=true, water_tile=true, transport_belt=true, is_lower_object=true}} end

local belts = function() return {layers={floor=true, meltable=true, object=true, transport_belt=true, water_tile=true}} end
local containers = building_unheated -- containers don't fundamentally require heat to operate, so allow them to be built on meltable surfaces

local ground_rail = function() return {layers={floor=true, item=true, object=true, rail=true, water_tile=true, is_lower_object=true}} end
local elevated_rail = function() return {layers={elevated_rail=true}} end

local ground_signal = function() return {layers={floor=true, item=true, rail=true, water_tile=true, is_lower_object=true}} end
local elevated_signal = function() return {layers={elevated_rail=true}} end

local ground_rolling_stock = function() return {layers={train=true}} end
local transition_rolling_stock = function() return {layers={train=true, elevated_train=true}} end
local elevated_rolling_stock = function() return {layers={elevated_train=true}} end

function collision_mask_only_trigger_target() return {layers={trigger_target=true}, not_colliding_with_itself=true} end

return
{
  ["agricultural-tower"] = building(),
  ["ammo-turret"] = building(),
  ["arithmetic-combinator"] = building(),
  ["artillery-turret"] = building(),
  ["assembling-machine"] = building(),
  ["asteroid-chunk"] = building(),
  ["asteroid-collector"] = building(),
  ["asteroid"] = building(),
  ["beacon"] = building(),
  ["boiler"] = building(),
  ["burner-generator"] = building(),
  ["decider-combinator"] = building(),
  ["electric-energy-interface"] = building(),
  ["electric-turret"] = building(),
  ["fluid-turret"] = building(),
  ["furnace"] = building(),
  ["generator"] = building(),
  ["heat-interface"] = building(),
  ["infinity-pipe"] = building(),
  ["inserter"] = building(),
  ["lab"] = building(),
  ["market"] = building(),
  ["mining-drill"] = building(),
  ["offshore-pump"] = building(),
  ["pipe-to-ground"] = building_walkable(),
  ["pipe"] = building(),
  ["plant"] = building(),
  ["fusion-generator"] = building(),
  ["fusion-reactor"] = building(),
  ["power-switch"] = building(),
  ["programmable-speaker"] = building(),
  ["pump"] = building(),
  ["radar"] = building(),
  ["reactor"] = building(),
  ["rocket-silo-rocket-shadow"] = building(),
  ["rocket-silo-rocket"] = building(),
  ["selector-combinator"] = building(),
  ["simple-entity-with-force"] = building(),
  ["simple-entity-with-owner"] = building(),
  ["simple-entity"] = building(),
  ["storage-tank"] = building(),
  ["thruster"] = building(),
  ["tree"] = building(),
  ["turret"] = building(),
  ["unit-spawner"] = building(),
  ["valve"] = building(),
  ["wall"] = building(),
  ["display-panel"] = building(),

  ["accumulator"] = building_unheated(),
  ["cargo-pod"] = building_unheated(),
  ["constant-combinator"] = building_unheated(),
  ["electric-pole"] = building_unheated(),
  ["lamp"] = building_unheated(),
  ["solar-panel"] = building_unheated(),
  ["train-stop"] = building_unheated(),

  ["cargo-bay"] = building_tall(),
  ["cargo-landing-pad"] = building_tall(),
  ["lightning-attractor"] = building_tall(),
  ["roboport"] = building_tall(),
  ["rocket-silo"] = building_tall(),
  ["space-platform-hub"] = building_tall(),

  -- containers should have the same collision mask for upgrade planner compatibility
  ["container"] = containers(),
  ["infinity-container"] = containers(),
  ["linked-container"] = containers(),
  ["proxy-container"] = containers(),
  ["logistic-container"] = containers(),
  ["temporary-container"] = containers(),

  ["linked-belt"] = belts(),
  ["loader-1x1"] = belts(),
  ["loader"] = belts(),
  ["splitter"] = belts(),
  ["lane-splitter"] = belts(),
  ["transport-belt"] = belts(),
  ["underground-belt"] = belts(),

  ["curved-rail-a"] = ground_rail(),
  ["curved-rail-b"] = ground_rail(),
  ["half-diagonal-rail"] = ground_rail(),
  ["legacy-curved-rail"] = ground_rail(),
  ["legacy-straight-rail"] = ground_rail(),
  ["straight-rail"] = ground_rail(),

  ["rail-ramp"] = {layers={elevated_rail=true, object=true, rail=true, rail_support=true, is_lower_object=true, is_object=true}},
  ["rail-ramp/allow_on_deep_oil_ocean"] = {layers={elevated_rail=true, object=true, rail=true, is_lower_object=true, is_object=true}},

  ["rail-support"] = {layers={object=true, rail=true, rail_support=true, is_lower_object=true, is_object=true}},
  ["rail-support/allow_on_deep_oil_ocean"] = {layers={object=true, rail=true, is_lower_object=true, is_object=true}},

  ["elevated-curved-rail-a"] = elevated_rail(),
  ["elevated-curved-rail-b"] = elevated_rail(),
  ["elevated-half-diagonal-rail"] = elevated_rail(),
  ["elevated-straight-rail"] = elevated_rail(),

  ["rail-chain-signal"] = ground_signal(),
  ["rail-signal"] = ground_signal(),

  ["rail-chain-signal/elevated"] = elevated_signal(),
  ["rail-signal/elevated"] = elevated_signal(),

  ["artillery-wagon"] = ground_rolling_stock(),
  ["infinity-cargo-wagon"] = ground_rolling_stock(),
  ["cargo-wagon"] = ground_rolling_stock(),
  ["fluid-wagon"] = ground_rolling_stock(),
  ["locomotive"] = ground_rolling_stock(),

  ["artillery-wagon/transition"] = transition_rolling_stock(),
  ["infinity-cargo-wagon/transition"] = transition_rolling_stock(),
  ["cargo-wagon/transition"] = transition_rolling_stock(),
  ["fluid-wagon/transition"] = transition_rolling_stock(),
  ["locomotive/transition"] = transition_rolling_stock(),

  ["artillery-wagon/elevated"] = elevated_rolling_stock(),
  ["infinity-cargo-wagon/elevated"] = elevated_rolling_stock(),
  ["cargo-wagon/elevated"] = elevated_rolling_stock(),
  ["fluid-wagon/elevated"] = elevated_rolling_stock(),
  ["locomotive/elevated"] = elevated_rolling_stock(),

  ["gate"] = {layers={item=true, meltable=true, object=true, player=true, train=true, water_tile=true, is_object=true, is_lower_object=true}},
  ["gate/opened"] = {layers={object=true, item=true, floor=true, water_tile=true, is_lower_object=true}},

  ["arrow"] = {layers={}},
  ["artillery-flare"] = {layers={}},
  ["artillery-projectile"] = {layers={}},
  ["beam"] = {layers={}},
  ["capture-robot"] = {layers={}},
  ["character-corpse"] = {layers={}},
  ["combat-robot"] = {layers={}},
  ["construction-robot"] = {layers={}},
  ["explosion"] = {layers={}},
  ["fire"] = {layers={}},
  ["highlight-box"] = {layers={}},
  ["item-request-proxy"] = {layers={}},
  ["leaf-particle"] = {layers={}},
  ["lightning"] = {layers={}},
  ["logistic-robot"] = {layers={}},
  ["particle-source"] = {layers={}},
  ["particle"] = {layers={}},
  ["projectile"] = {layers={}},
  ["projectile/hit"] = {layers={player=true, train=true, trigger_target=true}},
  ["smoke-with-trigger"] = {layers={}},
  ["smoke"] = {layers={}},
  ["speech-bubble"] = {layers={}},
  ["sticker"] = {layers={}},
  ["stream"] = {layers={}},
  ["tile"] = {layers={}},  -- Tile prototypes are required to have a collision mask so have no default

  ["car"] = {layers={player=true, car=true, train=true, is_object=true}, consider_tile_transitions=true},
  ["character"] = {layers={player=true, train=true, is_object=true}, consider_tile_transitions=true},
  ["character/flying"] = collision_mask_only_trigger_target(),
  ["cliff"] = {layers={item=true, meltable=true, object=true, player=true, water_tile=true, is_lower_object=true, is_object=true, cliff=true}, not_colliding_with_itself=true},
  ["corpse"] = {layers={doodad=true}, colliding_with_tiles_only=true},
  ["deconstructible-tile-proxy"] = {layers={}},
  ["entity-ghost"] = {layers={ghost=true}},
  ["fish"] = {layers={ground_tile=true}, colliding_with_tiles_only=true},
  ["heat-pipe"] = {layers={floor=true, meltable=true, object=true, water_tile=true, is_lower_object=true}},
  ["item-entity"] = {layers={item=true, is_lower_object=true}},
  ["land-mine"] = {layers={object=true, water_tile=true, rail=true, is_lower_object=true}},
  ["player-port"] = {layers={floor=true, object=true, water_tile=true}},
  ["rail-remnants"] = {layers={doodad=true}, colliding_with_tiles_only=true},
  ["resource"] = {layers={resource=true}},
  ["spider-leg"] = {layers={player=true, rail=true}},
  ["spider-unit"] = collision_mask_only_trigger_target(),
  ["spider-vehicle"] = collision_mask_only_trigger_target(),
  ["tile-ghost"] = {layers={ghost=true}},
  ["unit"] = {layers={player=true, train=true, is_object=true}, not_colliding_with_itself=true},
  ["segment"] = {layers={player=true, train=true, rail=true, transport_belt=true, is_object=true}},
  ["segmented-unit"] = {layers={player=true, train=true, rail=true, transport_belt=true, is_object=true}},
  ["decorative"] = {layers={doodad=true}, not_colliding_with_itself=true}
}

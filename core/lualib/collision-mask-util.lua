--[[
This is intended for data stage.
Control stage collision masks have a different format, and there are already provided API functions for collision checking and things.
]]

local util = require("util")
local collision_mask_util = {}

local layer_names =
{
  "ground-tile",
  "water-tile",
  "resource-layer",
  "doodad-layer",
  "floor-layer",
  "item-layer",
  "ghost-layer",
  "object-layer",
  "player-layer",
  "train-layer",
  "rail-layer",
  "transport-belt-layer"
}

for k = 13, 55 do
  table.insert(layer_names, "layer-"..k)
end

local collision_flags =
{
  "consider-tile-transitions",
  "not-colliding-with-itself",
  "colliding-with-tiles-only"
}

local default_masks =
{
  accumulator = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["ammo-turret"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["arithmetic-combinator"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  arrow = {},
  ["artillery-flare"] = {},
  ["artillery-projectile"] = {},
  ["artillery-turret"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["artillery-wagon"] = {"train-layer"},
  ["assembling-machine"] = {"item-layer", "object-layer", "player-layer", "resource-layer", "water-tile"},
  beacon = {"item-layer", "object-layer", "player-layer", "water-tile"},
  beam = {},
  boiler = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["burner-generator"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  car = {"player-layer", "train-layer", "consider-tile-transitions"},
  ["cargo-wagon"] = {"train-layer"},
  character = {"player-layer", "train-layer", "consider-tile-transitions"},
  ["character-corpse"] = {},
  cliff = {"item-layer", "object-layer", "player-layer", "water-tile", "not-colliding-with-itself"},
  ["combat-robot"] = {},
  ["constant-combinator"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["construction-robot"] = {},
  container = {"item-layer", "object-layer", "player-layer", "water-tile"},
  corpse = {},
  ["curved-rail"] = {"item-layer", "object-layer", "floor-layer", "rail-layer", "water-tile"},
  ["decider-combinator"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["deconstructible-tile-proxy"] = {"ground-tile"},
  ["electric-energy-interface"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["electric-pole"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["electric-turret"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["entity-ghost"] = {"ghost-layer"},
  explosion = {},
  fire = {},
  fish = {"ground-tile", "colliding-with-tiles-only"},
  ["flame-thrower-explosion"] = {},
  ["fluid-turret"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["fluid-wagon"] = {"train-layer"},
  ["flying-text"] = {},
  furnace = {"item-layer", "object-layer", "player-layer", "water-tile"},
  gate = {"item-layer", "object-layer", "player-layer", "train-layer", "water-tile"},
  generator = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["heat-interface"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["heat-pipe"] = {"floor-layer", "object-layer", "water-tile"},
  ["highlight-box"] = {},
  ["infinity-container"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["infinity-pipe"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  inserter = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["item-entity"] = {"item-layer"},
  ["item-request-proxy"] = {},
  lab = {"item-layer", "object-layer", "player-layer", "water-tile"},
  lamp = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["land-mine"] = {"object-layer", "water-tile"},
  ["leaf-particle"] = {},
  loader = {"item-layer", "object-layer", "water-tile", "transport-belt-layer"},
  ["loader-1x1"] = {"item-layer", "object-layer", "water-tile", "transport-belt-layer"},
  locomotive = {"train-layer"},
  ["logistic-container"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["logistic-robot"] = {},
  market = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["mining-drill"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["offshore-pump"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  particle = {},
  ["particle-source"] = {},
  pipe = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["pipe-to-ground"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["player-port"] = {"floor-layer", "object-layer", "water-tile"},
  ["power-switch"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["programmable-speaker"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  projectile = {},
  pump = {"item-layer", "object-layer", "player-layer", "water-tile"},
  radar = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["rail-chain-signal"] = {"floor-layer", "item-layer", "rail-layer"},
  ["rail-remnants"] = {},
  ["rail-signal"] = {"floor-layer", "item-layer", "rail-layer"},
  reactor = {"item-layer", "object-layer", "player-layer", "water-tile"},
  resource = {"resource-layer"},
  roboport = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["rocket-silo"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["rocket-silo-rocket"] = {"not-colliding-with-itself"},
  ["rocket-silo-rocket-shadow"] = {"not-colliding-with-itself"},
  ["simple-entity"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["simple-entity-with-force"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["simple-entity-with-owner"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  smoke = {},
  ["smoke-with-trigger"] = {},
  ["solar-panel"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["speech-bubble"] = {},
  ["spider-leg"] = {"player-layer", "rail-layer"},
  ["spider-vehicle"] = {},
  splitter = {"item-layer", "object-layer", "water-tile", "transport-belt-layer"},
  sticker = {},
  ["storage-tank"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["straight-rail"] = {"item-layer", "object-layer", "floor-layer", "rail-layer", "water-tile"},
  stream = {},
  tile = {},
  ["tile-ghost"] = {"ghost-layer"},
  ["train-stop"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["transport-belt"] = {"floor-layer", "object-layer", "water-tile", "transport-belt-layer"},
  tree = {"item-layer", "object-layer", "player-layer", "water-tile"},
  turret = {"item-layer", "object-layer", "player-layer", "water-tile"},
  ["underground-belt"] = {"item-layer", "object-layer", "water-tile", "transport-belt-layer"},
  unit = {"doodad-layer", "item-layer", "not-colliding-with-itself", "consider-tile-transitions"},
  ["unit-spawner"] = {"item-layer", "object-layer", "player-layer", "water-tile"},
  wall = {"item-layer", "object-layer", "player-layer", "water-tile"}
}

local clear_flags = function(map)
  for k, flag in pairs (collision_flags) do
    map[flag] = nil
  end
end

collision_mask_util.get_default_mask = function(type)
  return util.copy(default_masks[type]) or error("Unknown entity type: "..type)
end

collision_mask_util.get_mask = function(entity_prototype)
  return entity_prototype.collision_mask or collision_mask_util.get_default_mask(entity_prototype.type)
end

collision_mask_util.remove_layer = function(mask, layer)
  return util.remove_from_list(mask, layer)
end

local insert = table.insert

collision_mask_util.add_layer = function(mask, layer)
  collision_mask_util.remove_layer(mask, layer)
  insert(mask, layer)
end

collision_mask_util.mask_contains_layer = function(mask, layer)
  local map = util.list_to_map(mask)
  return map[layer]
end

collision_mask_util.masks_collide = function(mask_1, mask_2)

  local map = util.list_to_map(mask_1)
  if map["not-colliding-with-itself"] and collision_mask_util.masks_are_same(mask_1, mask_2) then
    return false
  end

  clear_flags(map)

  for k, layer in pairs (mask_2) do
    if map[layer] then
      return true
    end
  end
  return false
end

collision_mask_util.masks_are_same = function(mask_1, mask_2)
  local map = util.list_to_map(mask_1)
  for k, v in pairs (mask_2) do
    if not map[v] then return false end
    map[v] = nil
  end
  return not next(map)
end

collision_mask_util.collect_prototypes_with_mask = function(mask)
  local prototype_list = {}
  for type, default_mask in pairs (default_masks) do
    for name, entity in pairs (data.raw[type]) do
      local entity_mask = entity.collision_mask or default_mask
      if collision_mask_util.masks_are_same(entity_mask, mask) then
        table.insert(prototype_list, entity)
      end
    end
  end
  return prototype_list
end

collision_mask_util.collect_prototypes_with_layer = function(layer)
  local prototype_list = {}
  for type, default_mask in pairs (default_masks) do
    for name, entity in pairs (data.raw[type]) do
      local entity_mask = entity.collision_mask or default_mask
      if collision_mask_util.mask_contains_layer(entity_mask, layer) then
        table.insert(prototype_list, entity)
      end
    end
  end
  return prototype_list
end

collision_mask_util.collect_prototypes_colliding_with_mask = function(mask)
  local prototype_list = {}

  local check_list = default_masks
  if collision_mask_util.mask_contains_layer(mask, "colliding-with-tiles-only") then
    check_list = {tile = {}}
  end

  for type, default_mask in pairs (check_list) do
    for name, entity in pairs (data.raw[type]) do
      local entity_mask = entity.collision_mask or default_mask
      if collision_mask_util.masks_collide(entity_mask, mask) then
        table.insert(prototype_list, entity)
      end
    end
  end
  return prototype_list
end

collision_mask_util.replace_layer_in_all_prototypes = function(old_name, new_name)
  for type, default_mask in pairs (default_masks) do
    for name, entity in pairs (data.raw[type]) do
      local entity_mask = entity.collision_mask or default_mask
      if collision_mask_util.remove_layer(entity_mask, old_name) then
        collision_mask_util.add_layer(entity_mask, new_name)
        entity.collision_mask = entity_mask
      end
    end
  end
end

collision_mask_util.is_layer_used = function(layer)
  for type, default_mask in pairs (default_masks) do
    for name, entity in pairs (data.raw[type]) do
      local entity_mask = entity.collision_mask or default_mask
      if collision_mask_util.mask_contains_layer(entity_mask, layer) then
        return true
      end
    end
  end
  return false
end

collision_mask_util.get_first_unused_layer = function()
  for k, layer in pairs (layer_names) do
    if not collision_mask_util.is_layer_used(layer) then
      return layer
    end
  end
end

return collision_mask_util

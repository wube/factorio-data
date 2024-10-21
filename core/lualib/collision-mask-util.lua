--[[
This is intended for data stage.
Control stage collision masks have a different format, and there are already provided API functions for collision checking and things.
]]

local default_masks = require("collision-mask-defaults")
local util = require("util")
local collision_mask_util = {}

collision_mask_util.get_default_mask = function(type)
  return util.copy(default_masks[type]) or error("Unknown entity type: "..type)
end

collision_mask_util.get_mask = function(entity_prototype)
  return entity_prototype.collision_mask or collision_mask_util.get_default_mask(entity_prototype.type)
end

-- collision_mask_util.remove_layer was deleted. Just do `mask.layers[layer] = nil`
-- collision_mask_util.add_layer was deleted. Just do `mask.layers[layer] = true`
-- collision_mask_util.mask_contains_layer was deleted. Just do `mask.layers[layer]`: true means it contains (as opposed to nil)

collision_mask_util.masks_collide = function(mask1, mask2)
  if mask1.not_colliding_with_itself and mask2.not_colliding_with_itself and collision_mask_util.masks_are_same(mask1, mask2) then
    return false
  end

  for layer, mask1_layers_layer in pairs(mask1.layers) do
    if mask1_layers_layer and mask2.layers[layer] then
      return true;
    end
  end
  return false
end

collision_mask_util.masks_are_same = function(mask1, mask2)
  for layer, mask1_layers_layer in pairs(mask1.layers) do
    if mask1_layers_layer and not mask2.layers[layer] then
      return false;
    end
  end
  for layer, mask2_layers_layer in pairs(mask2.layers) do
    if mask2_layers_layer and not mask1.layers[layer] then
      return false;
    end
  end
  return true
end

collision_mask_util.collect_prototypes_with_mask = function(mask)
  local prototype_list = {}
  for type, default_mask in pairs (default_masks) do
    if data.raw[type] then
      for name, entity in pairs (data.raw[type]) do
        local entity_mask = entity.collision_mask or default_mask
        if collision_mask_util.masks_are_same(entity_mask, mask) then
          table.insert(prototype_list, entity)
        end
      end
    end
  end
  return prototype_list
end

collision_mask_util.collect_prototypes_with_layer = function(layer)
  local prototype_list = {}
  for type, default_mask in pairs (default_masks) do
    if data.raw[type] then
      for name, entity in pairs (data.raw[type]) do
        local entity_mask = entity.collision_mask or default_mask
        if entity_mask.layers[layer] then
          table.insert(prototype_list, entity)
        end
      end
    end
  end
  return prototype_list
end

collision_mask_util.collect_prototypes_colliding_with_mask = function(mask)
  local prototype_list = {}

  local check_list = default_masks
  if mask.colliding_with_tiles_only then
    check_list = {tile = {}}
  end

  for type, default_mask in pairs (check_list) do
    if data.raw[type] then
      for name, entity in pairs (data.raw[type]) do
        local entity_mask = entity.collision_mask or default_mask
        if collision_mask_util.masks_collide(entity_mask, mask) then
          table.insert(prototype_list, entity)
        end
      end
    end
  end
  return prototype_list
end

collision_mask_util.replace_layer_in_all_prototypes = function(old_name, new_name)
  for type, default_mask in pairs (default_masks) do
    if data.raw[type] then
      for name, entity in pairs (data.raw[type]) do
        local entity_mask = entity.collision_mask or default_mask
        if entity_mask.layers[old_name] then
          entity_mask.layers[old_name] = nil
          entity_mask.layers[new_name] = true
          entity.collision_mask = entity_mask
        end
      end
    end
  end
end

collision_mask_util.new_mask = function()
  return {layers={}}
end

collision_mask_util.migrate_from_before_1_2_0 = function(old_mask)
  local mask = collision_mask_util.new_mask()
  for _, layer in pairs(old_mask) do
    if layer == "not-colliding-with-itself" then
      mask.not_colliding_with_itself = true
    elseif layer == "consider-tile-transitions" then
      mask.consider_tile_transitions = true
    elseif layer == "colliding-with-tiles-only" then
      mask.colliding_with_tiles_only = true
    else
      mask.layers[layer] = true
    end
  end
  return mask
end

return collision_mask_util

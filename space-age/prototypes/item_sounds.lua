local function item_sound(filename, volume)
  return
  {
    filename = "__space-age__/sound/item/"..filename,
    volume = volume,
    aggregation = {max_count = 1, remove = true},
  }
end

local space_age_item_sounds =
{
  ice_inventory_move = item_sound("ice-inventory-move.ogg", 0.4),
  ice_inventory_pickup = item_sound("ice-inventory-pickup.ogg", 0.4),
  rocket_inventory_move = item_sound("thruster-inventory-move.ogg", 0.6),
  rocket_inventory_pickup = item_sound("thruster-inventory-pickup.ogg", 0.6),
  agriculture_inventory_move = item_sound("agriculture-inventory-move.ogg", 0.5),
  agriculture_inventory_pickup = item_sound("agriculture-inventory-pickup.ogg", 0.5),
  rock_inventory_move = item_sound("rock-inventory-move.ogg", 0.45),
  rock_inventory_pickup = item_sound("rock-inventory-pickup.ogg", 0.45),
}

return space_age_item_sounds

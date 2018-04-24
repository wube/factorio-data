for j, surface in pairs(game.surfaces) do
  for k, resource in pairs(surface.find_entities_filtered({name="crude-oil"})) do
    resource.amount = resource.amount * 10
  end
end

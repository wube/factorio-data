if game.is_demo() then
  return
end

if game.entity_prototypes["uranium-ore"].autoplace_specification then
  game.surfaces[1].regenerate_entity("uranium-ore")
end

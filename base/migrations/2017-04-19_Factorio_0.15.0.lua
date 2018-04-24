if game.is_demo() then
  return
end

for k,force in pairs(game.forces) do
  force.recipes["explosive-uranium-cannon-shell"].enabled = force.technologies["uranium-ammo"].researched
end

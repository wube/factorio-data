game.reloadscript()

if game.isdemo() then
  return
end

for index, force in pairs(game.forces) do
  if force.technologies["military"].researched then
    force.recipes["shotgun"].enable()
    force.recipes["shotgun-shell"].enable()
  end
  if force.technologies["military-2"].researched then
    force.recipes["basic-grenade"].enable()
  end
end

game.reloadscript()

if game.isdemo() then
  return
end

for index, force in pairs(game.forces) do
  if force.technologies["military"].researched then
    force.recipes["shotgun"].enabled = true
    force.recipes["shotgun-shell"].enabled = true
  end
  if force.technologies["military-2"].researched then
    force.recipes["basic-grenade"].enabled = true
  end
end

game.reloadscript()
game.player.force.resettechnologies()
game.player.force.resetrecipes()
if game.isdemo() then
  return
end
for index, force in pairs(game.forces) do
  if force.technologies["electric-energy-distribution-1"].researched then
    force.recipes["big-electric-pole"].enabled = true
  end
  force.recipes["iron-chest"].enabled = true
end

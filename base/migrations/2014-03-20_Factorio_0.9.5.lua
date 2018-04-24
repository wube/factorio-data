if game.isdemo() then
  return
end

game.player.force.resettechnologies()
game.player.force.resetrecipes()

for index, force in pairs(game.forces) do
  if force.technologies["oil-processing"].researched then
    force.recipes["lubricant"].enabled = true
  end
end

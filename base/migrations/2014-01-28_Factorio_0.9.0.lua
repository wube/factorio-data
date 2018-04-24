if game.isdemo() then
  return
end

game.player.force.resettechnologies()
game.player.force.resetrecipes()

for index, force in pairs(game.forces) do
  if force.technologies["robotics"].researched then
    force.recipes["flying-robot-frame"].enabled = true
  end

  if force.technologies["logistic-robotics"].researched then
    force.technologies["logistic-system"].researched = true
  end
  if force.technologies["advanced-electronics"].researched then
    force.recipes["processing-unit"].enabled = true
  end
end

game.regenerateentity("crude-oil")

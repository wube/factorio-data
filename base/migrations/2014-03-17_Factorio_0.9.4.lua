if game.is_demo() then
  return
end

game.player.force.reset_recipes()

for index, force in pairs(game.forces) do
  if force.technologies["construction-robotics"].researched then
    force.recipes["logistic-chest-passive-provider"].enabled = true
    force.recipes["logistic-chest-storage"].enabled = true
  end
  if force.technologies["logistic-robotics"].researched then
    force.recipes["logistic-chest-active-provider"].enabled = true
  end
end

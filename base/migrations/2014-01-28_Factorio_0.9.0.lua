if game.is_demo() then
  return
end

game.player.force.reset_technologies()
game.player.force.reset_recipes()

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

game.regenerate_entity("crude-oil")

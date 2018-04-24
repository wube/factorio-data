if game.is_demo() then
  return
end

game.player.force.reset_technologies()
game.player.force.reset_recipes()

for index, force in pairs(game.forces) do
  if force.technologies["oil-processing"].researched then
    force.recipes["lubricant"].enabled = true
  end
end

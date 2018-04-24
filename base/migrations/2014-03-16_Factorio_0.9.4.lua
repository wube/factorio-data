if game.is_demo() then
  return
end

game.player.force.reset_recipes()
game.player.force.reset_technologies()

if game.player.force.technologies["battery"].researched then
  game.player.force.recipes["science-pack-3"].enabled = true
end

game.player.force.resetrecipes()
game.player.force.resettechnologies()

if game.player.force.technologies["battery"].researched then
  game.player.force.recipes["science-pack-3"].enabled = true
end

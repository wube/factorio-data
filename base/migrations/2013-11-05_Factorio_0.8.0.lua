game.reloadscript()
game.player.force.resettechnologies()
game.player.force.resetrecipes()

if game.isdemo() then
  return
end

for index, force in pairs(game.forces) do
  if force.technologies["logistic-robotics"].researched then
    force.recipes["roboport"].enabled = true
  end
end

local robotcount = game.player.force.getentitycount("logistic-robot")
if (robotcount > 0) then
  local roboportcount = (robotcount + 49) / 50
  game.player.insert{name="roboport", count=roboportcount}
  game.player.print("You got " .. math.floor(roboportcount) .. " roboports to station your logistic robots. Build them soon.")
end

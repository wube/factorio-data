if game.isdemo() then
  return
end

for index, force in pairs(game.forces) do
  if force.technologies["combat-robotics"].researched then
    force.recipes["defender-capsule"].enabled = true
  end
  if force.technologies["combat-robotics-2"].researched then
    force.recipes["distractor-capsule"].enabled = true
  end
  if force.technologies["combat-robotics-3"].researched then
    force.recipes["destroyer-capsule"].enabled = true
  end
end

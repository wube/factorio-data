game.reload_script()

if game.is_demo() then
  return
end

for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;
  if technologies["rail-signals"].researched then
    recipes["rail-chain-signal"].enabled = true
  end

  if technologies["tanks"].researched then
    recipes["explosive-cannon-shell"].enabled = true
    recipes["cannon-shell"].reload()
    recipes["explosive-cannon-shell"].reload()
  end

  if technologies["combat-robot-damage-5"].researched then
    force.set_ammo_damage_modifier("combat-robot-beam", force.get_ammo_damage_modifier("combat-robot-beam") + 0.3)
  end
  if technologies["combat-robot-damage-4"].researched then
    force.set_ammo_damage_modifier("combat-robot-beam", force.get_ammo_damage_modifier("combat-robot-beam") + 0.25)
  end
  if technologies["combat-robot-damage-3"].researched then
    force.set_ammo_damage_modifier("combat-robot-beam", force.get_ammo_damage_modifier("combat-robot-beam") + 0.2)
  end
  if technologies["combat-robot-damage-2"].researched then
    force.set_ammo_damage_modifier("combat-robot-beam", force.get_ammo_damage_modifier("combat-robot-beam") + 0.15)
  end
  if technologies["combat-robot-damage-1"].researched then
    force.set_ammo_damage_modifier("combat-robot-beam", force.get_ammo_damage_modifier("combat-robot-beam") + 0.1)
  end
end

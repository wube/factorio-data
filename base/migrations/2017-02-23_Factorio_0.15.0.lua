if game.is_demo() then
  return
end

for k,force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()
  force.reset_technology_effects()
  
  local effect_key = "unlock-recipe"
  local fluid_handling = force.technologies["fluid-handling"]
  local recipes = force.recipes
  
  if fluid_handling and fluid_handling.researched then
    for _,effect in pairs(fluid_handling.effects) do
      if effect.type == effect_key then
        recipes[effect.recipe].enabled = true
      end
    end
  end
end

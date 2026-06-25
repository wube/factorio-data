-- Migrate map gen with the new tiles and ruins and rocks and stuff.

local reset_planet = function(planet_name)

  local planet = game.planets[planet_name]
  if not (planet and planet.valid) then
    return
  end

  planet.reset_map_gen_settings()
  --game.print("Reset map gen for surface: " .. planet_name)
end

reset_planet("fulgora")
reset_planet("vulcanus")

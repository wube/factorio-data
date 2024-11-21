require "util"

require("prototypes.active-triggers")
require("prototypes.ambient-sounds")
require("prototypes.entity.beams")
require("prototypes.entity.cargo-hatch")
require("prototypes.entity.giga-cargo-hatch")
require("prototypes.entity.entities")
require("prototypes.entity.transport-belts")
require("prototypes.entity.explosions")
require("prototypes.entity.smoke")
require("prototypes.particles")
require("prototypes.entity.resources")
require("prototypes.entity.turrets")
require("prototypes.entity.enemies")
require("prototypes.entity.remnants")
require("prototypes.entity.trees")
require("prototypes.entity.plants")
require("prototypes.entity.flying-robots")
require("prototypes.entity.asteroid")
require("prototypes.entity.smoke")
require("prototypes.item")
require("prototypes.item-groups")
require("prototypes.spores")
require("prototypes.recipe")
require("prototypes.fluid")
require("prototypes.autoplace-controls")
require("prototypes.tile.tiles")
require("prototypes.tile.tiles-vulcanus")
require("prototypes.tile.tiles-gleba")
require("prototypes.tile.tiles-fulgora")
require("prototypes.tile.tiles-aquilo")
require("prototypes.decorative.decoratives")
require("prototypes.decorative.decoratives-vulcanus")
require("prototypes.decorative.decoratives-fulgora")
require("prototypes.decorative.decoratives-gleba")
require("prototypes.decorative.decoratives-aquilo")
require("prototypes.categories.ammo-category")
require("prototypes.categories.recipe-category")
require("prototypes.categories.resource-category")
require("prototypes.categories.fuel-category")
require("prototypes.equipment-grid")
require("prototypes.entity.projectiles")
require("prototypes.utility-sounds")
require("prototypes.utility-sprites")
require("prototypes.technology")
require("prototypes.tips-and-tricks")
require("prototypes.achievements")
require("prototypes.entity.entities")
require("prototypes.entity.explosions")
require("prototypes.entity.projectiles")
require("prototypes.entity.turrets")
require("prototypes.entity.enemies")
require("prototypes.entity.big-mining-drill")
require("prototypes.entity.space-platform-hub-cockpit")
require("prototypes.entity.mech-armor-animations")
require("prototypes.entity.remnants")
require("prototypes.entity.circuit-network")
require("prototypes.entity.resources")
require("prototypes.equipment")
require("prototypes.planet.planet")
require("prototypes.burner-usage")
require("prototypes.surface")
require("prototypes.planet.procession")
require("base-data-updates")

local replace_base_game_simulations = false
local space_age_menu_simulations = require("__space-age__/menu-simulations/menu-simulations")
if not data.raw["utility-constants"]["default"].main_menu_simulations or replace_base_game_simulations then
  data.raw["utility-constants"]["default"].main_menu_simulations = {}
end
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
main_menu_simulations.nauvis_biolab = space_age_menu_simulations.nauvis_biolab
main_menu_simulations.nauvis_tank_building = space_age_menu_simulations.nauvis_tank_building
main_menu_simulations.platform_science = space_age_menu_simulations.platform_science
main_menu_simulations.platform_moving = space_age_menu_simulations.platform_moving
main_menu_simulations.platform_messy_nuclear = space_age_menu_simulations.platform_messy_nuclear
main_menu_simulations.vulcanus_lava_forge = space_age_menu_simulations.vulcanus_lava_forge
main_menu_simulations.vulcanus_crossing = space_age_menu_simulations.vulcanus_crossing
main_menu_simulations.vulcanus_punishmnent = space_age_menu_simulations.vulcanus_punishmnent
main_menu_simulations.vulcanus_sulfur_drop = space_age_menu_simulations.vulcanus_sulfur_drop
main_menu_simulations.gleba_agri_towers = space_age_menu_simulations.gleba_agri_towers
main_menu_simulations.gleba_pentapod_ponds = space_age_menu_simulations.gleba_pentapod_ponds
main_menu_simulations.gleba_egg_escape = space_age_menu_simulations.gleba_egg_escape
main_menu_simulations.gleba_farm_attack = space_age_menu_simulations.gleba_farm_attack
main_menu_simulations.gleba_grotto = space_age_menu_simulations.gleba_grotto
main_menu_simulations.fulgora_city_crossing = space_age_menu_simulations.fulgora_city_crossing
main_menu_simulations.fulgora_recycling_hell = space_age_menu_simulations.fulgora_recycling_hell
main_menu_simulations.fulgora_nightfall = space_age_menu_simulations.fulgora_nightfall
main_menu_simulations.fulgora_race = space_age_menu_simulations.fulgora_race
main_menu_simulations.aquilo_send_help = space_age_menu_simulations.aquilo_send_help
main_menu_simulations.aquilo_starter = space_age_menu_simulations.aquilo_starter
main_menu_simulations.nauvis_rocket_factory = space_age_menu_simulations.nauvis_rocket_factory

-- data.raw["utility-constants"]["default"].main_menu_simulations = {}
-- local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
-- main_menu_simulations.current_simulation_to_test = space_age_menu_simulations.vulcanus_punishmnent

-- Test to make sure all gleba tiles are part of the land or water set for tile restriction.
-- This can for example prevent decoratives from spawning in water, but they are still allowed to overlap water.
-- The invalid prototype property won't cause loading problems but will put a warning in tests.
for tile_name, setting in pairs(data.raw.planet.gleba.map_gen_settings.autoplace_settings.tile.settings) do
  local assigned = false
  for _2, land_tile in pairs(gleba_land_tiles) do
    if tile_name == land_tile then
      assigned = true
      break
    end
  end
  if not assigned then
    for _2, water_tile in pairs(gleba_water_tiles) do
      if tile_name == water_tile then
        assigned = true
        break
      end
    end
  end
  if not assigned then
    data.raw.tile[tile_name].tile_is_not_land_or_water = true
  end
end

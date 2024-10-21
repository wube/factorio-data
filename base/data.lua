require "util"

require("prototypes.damage-type")
require("prototypes.ambient-sounds")
require("prototypes.collision-layers")
require("prototypes.entity.factorio-logo")
require("prototypes.entity.cargo-hatch")
require("prototypes.entity.giga-cargo-hatch")
require("prototypes.entity.entities")
require("prototypes.entity.transport-belts")
require("prototypes.entity.explosions")
require("prototypes.entity.crash-site")
require("prototypes.entity.mining-drill")
require("prototypes.particles")
require("prototypes.entity.enemy-constants")
require("prototypes.entity.enemy-projectiles")
require("prototypes.entity.resources")
require("prototypes.entity.turrets")
require("prototypes.entity.enemies")
require("prototypes.entity.trains")
require("prototypes.entity.remnants")
require("prototypes.entity.trees")
require("prototypes.entity.smoke")
require("prototypes.entity.flying-robots")
require("prototypes.item")
require("prototypes.item-groups")
require("prototypes.recipe")
require("prototypes.fluid")
require("prototypes.signal")
require("prototypes.autoplace-controls")
require("prototypes.map-settings")
require("prototypes.map-gen-presets")
require("prototypes.noise-expressions")
require("prototypes.tile.tiles")
require("prototypes.decorative.decoratives")
require("prototypes.categories.ammo-category")
require("prototypes.categories.fuel-category")
require("prototypes.categories.recipe-category")
require("prototypes.categories.resource-category")
require("prototypes.categories.module-category")
require("prototypes.equipment-grid")
require("prototypes.categories.equipment-category")
require("prototypes.categories.quality")
require("prototypes.shortcuts")
require("prototypes.trigger-target-types")
require("prototypes.entity.projectiles")
require("prototypes.entity.beams")
require("prototypes.utility-sprites")
require("prototypes.technology")
require("prototypes.tips-and-tricks")
require("prototypes.achievements")
require("prototypes.pollution")
require("prototypes.entity.entities")
require("prototypes.entity.explosions")
require("prototypes.entity.projectiles")
require("prototypes.entity.beams")
require("prototypes.entity.turrets")
require("prototypes.entity.enemies")
require("prototypes.entity.mining-drill")
require("prototypes.entity.fire")
require("prototypes.entity.remnants")
require("prototypes.entity.circuit-network")
require("prototypes.entity.atomic-bomb")
require("prototypes.entity.resources")
require("prototypes.tutorials")
require("prototypes.equipment")
require("prototypes.custom-inputs")
require("prototypes.planet.planet")
require("prototypes.planet.surface-property")
require("prototypes.planet.procession")
require("prototypes.impact-deliver-category")

if data.is_demo then
  require("prototypes.demo")
end

local menu_simulations = require("__base__/menu-simulations/menu-simulations")
if not data.raw["utility-constants"]["default"].main_menu_simulations then
  data.raw["utility-constants"]["default"].main_menu_simulations = {}
end
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
main_menu_simulations.nauvis_solar_power_construction = menu_simulations.nauvis_solar_power_construction
main_menu_simulations.nauvis_lab = menu_simulations.nauvis_lab
main_menu_simulations.nauvis_burner_city = menu_simulations.nauvis_burner_city
main_menu_simulations.nauvis_mining_defense = menu_simulations.nauvis_mining_defense
main_menu_simulations.nauvis_forest_fire = menu_simulations.nauvis_forest_fire
main_menu_simulations.nauvis_oil_pumpjacks = menu_simulations.nauvis_oil_pumpjacks
main_menu_simulations.nauvis_oil_refinery = menu_simulations.nauvis_oil_refinery
main_menu_simulations.nauvis_early_smelting = menu_simulations.nauvis_early_smelting
main_menu_simulations.nauvis_train_station = menu_simulations.nauvis_train_station
main_menu_simulations.nauvis_logistic_robots = menu_simulations.nauvis_logistic_robots
main_menu_simulations.nauvis_nuclear_power = menu_simulations.nauvis_nuclear_power
main_menu_simulations.nauvis_train_junction = menu_simulations.nauvis_train_junction
main_menu_simulations.nauvis_artillery = menu_simulations.nauvis_artillery
main_menu_simulations.nauvis_biter_base_spidertron = menu_simulations.nauvis_biter_base_spidertron
main_menu_simulations.nauvis_biter_base_artillery = menu_simulations.nauvis_biter_base_artillery
main_menu_simulations.nauvis_biter_base_laser_defense = menu_simulations.nauvis_biter_base_laser_defense
main_menu_simulations.nauvis_biter_base_player_attack = menu_simulations.nauvis_biter_base_player_attack
main_menu_simulations.nauvis_biter_base_steamrolled = menu_simulations.nauvis_biter_base_steamrolled
main_menu_simulations.nauvis_chase_player = menu_simulations.nauvis_chase_player
main_menu_simulations.nauvis_big_defense = menu_simulations.nauvis_big_defense
main_menu_simulations.nauvis_brutal_defeat = menu_simulations.nauvis_brutal_defeat
main_menu_simulations.nauvis_spider_ponds = menu_simulations.nauvis_spider_ponds
main_menu_simulations.nauvis_uranium_processing = menu_simulations.nauvis_uranium_processing


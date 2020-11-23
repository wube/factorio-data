require "util"

require("prototypes.ambient-sounds")
require("prototypes.entity.factorio-logo")
require("prototypes.entity.entities")
require("prototypes.entity.explosions")
require("prototypes.entity.crash-site")
require("prototypes.entity.mining-drill")
require("prototypes.particles")
require("prototypes.entity.spitter-projectiles")
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
require("prototypes.tile.noise-layers")
require("prototypes.autoplace-controls")
require("prototypes.map-settings")
require("prototypes.map-gen-presets")
require("prototypes.tile.tiles")
require("prototypes.decorative.decoratives")
require("prototypes.damage-type")
require("prototypes.categories.ammo-category")
require("prototypes.categories.fuel-category")
require("prototypes.categories.recipe-category")
require("prototypes.categories.resource-category")
require("prototypes.categories.module-category")
require("prototypes.equipment-grid")
require("prototypes.categories.equipment-category")
require("prototypes.shortcuts")
require("prototypes.trigger-target-types")
require("prototypes.entity.projectiles")
require("prototypes.entity.beams")
require("prototypes.utility-sprites")
require("prototypes.technology")
require("prototypes.tips-and-tricks")
require("prototypes.achievements")
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
require("prototypes.legacy.legacy-entities")
require("prototypes.custom-inputs")

local menu_simulations = require("__base__/menu-simulations/menu-simulations")
if not data.raw["utility-constants"]["default"].main_menu_simulations then
  data.raw["utility-constants"]["default"].main_menu_simulations = {}
end
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
main_menu_simulations.solar_power_construction = menu_simulations.solar_power_construction
main_menu_simulations.lab = menu_simulations.lab
main_menu_simulations.burner_city = menu_simulations.burner_city
main_menu_simulations.mining_defense = menu_simulations.mining_defense
main_menu_simulations.forest_fire = menu_simulations.forest_fire
main_menu_simulations.oil_pumpjacks = menu_simulations.oil_pumpjacks
main_menu_simulations.oil_refinery = menu_simulations.oil_refinery
main_menu_simulations.early_smelting = menu_simulations.early_smelting
main_menu_simulations.train_station = menu_simulations.train_station
main_menu_simulations.logistic_robots = menu_simulations.logistic_robots
main_menu_simulations.nuclear_power = menu_simulations.nuclear_power
main_menu_simulations.train_junction = menu_simulations.train_junction
main_menu_simulations.artillery = menu_simulations.artillery
main_menu_simulations.biter_base_spidertron = menu_simulations.biter_base_spidertron
main_menu_simulations.biter_base_artillery = menu_simulations.biter_base_artillery
main_menu_simulations.biter_base_laser_defense = menu_simulations.biter_base_laser_defense
main_menu_simulations.biter_base_player_attack = menu_simulations.biter_base_player_attack
main_menu_simulations.biter_base_steamrolled = menu_simulations.biter_base_steamrolled
main_menu_simulations.chase_player = menu_simulations.chase_player
main_menu_simulations.big_defense = menu_simulations.big_defense
main_menu_simulations.brutal_defeat = menu_simulations.brutal_defeat
main_menu_simulations.spider_ponds = menu_simulations.spider_ponds

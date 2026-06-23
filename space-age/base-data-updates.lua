require("circuit-connector-sprites")
require("prototypes.entity.base-frozen-graphics")

local meld = require("__core__.lualib.meld")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local cargo_pod_catalogue_additions = require("__space-age__/prototypes/entity/cargo-pod-catalogue")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local function add_recipe_category(recipe, category)
  recipe.categories = recipe.categories or {"crafting"}
  table.insert(recipe.categories, category)
end

data.raw.technology["space-science-pack"].localised_description = {"technology-description.space-science-pack-space-age"}
data.raw["rocket-silo"]["rocket-silo"].launch_to_space_platforms = true
data.raw["rocket-silo"]["rocket-silo"].to_be_inserted_to_rocket_inventory_size = nil
data.raw["rocket-silo"]["rocket-silo"].logistic_trash_inventory_size = 20
data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].inventory_size = 20
data.raw.item["rocket-silo"].flags = data.raw.item["rocket-silo"].flags or {}
table.insert(data.raw.item["rocket-silo"].flags, "draw-logistic-overlay")
data.raw["item"]["satellite"] = nil
data.raw["recipe"]["satellite"] = nil

local underground_collision_mask = {layers={lava_tile=true, empty_space=true}}
data.raw["underground-belt"]["underground-belt"].underground_collision_mask = underground_collision_mask
data.raw["underground-belt"]["fast-underground-belt"].underground_collision_mask = underground_collision_mask
data.raw["underground-belt"]["express-underground-belt"].underground_collision_mask = underground_collision_mask
data.raw["underground-belt"]["turbo-underground-belt"].underground_collision_mask = underground_collision_mask

data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].underground_collision_mask = underground_collision_mask

for k = 1, 7 do
  data.raw.technology["energy-weapons-damage-" .. k] = nil
end

data.raw.technology["rocket-silo"].effects =
  {
    {
      type = "unlock-recipe",
      recipe = "rocket-silo"
    },
    {
      type = "unlock-recipe",
      recipe = "rocket-part"
    },
    {
      type = "unlock-recipe",
      recipe = "cargo-landing-pad"
    },
    {
      type = "unlock-space-platforms",
      modifier = true,
      hidden = true
    },
    {
      type = "unlock-recipe",
      recipe = "space-platform-starter-pack"
    },
    {
      type = "unlock-recipe",
      recipe = "space-platform-foundation"
    }
  }

data.raw.technology["space-science-pack"].research_trigger =
  {
    type = "build-entity",
    entity = "asteroid-collector"
  }
data.raw.technology["space-science-pack"].prerequisites = {"space-platform"}
data.raw.technology["space-science-pack"].effects =
{
  {
    type = "unlock-recipe",
    recipe = "space-science-pack"
  }
}

data.raw.character.character.synced_footstep_particle_triggers[1].tiles = { "water-shallow", "wetland-blue-slime", "wetland-light-green-slime", "wetland-green-slime", "wetland-light-dead-skin", "wetland-dead-skin", "wetland-pink-tentacle", "wetland-red-tentacle", "wetland-yumako", "wetland-jellynut"}

--data.raw["furnace"]["stone-furnace"].heating_energy = "50kW"
--data.raw["furnace"]["steel-furnace"].heating_energy = "50kW"
data.raw["furnace"]["electric-furnace"].heating_energy = "100kW"
data.raw["inserter"]["burner-inserter"].heating_energy = "0kW"
data.raw["inserter"]["inserter"].heating_energy = "30kW"
data.raw["inserter"]["fast-inserter"].heating_energy = "30kW"
data.raw["inserter"]["long-handed-inserter"].heating_energy = "50kW"
data.raw["inserter"]["bulk-inserter"].heating_energy = "50kW"
data.raw["assembling-machine"]["assembling-machine-1"].heating_energy = "100kW"
data.raw["assembling-machine"]["assembling-machine-2"].heating_energy = "100kW"
data.raw["assembling-machine"]["assembling-machine-3"].heating_energy = "100kW"
data.raw["assembling-machine"]["oil-refinery"].heating_energy = "200kW"
data.raw["assembling-machine"]["chemical-plant"].heating_energy = "100kW"
data.raw["assembling-machine"]["centrifuge"].heating_energy = "100kW"
data.raw["lab"]["lab"].heating_energy = "100kW"
data.raw["rocket-silo"]["rocket-silo"].heating_energy = "300kW"
data.raw["roboport"]["roboport"].heating_energy = "300kW"
data.raw["storage-tank"]["storage-tank"].heating_energy = "100kW"
data.raw["pipe"]["pipe"].heating_energy = "1kW"
data.raw["pipe-to-ground"]["pipe-to-ground"].heating_energy = "150kW"
data.raw["pump"]["pump"].heating_energy = "30kW"
data.raw["beacon"]["beacon"].heating_energy = "400kW"
data.raw["radar"]["radar"].heating_energy = "300kW"
data.raw["generator"]["steam-engine"].heating_energy = "50kW"
data.raw["generator"]["steam-turbine"].heating_energy = "50kW"
data.raw["transport-belt"]["transport-belt"].heating_energy = "10kW"
data.raw["transport-belt"]["fast-transport-belt"].heating_energy = "10kW"
data.raw["transport-belt"]["express-transport-belt"].heating_energy = "10kW"
data.raw["underground-belt"]["underground-belt"].heating_energy = "50kW"
data.raw["underground-belt"]["fast-underground-belt"].heating_energy = "100kW"
data.raw["underground-belt"]["express-underground-belt"].heating_energy = "150kW"
data.raw["splitter"]["splitter"].heating_energy = "40kW"
data.raw["splitter"]["fast-splitter"].heating_energy = "40kW"
data.raw["splitter"]["express-splitter"].heating_energy = "40kW"
data.raw["mining-drill"]["electric-mining-drill"].heating_energy = "100kW"
data.raw["mining-drill"]["burner-mining-drill"].heating_energy = "50kW"
data.raw["mining-drill"]["pumpjack"].heating_energy = "50kW"
data.raw["arithmetic-combinator"]["arithmetic-combinator"].heating_energy = "50kW"
data.raw["decider-combinator"]["decider-combinator"].heating_energy = "50kW"
data.raw["selector-combinator"]["selector-combinator"].heating_energy = "100kW"
data.raw["programmable-speaker"]["programmable-speaker"].heating_energy = "30kW"
data.raw["power-switch"]["power-switch"].heating_energy = "20kW"
data.raw["ammo-turret"]["gun-turret"].heating_energy = "50kW"
data.raw["electric-turret"]["laser-turret"].heating_energy = "50kW"
data.raw["artillery-turret"]["artillery-turret"].heating_energy = "200kW"
data.raw["furnace"]["recycler"].heating_energy = "100kW"
data.raw["valve"]["one-way-valve"].heating_energy = "20kW"
data.raw["valve"]["overflow-valve"].heating_energy = "20kW"
data.raw["valve"]["top-up-valve"].heating_energy = "20kW"

data.raw["rocket-silo"]["rocket-silo"].surface_conditions =
{
  {
    property = "pressure",
    min = 1
  }
}

table.insert(data.raw["cargo-landing-pad"]["cargo-landing-pad"].flags, "hide-alt-info")
data.raw["cargo-landing-pad"]["cargo-landing-pad"].trash_inventory_size = 20
data.raw["cargo-landing-pad"]["cargo-landing-pad"].surface_conditions =
{
  {
    property = "gravity",
    min = 1
  }
}
data.raw["cargo-landing-pad"]["cargo-landing-pad"].cargo_station_parameters.hatch_definitions =
{
  planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
  planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
  planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3)
}
data.raw["cargo-landing-pad"]["cargo-landing-pad"].cargo_station_parameters.giga_hatch_definitions =
{
  planet_upper_giga_hatch({0,1,2})
}

local function ten_pressure_condition()
  return
  {
    {
      property = "pressure",
      min = 10
    }
  }
end

local function one_gravity_condition()
  return
  {
    {
      property = "gravity",
      min = 1
    }
  }
end

data.raw["fluid-turret"]["flamethrower-turret"].surface_conditions = ten_pressure_condition()
data.raw["furnace"]["stone-furnace"].surface_conditions = ten_pressure_condition()
data.raw["mining-drill"]["burner-mining-drill"].surface_conditions = ten_pressure_condition()
data.raw["furnace"]["steel-furnace"].surface_conditions = ten_pressure_condition()
data.raw["boiler"]["boiler"].surface_conditions = ten_pressure_condition()
data.raw["roboport"]["roboport"].surface_conditions = ten_pressure_condition()
data.raw["inserter"]["burner-inserter"].surface_conditions = ten_pressure_condition()
data.raw["car"]["car"].surface_conditions = one_gravity_condition()
data.raw["car"]["tank"].surface_conditions = one_gravity_condition()
data.raw["spider-vehicle"]["spidertron"].surface_conditions = one_gravity_condition()
data.raw["legacy-curved-rail"]["legacy-curved-rail"].surface_conditions = one_gravity_condition()
data.raw["legacy-straight-rail"]["legacy-straight-rail"].surface_conditions = one_gravity_condition()
data.raw["locomotive"]["locomotive"].surface_conditions = one_gravity_condition()
data.raw["cargo-wagon"]["cargo-wagon"].surface_conditions = one_gravity_condition()
data.raw["fluid-wagon"]["fluid-wagon"].surface_conditions = one_gravity_condition()
data.raw["artillery-wagon"]["artillery-wagon"].surface_conditions = one_gravity_condition()
data.raw["train-stop"]["train-stop"].surface_conditions = one_gravity_condition()
data.raw["rail-signal"]["rail-signal"].surface_conditions = one_gravity_condition()
data.raw["rail-chain-signal"]["rail-chain-signal"].surface_conditions = one_gravity_condition()
data.raw["curved-rail-b"]["curved-rail-b"].surface_conditions = one_gravity_condition()
data.raw["curved-rail-a"]["curved-rail-a"].surface_conditions = one_gravity_condition()
data.raw["half-diagonal-rail"]["half-diagonal-rail"].surface_conditions = one_gravity_condition()
data.raw["straight-rail"]["straight-rail"].surface_conditions = one_gravity_condition()

data.raw["rail-ramp"]["rail-ramp"].surface_conditions = one_gravity_condition()
data.raw["elevated-straight-rail"]["elevated-straight-rail"].surface_conditions = one_gravity_condition()
data.raw["elevated-half-diagonal-rail"]["elevated-half-diagonal-rail"].surface_conditions = one_gravity_condition()
data.raw["elevated-curved-rail-a"]["elevated-curved-rail-a"].surface_conditions = one_gravity_condition()
data.raw["elevated-curved-rail-b"]["elevated-curved-rail-b"].surface_conditions = one_gravity_condition()
data.raw["rail-support"]["rail-support"].surface_conditions = one_gravity_condition()

-- TODO: AssemblingMachinePrototype demands 4 directions, circuit_connector_definitions provides only 1 so far
data.raw["rocket-silo"]["rocket-silo"].circuit_connector = circuit_connector_definitions["rocket-silo"]
data.raw["rocket-silo"]["rocket-silo"].circuit_wire_max_distance = default_circuit_wire_max_distance

local containers = -- prototype type -> list[prototype name]
{
  container = { "wooden-chest", "iron-chest", "steel-chest", --[[ "red-chest", "blue-chest" ]] },
  ["logistic-container"] = { "passive-provider-chest", "active-provider-chest", "storage-chest", "buffer-chest", "requester-chest" },
--  ["infinity-container"] = { "infinity-chest" },
--  ["linked-container"] = { "linked-chest" }
}
for t,l in pairs(containers) do
  for _,n in pairs(l) do
    data.raw[t][n].surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1
      }
    }
  end
end

for _, connection in pairs(data.raw["infinity-pipe"]["infinity-pipe"].fluid_box.pipe_connections) do
  connection.connection_category = {"default", "fusion-reactor", "fusion-generator"}
end

add_recipe_category(data.raw.recipe["transport-belt"], "metallurgy")
add_recipe_category(data.raw.recipe["underground-belt"], "metallurgy")
add_recipe_category(data.raw.recipe["splitter"], "metallurgy")
add_recipe_category(data.raw.recipe["fast-transport-belt"], "metallurgy")
add_recipe_category(data.raw.recipe["fast-underground-belt"], "metallurgy")
add_recipe_category(data.raw.recipe["fast-splitter"], "metallurgy")
add_recipe_category(data.raw.recipe["express-transport-belt"], "metallurgy")
add_recipe_category(data.raw.recipe["express-underground-belt"], "metallurgy")
add_recipe_category(data.raw.recipe["express-splitter"], "metallurgy")

add_recipe_category(data.raw.recipe["beacon"], "electromagnetics")
add_recipe_category(data.raw.recipe["solar-panel"], "electromagnetics")

add_recipe_category(data.raw.recipe["speed-module"], "electromagnetics")
add_recipe_category(data.raw.recipe["speed-module-2"], "electromagnetics")
add_recipe_category(data.raw.recipe["speed-module-3"], "electromagnetics")
table.insert(data.raw.recipe["speed-module-3"].ingredients, {type = "item", name = "tungsten-carbide", amount = 1})

add_recipe_category(data.raw.recipe["productivity-module"], "electromagnetics")
add_recipe_category(data.raw.recipe["productivity-module-2"], "electromagnetics")
add_recipe_category(data.raw.recipe["productivity-module-3"], "electromagnetics")
table.insert(data.raw.recipe["productivity-module-3"].ingredients, {type = "item", name = "biter-egg", amount = 1})

add_recipe_category(data.raw.recipe["efficiency-module"], "electromagnetics")
add_recipe_category(data.raw.recipe["efficiency-module-2"], "electromagnetics")
add_recipe_category(data.raw.recipe["efficiency-module-3"], "electromagnetics")
table.insert(data.raw.recipe["efficiency-module-3"].ingredients, {type = "item", name = "spoilage", amount = 5})

add_recipe_category(data.raw.recipe["sulfuric-acid"], "cryogenics")

add_recipe_category(data.raw.recipe["heavy-oil-cracking"], "organic")
add_recipe_category(data.raw.recipe["light-oil-cracking"], "organic")
add_recipe_category(data.raw.recipe["rocket-fuel"], "organic")

table.insert(data.raw.lab["lab"].inputs, "metallurgic-science-pack")
table.insert(data.raw.lab["lab"].inputs, "agricultural-science-pack")
table.insert(data.raw.lab["lab"].inputs, "electromagnetic-science-pack")
table.insert(data.raw.lab["lab"].inputs, "cryogenic-science-pack")
table.insert(data.raw.lab["lab"].inputs, "promethium-science-pack")

data.raw.lab["lab"].icons_positioning =
{
  {inventory_index = defines.inventory.lab_modules, shift = {0, 0.9}},
  {inventory_index = defines.inventory.lab_input, shift = {0, 0}, max_icons_per_row = 6, separation_multiplier = 1/1.1}
}

table.insert(data.raw["land-mine"]["land-mine"].action.action_delivery.source_effects, { type = "damage-tile", damage = { amount = 100, type = "explosion"}, radius = 3 })

data.raw.item["rocket-silo"].subgroup = "space-interactors"
data.raw.item["cargo-landing-pad"].subgroup = "space-interactors"
data.raw["cargo-pod"]["cargo-pod"].subgroup = "space-interactors"

local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
data.raw["cargo-pod"]["cargo-pod"].factoriopedia_simulation = simulations.factoriopedia_cargo_pod_space
data.raw["temporary-container"]["cargo-pod-container"].subgroup = "space-interactors"

local pfunctions = require("__space-age__/prototypes/planet/general/general-functions")
data.raw["cargo-pod"]["cargo-pod"].procession_graphic_catalogue = pfunctions.conc2(data.raw["cargo-pod"]["cargo-pod"].procession_graphic_catalogue, cargo_pod_catalogue_additions)

data.raw.planet.nauvis.subgroup = "planets"
data.raw.planet.nauvis.asteroid_spawn_influence = 1
data.raw.planet.nauvis.asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.1)

data.raw["item-subgroup"].module.order = "g"
data.raw["item-subgroup"]["space-related"].group = "space"
data.raw["item-subgroup"]["space-related"].order = "e"

data.raw.recipe["coal-liquefaction"].order = "a[oil-processing]-d[coal-liquefaction]"

add_recipe_category(data.raw.recipe.sulfur, "cryogenics")

add_recipe_category(data.raw.recipe["accumulator"], "electromagnetics")
add_recipe_category(data.raw.recipe["discharge-defense-equipment"], "electromagnetics")
add_recipe_category(data.raw.recipe["electronic-circuit"], "electromagnetics")
add_recipe_category(data.raw.recipe["small-electric-pole"], "electromagnetics")
add_recipe_category(data.raw.recipe["big-electric-pole"], "electromagnetics")
add_recipe_category(data.raw.recipe["medium-electric-pole"], "electromagnetics")
add_recipe_category(data.raw.recipe["copper-cable"], "electromagnetics")
add_recipe_category(data.raw.recipe["advanced-circuit"], "electromagnetics")
add_recipe_category(data.raw.recipe["processing-unit"], "electromagnetics")
add_recipe_category(data.raw.recipe.substation, "electromagnetics")

add_recipe_category(data.raw.recipe["plastic-bar"], "cryogenics")
add_recipe_category(data.raw.recipe.explosives, "cryogenics")
add_recipe_category(data.raw.recipe.battery, "cryogenics")

data.raw.recipe["personal-roboport-mk2-equipment"].ingredients =
{
  {type = "item", name = "personal-roboport-equipment", amount = 5},
  {type = "item", name = "processing-unit", amount = 50},
  {type = "item", name = "superconductor", amount = 50}
}

data.raw.recipe["artillery-turret"].ingredients =
{
  {type = "item", name = "tungsten-plate", amount = 60},
  {type = "item", name = "refined-concrete", amount = 60},
  {type = "item", name = "iron-gear-wheel", amount = 40},
  {type = "item", name = "processing-unit", amount = 10}
}

data.raw.recipe["destroyer-capsule"].ingredients =
{
  {type = "item", name = "distractor-capsule", amount = 4},
  {type = "item", name = "steel-plate", amount = 4},
  {type = "item", name = "processing-unit", amount = 1}
}

data.raw.capsule["cliff-explosives"].default_import_location = "vulcanus"
data.raw.recipe["cliff-explosives"].ingredients =
{
  {type = "item", name = "explosives", amount = 10},
  {type = "item", name = "calcite", amount = 10},
  {type = "item", name = "grenade", amount = 1},
  {type = "item", name = "barrel", amount = 1}
}

data.raw.recipe["atomic-bomb"].ingredients[3] = {type = "item", name = "uranium-235", amount = 100}

data.raw.recipe["artillery-shell"].ingredients =
{
  {type = "item", name = "radar", amount = 1},
  {type = "item", name = "calcite", amount = 1},
  {type = "item", name = "tungsten-plate", amount = 4},
  {type = "item", name = "explosives", amount = 8}
}

data.raw.recipe["assembling-machine-3"].ingredients =
{
  {type = "item", name = "assembling-machine-2", amount = 2},
  {type = "item", name = "speed-module", amount = 4}
}

data.raw.recipe.spidertron.ingredients =
{
  {type = "item", name = "exoskeleton-equipment", amount = 4},
  {type = "item", name = "fission-reactor-equipment", amount = 2},
  {type = "item", name = "rocket-turret", amount = 1},
  {type = "item", name = "radar", amount = 2},
  {type = "item", name = "raw-fish", amount = 1}
}

data.raw.recipe["artillery-wagon"].ingredients =
{
  {type = "item", name = "engine-unit", amount = 60},
  {type = "item", name = "tungsten-plate", amount = 60},
  {type = "item", name = "refined-concrete", amount = 60},
  {type = "item", name = "iron-gear-wheel", amount = 40},
  {type = "item", name = "processing-unit", amount = 10}
}

data.raw.recipe["power-armor-mk2"].ingredients[1] = {type = "item", name = "efficiency-module", amount = 100}
data.raw.recipe["power-armor-mk2"].ingredients[2] = {type = "item", name = "speed-module", amount = 100}

data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 50
data.raw.recipe["rocket-part"].ingredients =
{
  {type = "item", name = "processing-unit", amount = 1},
  {type = "item", name = "low-density-structure", amount = 1},
  {type = "item", name = "rocket-fuel", amount = 1}
}
data.raw.item["rocket-part"].subgroup = "space-interactors"
data.raw.item["rocket-part"].order = "b[rocket-part]"

data.raw["rocket-silo"]["rocket-silo"].cargo_station_parameters.prefer_packed_cargo_units = true

data.raw.technology["logistic-system"].prerequisites = {"space-science-pack"}
data.raw.technology["logistic-system"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1}
}


data.raw.technology["physical-projectile-damage-6"].effects[1].modifier = 0.2
data.raw.technology["physical-projectile-damage-6"].effects[2].modifier = 0.2
data.raw.technology["physical-projectile-damage-7"].effects[1].modifier = 0.2
data.raw.technology["physical-projectile-damage-7"].effects[2].modifier = 0.2
data.raw.technology["physical-projectile-damage-7"].prerequisites = {"physical-projectile-damage-6", "space-science-pack"}

data.raw.technology["stronger-explosives-5"].prerequisites = {"stronger-explosives-4", "space-science-pack"}
data.raw.technology["stronger-explosives-5"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"military-science-pack", 1},
  {"chemical-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1}
}

data.raw.technology["stronger-explosives-6"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1}
}

data.raw.technology["stronger-explosives-7"].prerequisites = {"stronger-explosives-6", "agricultural-science-pack"}
data.raw.technology["stronger-explosives-7"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1},
  {"agricultural-science-pack", 1}
}

data.raw.technology["refined-flammables-6"].prerequisites = {"refined-flammables-5", "space-science-pack"}
data.raw.technology["refined-flammables-6"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1}
}

data.raw.technology["refined-flammables-7"].prerequisites = {"refined-flammables-6", "agricultural-science-pack"}
data.raw.technology["refined-flammables-7"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1},
  {"agricultural-science-pack", 1}
}

data.raw.technology["laser-weapons-damage-5"].effects =
{
  {
    ammo_category = "laser",
    modifier = 0.5,
    type = "ammo-damage"
  }
}

data.raw.technology["laser-weapons-damage-6"].effects =
{
  {
    ammo_category = "laser",
    modifier = 0.7,
    type = "ammo-damage"
  }
}

data.raw.technology["laser-weapons-damage-7"].prerequisites = {"laser-weapons-damage-6", "space-science-pack"}
data.raw.technology["laser-weapons-damage-7"].effects =
{
  {
    ammo_category = "laser",
    modifier = 0.7,
    type = "ammo-damage"
  }
}

data.raw.technology["artillery-shell-range-1"].prerequisites = {"artillery"}
data.raw.technology["artillery-shell-range-1"].unit =
{
  count_formula = "2^(L-1)*1000",
  ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"military-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1}
  },
  time = 60
}

data.raw.technology["artillery-shell-speed-1"].prerequisites = {"artillery"}
data.raw.technology["artillery-shell-speed-1"].unit =
{
  count_formula = "2^(L-1)*1000",
  ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"military-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1}
  },
  time = 60
}

data.raw.technology["atomic-bomb"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1}
}

data.raw.technology["automation-3"].unit.count = 500

data.raw.technology["cliff-explosives"].prerequisites =
{
  "explosives",
  "military-science-pack",
  "metallurgic-science-pack"
}

data.raw.technology["cliff-explosives"].unit =
{
  count = 500,
  ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1}
  },
  time = 30
}

data.raw.technology["power-armor-mk2"].prerequisites =
{
  "power-armor",
  "military-4",
  "speed-module",
  "efficiency-module"
}

data.raw.technology["rocket-silo"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1}
}

data.raw.technology["rocket-silo"].prerequisites =
{
  "concrete",
  "rocket-fuel",
  "processing-unit",
  "logistic-robotics",
  "low-density-structure",
  "advanced-material-processing-2"
}

table.insert(data.raw.technology["follower-robot-count-5"].prerequisites, "production-science-pack")

data.raw.technology["worker-robots-speed-6"].unit.count = 1000
data.raw.technology["worker-robots-speed-6"].unit.count_formula = nil
data.raw.technology["worker-robots-speed-6"].order = "c-k-f-f"
data.raw.technology["worker-robots-speed-6"].max_level = nil
data.raw.technology["worker-robots-speed-6"].prerequisites = {"worker-robots-speed-5", "space-science-pack"}

data.raw.technology["energy-shield-mk2-equipment"].prerequisites =
{
  "energy-shield-equipment",
  "military-4",
  "electromagnetic-science-pack",
  "power-armor"
}
data.raw.technology["energy-shield-mk2-equipment"].unit.count = 750
data.raw.technology["energy-shield-mk2-equipment"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"space-science-pack", 1},
  {"utility-science-pack", 1},
  {"electromagnetic-science-pack", 1}
}

data.raw.technology["battery-mk2-equipment"].prerequisites =
{
  "battery-equipment",
  "power-armor",
  "utility-science-pack"
}
data.raw.technology["battery-mk2-equipment"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"utility-science-pack", 1}
}

data.raw.technology["personal-roboport-mk2-equipment"].prerequisites =
{
  "personal-roboport-equipment",
  "electromagnetic-science-pack",
  "utility-science-pack"
}
data.raw.technology["personal-roboport-mk2-equipment"].unit.count = 750
data.raw.technology["personal-roboport-mk2-equipment"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1},
  {"electromagnetic-science-pack", 1}
}


data.raw.technology["coal-liquefaction"].prerequisites = {"metallurgic-science-pack"}
data.raw.technology["coal-liquefaction"].unit =
{
  count = 500,
  ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1}
  },
  time = 30
}

data.raw.technology["speed-module-2"].prerequisites = {"speed-module", "space-science-pack"}
data.raw.technology["speed-module-2"].unit.count = 200
data.raw.technology["speed-module-2"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1}
}

data.raw.technology["speed-module-3"].prerequisites =
{
  "speed-module-2",
  "metallurgic-science-pack"
}
data.raw.technology["speed-module-3"].unit.count = 2000
data.raw.technology["speed-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"metallurgic-science-pack", 1}
}

data.raw.technology["productivity-module-2"].prerequisites = {"productivity-module", "space-science-pack"}
data.raw.technology["productivity-module-2"].unit.count = 200
data.raw.technology["productivity-module-2"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1}
}

data.raw.technology["productivity-module-3"].prerequisites =
{
  "productivity-module-2",
  "biter-egg-handling"
}
data.raw.technology["productivity-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"agricultural-science-pack", 1}
}

data.raw.technology["efficiency-module-2"].prerequisites = {"efficiency-module", "space-science-pack"}
data.raw.technology["efficiency-module-2"].unit.count = 200
data.raw.technology["efficiency-module-2"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1}
}

data.raw.technology["efficiency-module-3"].prerequisites =
{
  "efficiency-module-2",
  "agricultural-science-pack"
}
data.raw.technology["efficiency-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"agricultural-science-pack", 1}
}

data.raw.technology["kovarex-enrichment-process"].prerequisites = {"uranium-processing", "space-science-pack"}
data.raw.technology["kovarex-enrichment-process"].unit =
{
  count = 1000,
  ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"space-science-pack", 1}
  },
  time = 30
}


data.raw.technology["mining-productivity-3"].prerequisites = {"mining-productivity-2", "production-science-pack"}
data.raw.technology["mining-productivity-3"].unit = {
  count_formula = "1000*(L - 2)",
  ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1}
  },
  time = 60
}
data.raw.technology["mining-productivity-3"].max_level = "infinite"

data.raw.technology["mining-productivity-4"] = nil


data.raw.technology.artillery.prerequisites =
{
  "military-4",
  "metallurgic-science-pack",
  "radar"
}
data.raw.technology.artillery.unit.count = 1500
data.raw.technology.artillery.unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1},
  {"metallurgic-science-pack", 1}
}

data.raw.technology.spidertron.prerequisites =
{
  "rocket-turret",
  "exoskeleton-equipment",
  "fission-reactor-equipment",
  "military-4",
  "production-science-pack",
  "radar"
}

data.raw.technology.spidertron.unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"military-science-pack", 1},
  {"chemical-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1},
  {"agricultural-science-pack", 1}
}
data.raw.technology.spidertron.order = "d-e-h"

table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-light-green-slime")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-green-slime")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-light-dead-skin")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-dead-skin")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-pink-tentacle")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-red-tentacle")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-yumako")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-jellynut")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "wetland-blue-slime");
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "gleba-deep-lake");

data.raw.item["space-science-pack"].stack_size = 200

data.raw.capsule["raw-fish"].spoil_ticks = 453000
data.raw.capsule["raw-fish"].spoil_result = "spoilage"

--quality stuff
if mods["quality"] then
  data.raw.technology["quality-module-2"].prerequisites = { "quality-module", "space-science-pack" }
  data.raw.technology["quality-module-2"].unit.count = 500
  data.raw.technology["quality-module-2"].unit.ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"space-science-pack", 1}
  }

  data.raw.technology["quality-module-3"].prerequisites = { "quality-module-2", "electromagnetic-science-pack" }
  data.raw.technology["quality-module-3"].unit =
  {
    count = 2000,
    ingredients =
    {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "space-science-pack", 1 },
      { "electromagnetic-science-pack", 1 }
    },
    time = 60
  }

  data.raw.technology["epic-quality"].prerequisites = { "agricultural-science-pack", "utility-science-pack", "quality-module" }
  data.raw.technology["epic-quality"].unit =
  {
    count = 5000,
    ingredients =
    {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "utility-science-pack", 1 },
      { "space-science-pack", 1 },
      { "agricultural-science-pack", 1 }
    },
    time = 60
  }

  data.raw.technology["legendary-quality"].prerequisites = { "cryogenic-science-pack", "epic-quality" }
  data.raw.technology["legendary-quality"].unit =
  {
    count = 5000,
    ingredients =
    {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "chemical-science-pack", 1 },
      { "production-science-pack", 1 },
      { "utility-science-pack", 1 },
      { "space-science-pack", 1 },
      { "metallurgic-science-pack", 1 },
      { "agricultural-science-pack", 1 },
      { "electromagnetic-science-pack", 1 },
      { "cryogenic-science-pack", 1 }
    },
    time = 60
  }

  data.raw.recipe["quality-module-3"].ingredients =
  {
    {type = "item", name = "quality-module-2", amount = 4},
    {type = "item", name = "advanced-circuit", amount = 5},
    {type = "item", name = "processing-unit", amount = 5},
    {type = "item", name = "superconductor", amount = 1}
  }

  add_recipe_category(data.raw.recipe["quality-module"], "electromagnetics")
  add_recipe_category(data.raw.recipe["quality-module-2"], "electromagnetics")
  add_recipe_category(data.raw.recipe["quality-module-3"], "electromagnetics")
end

data.raw["optimized-decorative"]["cracked-mud-decal"].tile_layer = 210
data.raw["optimized-decorative"]["light-mud-decal"].tile_layer = 210
data.raw["optimized-decorative"]["dark-mud-decal"].tile_layer = 210

data.raw.item.recycler.default_import_location = "fulgora"
data.raw.recipe.recycler.surface_conditions =
{
  {
    property = "magnetic-field",
    min = 99,
    max = 99
  }
}

data.raw.technology.recycling.prerequisites = {"planet-discovery-fulgora"}
data.raw.technology.recycling.unit = nil
data.raw.technology.recycling.research_trigger =
{
  type = "mine-entity",
  entities = {"fulgoran-ruin-vault"}
}
table.insert(data.raw.technology.recycling.effects,
{
  type = "unlock-recipe",
  recipe = "scrap-recycling",
})


data.raw.item["stone-brick"].place_as_tile =
{
  result = "stone-path",
  condition_size = 1,
  condition = {layers={water_tile=true, meltable=true}}
}

--[[
-- this works, but currently offshore pumps don't freeze so there's no reason to block them from meltable tiles
data.raw["offshore-pump"]["offshore-pump"].tile_buildability_rules =
{
  {area = {{-0.4, -0.4}, {0.4, 0.4}}, required_tiles = {ground_tile=true}, colliding_tiles = {meltable_layer}, remove_on_collision = true},
  {area = {{-1, -2}, {1, -1}}, required_tiles = {water_tile=true}, colliding_tiles = {ground_tile=true}}
}
]]

data.raw.tile["water-shallow"].landing_steps_sound = tile_sounds.landing.wet
data.raw.tile["grass-1"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["grass-2"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["grass-3"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["grass-4"].landing_steps_sound = tile_sounds.landing.grass
data.raw.tile["dry-dirt"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-1"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-2"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-3"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-4"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-5"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-6"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["dirt-7"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["sand-1"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["sand-2"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["sand-3"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-0"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-1"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-2"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["red-desert-3"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["nuclear-ground"].landing_steps_sound = tile_sounds.landing.sand
data.raw.tile["stone-path"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["lab-dark-1"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["lab-dark-2"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["lab-white"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["tutorial-grid"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["concrete"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["hazard-concrete-left"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["hazard-concrete-right"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["refined-concrete"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["refined-hazard-concrete-left"].landing_steps_sound = tile_sounds.landing.concrete
data.raw.tile["refined-hazard-concrete-right"].landing_steps_sound = tile_sounds.landing.concrete


data.raw.tile["stone-path"].transitions[3] =
{
  to_tiles = lava_tile_type_names,
  transition_group = lava_transition_group_id,

  spritesheet = "__space-age__/graphics/terrain/lava-transitions/stone-path-lava.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/stone-path-lava-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(false,false,false),
  background_enabled = false,
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}

data.raw.tile["stone-path"].transitions_between_transitions[4] =
{
  transition_group1 = default_transition_group_id,
  transition_group2 = lava_transition_group_id,

  spritesheet = "__space-age__/graphics/terrain/lava-transitions/stone-path-lava-transitions.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/stone-path-lava-transitions-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(false,false,true),
  background_enabled = false,
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}
data.raw.tile["stone-path"].transitions_between_transitions[5] =
{
  transition_group1 = lava_transition_group_id,
  transition_group2 = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,
  background_enabled = true,

  spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/stone-path-lava-shore-out-of-map.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/stone-path-lava-shore-out-of-map-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(false,true,true),
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}
data.raw.tile["concrete"].transitions[3] =
{
  to_tiles = lava_tile_type_names,
  transition_group = lava_transition_group_id,

  spritesheet = "__space-age__/graphics/terrain/lava-transitions/concrete-lava.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/concrete-lava-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(false,false,false),
  background_enabled = false,
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}
data.raw.tile["concrete"].transitions_between_transitions[4] =
{
  transition_group1 = default_transition_group_id,
  transition_group2 = lava_transition_group_id,

  spritesheet = "__space-age__/graphics/terrain/lava-transitions/concrete-transitions-lava.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/concrete-transitions-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(false,false,true),
  background_enabled = false,
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}
data.raw.tile["concrete"].transitions_between_transitions[5] =
{
  transition_group1 = lava_transition_group_id,
  transition_group2 = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,
  background_enabled = true,

  spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/concrete-lava-shore-out-of-map.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/concrete-lava-shore-out-of-map-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(false,true,true),
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}

data.raw.tile["refined-concrete"].transitions[3] =
{
  to_tiles = lava_tile_type_names,
  transition_group = lava_transition_group_id,

  spritesheet = "__space-age__/graphics/terrain/lava-transitions/refined-concrete-lava.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/refined-concrete-lava-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(true,false,false),
  background_enabled = false,
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}
data.raw.tile["refined-concrete"].transitions_between_transitions[4] =
{
  transition_group1 = default_transition_group_id,
  transition_group2 = lava_transition_group_id,

  spritesheet = "__space-age__/graphics/terrain/lava-transitions/refined-concrete-transitions-lava.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/refined-concrete-transitions-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(true,false,true),
  background_enabled = false,
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}
data.raw.tile["refined-concrete"].transitions_between_transitions[5] =
{
  transition_group1 = lava_transition_group_id,
  transition_group2 = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,
  background_enabled = true,

  spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/refined-concrete-lava-shore-out-of-map.png",
  lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/refined-concrete-lava-shore-out-of-map-lightmap.png" },
  layout = tile_spritesheet_layout.concrete_layout(true,true,true),
  effect_map_layout =
  {
    spritesheet = "__base__/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
    inner_corner_count = 1,
    outer_corner_count = 1,
    side_count = 1,
    u_transition_count = 1,
    o_transition_count = 1
  }
}

for _, tile in pairs(data.raw.tile) do
  local has_transition_to_lava = false
  if tile.transitions ~= nil and tile.transitions_between_transitions ~= nil then
    for _, transition in pairs(tile.transitions) do
      if transition.transition_group == lava_transition_group_id then has_transition_to_lava = true end
    end


    if has_transition_to_lava == false then
      tile.transitions[#tile.transitions + 1] =
      {
        to_tiles = lava_tile_type_names,
        transition_group = lava_transition_group_id,
        spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone.png",
        layout = tile_spritesheet_layout.transition_16_16_16_4_4,
        lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone-lightmap.png" },
        effect_map_layout =
        {
          spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-mask.png",
          inner_corner_count = 8,
          outer_corner_count = 8,
          side_count = 8,
          u_transition_count = 2,
          o_transition_count = 1
        }
      }
      tile.transitions_between_transitions[#tile.transitions_between_transitions + 1] =
      {
        transition_group1 = default_transition_group_id,
        transition_group2 = lava_transition_group_id,
        spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone-transition.png",
        layout = tile_spritesheet_layout.transition_3_3_3_1_0,
        effect_map_layout =
        {
          spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-land-mask.png",
          o_transition_count = 0
        },
        water_patch = lava_patch
      }
      tile.transitions_between_transitions[#tile.transitions_between_transitions + 1] =
      {
        transition_group1 = lava_transition_group_id,
        transition_group2 = out_of_map_transition_group_id,
        background_layer_offset = 1,
        background_layer_group = "zero",
        offset_background_layer_by_tile_layer = true,
        spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-shore-out-of-map-transition.png",
        layout = tile_spritesheet_layout.transition_3_3_3_1_0,
        effect_map_layout =
        {
          spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-out-of-map-mask.png",
          o_transition_count = 0
        }
      }
    end
  end
end

data.raw["dont-build-entity-achievement"]["logistic-network-embargo"].research_with = {"metallurgic-science-pack", "electromagnetic-science-pack", "agricultural-science-pack"}

data.raw["utility-constants"].default.default_platform_surface_render_parameters =
  {
    shadow_opacity = 0.5,
    space_dust_background =
    {
      animation_speed = 1,
      noise_texture =
      {
        filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
        size = 4096,
        premul_alpha = false
      },
      asteroid_texture =
      {
        filename = "__space-age__/graphics/space/asteroidTexture.png",
        size = 1024
      },
      asteroid_normal_texture =
      {
        filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
        size = 1024
      },
    },
    space_dust_foreground =
    {
      animation_speed = 1,
      noise_texture =
      {
        filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
        size = 4096,
        premul_alpha = false
      },
      asteroid_texture =
      {
        filename = "__space-age__/graphics/space/asteroidTexture.png",
        size = 1024
      },
      asteroid_normal_texture =
      {
        filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
        size = 1024
      },
    }
  }

data.raw.planet["nauvis"].platform_surface_render_parameters =
{
  shadow_opacity = 0.5,
  space_dust_background =
  {
    animation_speed = 1,
    noise_texture =
    {
      filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
      size = 4096,
      premul_alpha = false
    },
    asteroid_texture =
    {
      filename = "__space-age__/graphics/space/asteroidTexture.png",
      size = 1024
    },
    asteroid_normal_texture =
    {
      filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
      size = 1024
    },
  },
  space_dust_foreground =
  {
    animation_speed = 1,
    noise_texture =
    {
      filename = "__space-age__/graphics/space/dustTrailSpeckDust.png",
      size = 4096,
      premul_alpha = false
    },
    asteroid_texture =
    {
      filename = "__space-age__/graphics/space/asteroidTexture.png",
      size = 1024
    },
    asteroid_normal_texture =
    {
      filename = "__space-age__/graphics/space/asteroidNormalTexture.png",
      size = 1024
    },
  },
  platform_backdrop =
  {
    cloudiness = 0.5,
    surface_vertical_offset = 0.1,
    cloud_vertical_offset = 0.015,
    specular_intensity = 1,
    atmosphere_color = {0.055, 0.09, 0.11, 0.1},
    cloud_flow_intensity = 0.5,
    cloud_panning_rate = -0.1,
    rotation_seconds = -660,
    planet_axis = {-33.0, -3.0},
    planet_axis_deviation_amplitude = {10.0, 10.0},
    planet_axis_deviation_seconds = {890.5, 753.7},
    position = {-680, 601},
    parallax_strength = {0.95, 0.95},
    light_direction = {-0.42, 0.23, 0.67},
    light_radius = 8.9,
    light_intensity_contrast = 0.3,
    radius = 600,
    planet_surface =
    {
      filename = "__space-age__/graphics/space/nauvis.png",
      width = 2048,
      height = 1024
    },
    planet_normal =
    {
      filename = "__space-age__/graphics/space/nauvis-normal.png",
      width = 2048,
      height = 1024
    },
    planet_reflectivity =
    {
      filename = "__space-age__/graphics/space/nauvis-reflectivity.png",
      width = 2048,
      height = 1024
    },
    global_cloud =
    {
      filename = "__space-age__/graphics/space/nauvis-cloud.png",
      width = 2048,
      height = 1024
    },
    global_cloud_normal =
    {
      filename = "__space-age__/graphics/space/nauvis-cloud-normal.png",
      width = 2048,
      height = 1024
    },
    global_cloud_flow =
    {
      filename = "__space-age__/graphics/space/nauvis-cloud-flow.png",
      width = 2048,
      height = 1024
    }
  }
}
data.raw.planet["vulcanus"].platform_surface_render_parameters = util.table.deepcopy(data.raw.planet["nauvis"].platform_surface_render_parameters)
data.raw.planet["gleba"].platform_surface_render_parameters = util.table.deepcopy(data.raw.planet["nauvis"].platform_surface_render_parameters)
data.raw.planet["fulgora"].platform_surface_render_parameters = util.table.deepcopy(data.raw.planet["nauvis"].platform_surface_render_parameters)
data.raw.planet["aquilo"].platform_surface_render_parameters = util.table.deepcopy(data.raw.planet["nauvis"].platform_surface_render_parameters)

data.raw.planet["vulcanus"].platform_surface_render_parameters.platform_backdrop =
{
  emission_scales_with_shadow = false,
  radius = 772,
  rotation_seconds = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.rotation_seconds * 2 / 4.66,
  light_radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.light_radius * 1.5,
  cloudiness = 0.5,
  surface_vertical_offset = 0.12,
  cloud_vertical_offset = 0.05,
  specular_intensity = 0,
  atmosphere_color = {0.072, 0.073, 0.067, 0.1},
  cloud_flow_intensity = 0.8,
  cloud_panning_rate = -0.025,
  planet_axis = {3.0, 13.0},
  planet_axis_deviation_amplitude = {10.0, 10.0},
  planet_axis_deviation_seconds = {890.5*2/4.66, 753.7*2/4.66},
  position = {-680, 601},
  parallax_strength = {0.95, 0.95},
  light_direction = {-0.42, 0.23, 0.67},
  light_intensity_contrast = 0.3,
  planet_surface =
  {
    filename = "__space-age__/graphics/space/vulcanus.png",
    width = 2048,
    height = 1024
  },
  planet_normal = nil,
  planet_emission =
  {
    filename = "__space-age__/graphics/space/vulcanus-emission.png",
    width = 2048,
    height = 1024
  },
  global_cloud =
  {
    filename = "__space-age__/graphics/space/vulcanus-cloud.png",
    width = 2048,
    height = 1024
  },
  global_cloud_normal =
  {
    filename = "__space-age__/graphics/space/vulcanus-cloud-normal.png",
    width = 2048,
    height = 1024
  },
  global_cloud_flow =
  {
    filename = "__space-age__/graphics/space/vulcanus-cloud-flow.png",
    width = 2048,
    height = 1024
  }
}

data.raw.planet["gleba"].platform_surface_render_parameters.platform_backdrop =
{
  emission_scales_with_shadow = false,
  radius = 680,
  rotation_seconds = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.rotation_seconds / 0.6,
  light_radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.light_radius * 0.75,
  cloudiness = 0.6,
  surface_vertical_offset = 0.1,
  cloud_vertical_offset = 0.05,
  specular_intensity = 1,
  atmosphere_color = {0.053, 0.060, 0.03715, 0.1},
  cloud_flow_intensity = 0.8,
  cloud_panning_rate = -0.01,
  planet_axis = {-37.0, 18.0},
  planet_axis_deviation_amplitude = {10.0, 10.0},
  planet_axis_deviation_seconds = {890.5/0.6, 753.7/0.6},
  position = {-680, 601},
  parallax_strength = {0.95, 0.95},
  light_direction = {-0.42, 0.23, 0.67},
  light_intensity_contrast = 0.3,
  light_radius = 13.9,
  planet_surface =
  {
    filename = "__space-age__/graphics/space/gleba.png",
    width = 2048,
    height = 1024
  },
  planet_normal = nil,
  planet_reflectivity =
  {
    filename = "__space-age__/graphics/space/gleba-reflectivity.png",
    width = 2048,
    height = 1024
  },
  global_cloud =
  {
    filename = "__space-age__/graphics/space/gleba-cloud.png",
    width = 2048,
    height = 1024
  },
  global_cloud_normal =
  {
    filename = "__space-age__/graphics/space/gleba-cloud-normal.png",
    width = 2048,
    height = 1024
  },
  global_cloud_flow =
  {
    filename = "__space-age__/graphics/space/gleba-cloud-flow.png",
    width = 2048,
    height = 1024
  }
}

data.raw.planet["fulgora"].platform_surface_render_parameters.platform_backdrop =
{
  emission_scales_with_shadow = false,
  radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.radius * 0.7,
  rotation_seconds = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.rotation_seconds / 1.8,
  light_radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.light_radius * 0.75,
  cloudiness = 0.05,
  surface_vertical_offset = 0.1,
  cloud_vertical_offset = 0.07,
  specular_intensity = 0.7,
  specular_color = {0.95, 0.83, 0.52, 1},
  atmosphere_color = {0.07, 0.057, 0.075, 0.1},
  cloud_flow_intensity = 1.5,
  cloud_panning_rate = 0.1,
  planet_axis = {3.0, 13.0},
  planet_axis_deviation_amplitude = {10.0, 10.0},
  planet_axis_deviation_seconds = {890.5/1.8, 753.7/1.8},
  position = {-400, 270},
  parallax_strength = {0.95, 0.95},
  light_direction = {-0.42, 0.23, 0.4},
  light_intensity_contrast = 0.3,
  light_radius = 5.9,
  hero_clouds_are_emissive = true,
  hero_clouds =
  {
    {
      sprite_index = 1,
      rotate_with_planet = false,
      positions = {{0.2, 0.5}},
      position_deviation = {-0.05, -0.3},
      rotation_deviation = 100.0,
      starting_frame_offset = 0,
      size = {0.3, 0.3}
    },
    {
      sprite_index = 1,
      rotate_with_planet = false,
      positions = {{0.21, 0.7}},
      position_deviation = {0.05, -0.2},
      rotation_deviation = 1.0,
      starting_frame_offset = 24,
      size = {0.3, 0.3}
    },
    {
      sprite_index = 1,
      rotate_with_planet = false,
      positions = {{0.21, 0.9}},
      position_deviation = {-0.05, -0.4},
      rotation_deviation = 1.0,
      starting_frame_offset = 32,
      size = {0.3, 0.3}
    },
    {
      sprite_index = 1,
      rotate_with_planet = false,
      positions = {{0.21, 0.9}},
      position_deviation = {-0.05, -0.4},
      rotation_deviation = 1.0,
      starting_frame_offset = 64,
      size = {0.3, 0.3}
    }
  },
  hero_cloud_texture_1 = util.sprite_load("__space-age__/graphics/space/planet-lightning",{
    frame_count = 12,
    frame_sequence = {1,2,3,4,5,6,7,8,9,10,11,12,
    12,12,12,12,12,12,12,12,12,12,
    12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,},
    --12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12},
  animation_speed = 0.5
  }),
  planet_surface =
  {
    filename = "__space-age__/graphics/space/fulgora.png",
    width = 2048,
    height = 1024
  },
  planet_normal =
  {
    filename = "__space-age__/graphics/space/fulgora-normal.png",
    width = 2048,
    height = 1024
  },
  planet_reflectivity =
  {
    filename = "__space-age__/graphics/space/fulgora-reflectivity.png",
    width = 2048,
    height = 1024
  },
  global_cloud =
  {
    filename = "__space-age__/graphics/space/fulgora-cloud.png",
    width = 2048,
    height = 1024
  },
  global_cloud_normal =
  {
    filename = "__space-age__/graphics/space/fulgora-cloud-normal.png",
    width = 2048,
    height = 1024
  },
  global_cloud_flow =
  {
    filename = "__space-age__/graphics/space/fulgora-cloud-flow.png",
    width = 2048,
    height = 1024
  }
}

data.raw.planet["aquilo"].platform_surface_render_parameters.platform_backdrop =
{
  emission_scales_with_shadow = false,
  radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.radius * 1.25,
  rotation_seconds = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.rotation_seconds / 0.45,
  light_radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.light_radius * 0.6,
  cloudiness = 0.32,
  surface_vertical_offset = 0.08,
  cloud_vertical_offset = 0.01,
  atmosphere_color = {0.075, 0.065, 0.133, 0.1},
  specular_color = {0.55, 0.43, 0.62, 1.0},
  specular_intensity = 1,
  atmosphere_ray_light_color_1 = {0.2, 0.25665, 0.3, 1.0},
  atmosphere_ray_light_color_2 = {0.1, 0.08431, 0.05059, 1.0},
  cloud_flow_intensity = 0.8,
  cloud_panning_rate = 0.2,
  light_intensity_contrast = 0.3,
  planet_axis = {3.0, 13.0},
  planet_axis_deviation_amplitude = {10.0, 10.0},
  planet_axis_deviation_seconds = {890.5/0.45, 753.7/0.45},
  position = {-680, 601},
  parallax_strength = {0.95, 0.95},
  light_direction = {-0.42, 0.23, 0.67},
  planet_surface =
  {
    filename = "__space-age__/graphics/space/aquilo.png",
    width = 2048,
    height = 1024
  },
  planet_reflectivity =
  {
    filename = "__space-age__/graphics/space/aquilo-reflectivity.png",
    width = 2048,
    height = 1024
  },
  planet_normal = nil,
  global_cloud =
  {
    filename = "__space-age__/graphics/space/aquilo-cloud.png",
    width = 2048,
    height = 1024
  },
  global_cloud_normal =
  {
    filename = "__space-age__/graphics/space/aquilo-cloud-normal.png",
    width = 2048,
    height = 1024
  },
  global_cloud_flow =
  {
    filename = "__space-age__/graphics/space/aquilo-cloud-flow.png",
    width = 2048,
    height = 1024
  }
}

require("circuit-connector-sprites")
require("prototypes.entity.base-frozen-graphics")

local meld = require("__core__.lualib.meld")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local cargo_pod_catalogue_additions = require("__space-age__/prototypes/entity/cargo-pod-catalogue")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

data.raw.technology["space-science-pack"].localised_description = {"technology-description.space-science-pack-space-age"}
data.raw["rocket-silo"]["rocket-silo"].launch_to_space_platforms = true
data.raw["rocket-silo"]["rocket-silo"].to_be_inserted_to_rocket_inventory_size = 20
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

data.raw.character.character.crafting_categories = {"crafting", "electronics", "pressing", "recycling-or-hand-crafting", "organic-or-hand-crafting", "organic-or-assembling"}
data.raw["god-controller"].default.crafting_categories = {"crafting", "electronics", "pressing", "recycling-or-hand-crafting", "organic-or-hand-crafting", "organic-or-assembling"}
data.raw.character.character.synced_footstep_particle_triggers[1].tiles = { "water-shallow", "wetland-blue-slime", "wetland-light-green-slime", "wetland-green-slime", "wetland-light-dead-skin", "wetland-dead-skin", "wetland-pink-tentacle", "wetland-red-tentacle", "wetland-yumako", "wetland-jellynut"}


data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "electronics", "pressing"}
data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics", "electronics-with-fluid", "pressing", "metallurgy-or-assembling", "organic-or-hand-crafting", "organic-or-assembling", "electronics-or-assembling", "cryogenics-or-assembling", "crafting-with-fluid-or-metallurgy"}
data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics", "electronics-with-fluid", "pressing", "metallurgy-or-assembling", "organic-or-hand-crafting", "organic-or-assembling", "electronics-or-assembling", "cryogenics-or-assembling", "crafting-with-fluid-or-metallurgy"}

data.raw["assembling-machine"]["chemical-plant"].crafting_categories = {"chemistry", "chemistry-or-cryogenics", "organic-or-chemistry"}

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

data.raw["rocket-silo"]["rocket-silo"].surface_conditions =
{
  {
    property = "pressure",
    min = 1
  }
}

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

local ten_pressure_condition =
{
  {
    property = "pressure",
    min = 10
  }
}

local one_gravity_condition =
{
  {
    property = "gravity",
    min = 1
  }
}

data.raw["fluid-turret"]["flamethrower-turret"].surface_conditions = ten_pressure_condition
data.raw["furnace"]["stone-furnace"].surface_conditions = ten_pressure_condition
data.raw["mining-drill"]["burner-mining-drill"].surface_conditions = ten_pressure_condition
data.raw["furnace"]["steel-furnace"].surface_conditions = ten_pressure_condition
data.raw["boiler"]["boiler"].surface_conditions = ten_pressure_condition
data.raw["roboport"]["roboport"].surface_conditions = ten_pressure_condition
data.raw["inserter"]["burner-inserter"].surface_conditions = ten_pressure_condition
data.raw["car"]["car"].surface_conditions = one_gravity_condition
data.raw["car"]["tank"].surface_conditions = one_gravity_condition
data.raw["spider-vehicle"]["spidertron"].surface_conditions = one_gravity_condition
data.raw["legacy-curved-rail"]["legacy-curved-rail"].surface_conditions = one_gravity_condition
data.raw["legacy-straight-rail"]["legacy-straight-rail"].surface_conditions = one_gravity_condition
data.raw["locomotive"]["locomotive"].surface_conditions = one_gravity_condition
data.raw["cargo-wagon"]["cargo-wagon"].surface_conditions = one_gravity_condition
data.raw["fluid-wagon"]["fluid-wagon"].surface_conditions = one_gravity_condition
data.raw["artillery-wagon"]["artillery-wagon"].surface_conditions = one_gravity_condition
data.raw["train-stop"]["train-stop"].surface_conditions = one_gravity_condition
data.raw["rail-signal"]["rail-signal"].surface_conditions = one_gravity_condition
data.raw["rail-chain-signal"]["rail-chain-signal"].surface_conditions = one_gravity_condition
data.raw["curved-rail-b"]["curved-rail-b"].surface_conditions = one_gravity_condition
data.raw["curved-rail-a"]["curved-rail-a"].surface_conditions = one_gravity_condition
data.raw["half-diagonal-rail"]["half-diagonal-rail"].surface_conditions = one_gravity_condition
data.raw["straight-rail"]["straight-rail"].surface_conditions = one_gravity_condition

data.raw["rail-ramp"]["rail-ramp"].surface_conditions = one_gravity_condition
data.raw["elevated-straight-rail"]["elevated-straight-rail"].surface_conditions = one_gravity_condition
data.raw["elevated-half-diagonal-rail"]["elevated-half-diagonal-rail"].surface_conditions = one_gravity_condition
data.raw["elevated-curved-rail-a"]["elevated-curved-rail-a"].surface_conditions = one_gravity_condition
data.raw["elevated-curved-rail-b"]["elevated-curved-rail-b"].surface_conditions = one_gravity_condition
data.raw["rail-support"]["rail-support"].surface_conditions = one_gravity_condition

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
  connection.connection_category = {"default", "fusion-plasma"}
end

data.raw.recipe["transport-belt"].category = "pressing"
data.raw.recipe["underground-belt"].category = "pressing"
data.raw.recipe["splitter"].category = "pressing"
data.raw.recipe["fast-transport-belt"].category = "pressing"
data.raw.recipe["fast-underground-belt"].category = "pressing"
data.raw.recipe["fast-splitter"].category = "pressing"
data.raw.recipe["express-transport-belt"].category = "crafting-with-fluid-or-metallurgy"
data.raw.recipe["express-underground-belt"].category = "crafting-with-fluid-or-metallurgy"
data.raw.recipe["express-splitter"].category = "crafting-with-fluid-or-metallurgy"

data.raw.recipe["beacon"].category = "electronics"
data.raw.recipe["solar-panel"].category = "electronics"

data.raw.recipe["speed-module"].category = "electronics"
data.raw.recipe["speed-module-2"].category = "electronics"
data.raw.recipe["speed-module-3"].category = "electronics"
table.insert(data.raw.recipe["speed-module-3"].ingredients, {type = "item", name = "tungsten-carbide", amount = 1})

data.raw.recipe["productivity-module"].category = "electronics"
data.raw.recipe["productivity-module-2"].category = "electronics"
data.raw.recipe["productivity-module-3"].category = "electronics"
table.insert(data.raw.recipe["productivity-module-3"].ingredients, {type = "item", name = "biter-egg", amount = 1})

data.raw.recipe["efficiency-module"].category = "electronics"
data.raw.recipe["efficiency-module-2"].category = "electronics"
data.raw.recipe["efficiency-module-3"].category = "electronics"
table.insert(data.raw.recipe["efficiency-module-3"].ingredients, {type = "item", name = "spoilage", amount = 5})

data.raw.recipe["sulfuric-acid"].category = "chemistry-or-cryogenics"

data.raw.recipe["heavy-oil-cracking"].category = "organic-or-chemistry"
data.raw.recipe["light-oil-cracking"].category = "organic-or-chemistry"
data.raw.recipe["rocket-fuel"].category = "organic-or-assembling"

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

data.raw.recipe.sulfur.category = "chemistry-or-cryogenics"
data.raw.recipe.sulfur.auto_recycle = false

data.raw.recipe["accumulator"].category = "electronics"
data.raw.recipe["discharge-defense-equipment"].category = "electronics"
data.raw.recipe["electronic-circuit"].category = "electronics"
data.raw.recipe["small-electric-pole"].category = "electronics"
data.raw.recipe["big-electric-pole"].category = "electronics"
data.raw.recipe["medium-electric-pole"].category = "electronics"
data.raw.recipe["copper-cable"].category = "electronics"
data.raw.recipe["advanced-circuit"].category = "electronics"
data.raw.recipe["processing-unit"].category = "electronics-with-fluid"
data.raw.recipe.substation.category = "electronics"
data.raw.recipe["plastic-bar"].category = "chemistry-or-cryogenics"
data.raw.recipe.explosives.category = "chemistry-or-cryogenics"
data.raw.recipe.battery.category = "chemistry-or-cryogenics"

data.raw.recipe.landfill.auto_recycle = false

data.raw.recipe["copper-plate"].auto_recycle = false

data.raw.recipe["iron-plate"].auto_recycle = false

data.raw.recipe["uranium-processing"].auto_recycle = false

data.raw.recipe["kovarex-enrichment-process"].auto_recycle = false

data.raw.recipe["nuclear-fuel-reprocessing"].auto_recycle = false

data.raw.recipe["uranium-fuel-cell"].auto_recycle = false

data.raw.recipe["plastic-bar"].auto_recycle = false

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

data.raw.technology["atomic-bomb"].prerequisites = {
  "military-4",
  "kovarex-enrichment-process",
  "rocketry"
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

table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "water-mud")
table.insert(data.raw.item.landfill.place_as_tile.tile_condition, "water-shallow")
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

data.raw.tool["space-science-pack"].stack_size = 200

data.raw.capsule["raw-fish"].spoil_ticks = 453000
data.raw.capsule["raw-fish"].spoil_result = "spoilage"

--quality stuff

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

data.raw.recipe["quality-module"].category = "electronics"
data.raw.recipe["quality-module-2"].category = "electronics"
data.raw.recipe["quality-module-3"].category = "electronics"

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
  entity = "fulgoran-ruin-vault"
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

data.raw["dont-build-entity-achievement"]["logistic-network-embargo"].research_with = {"metallurgic-science-pack", "electromagnetic-science-pack", "agricultural-science-pack"}

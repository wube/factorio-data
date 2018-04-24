data:extend(
{
  {
    type = "item",
    name = "iron-chest",
    icon = "__base__/graphics/icons/iron-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-b[iron-chest]",
    place_result = "iron-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-c[steel-chest]",
    place_result = "steel-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "a[transport-belt]-b[fast-transport-belt]",
    place_result = "fast-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "a[transport-belt]-c[express-transport-belt]",
    place_result = "express-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "long-handed-inserter",
    icon = "__base__/graphics/icons/long-handed-inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "inserter",
    order = "c[long-handed-inserter]",
    place_result = "long-handed-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-inserter",
    icon = "__base__/graphics/icons/fast-inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "inserter",
    order = "d[fast-inserter]",
    place_result = "fast-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "filter-inserter",
    icon = "__base__/graphics/icons/filter-inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "inserter",
    order = "e[filter-inserter]",
    place_result = "filter-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "stack-inserter",
    icon = "__base__/graphics/icons/stack-inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "inserter",
    order = "f[stack-inserter]",
    place_result = "stack-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "stack-filter-inserter",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "inserter",
    order = "g[stack-filter-inserter]",
    place_result = "stack-filter-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-2",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "b[assembling-machine-2]",
    place_result = "assembling-machine-2",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "c[assembling-machine-3]",
    place_result = "assembling-machine-3",
    stack_size = 50
  },
  {
    type = "item",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "d[solar-panel]-a[solar-panel]",
    place_result = "solar-panel",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "locomotive",
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-f[diesel-locomotive]",
    place_result = "locomotive",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-g[cargo-wagon]",
    place_result = "cargo-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-h[fluid-wagon]",
    place_result = "fluid-wagon",
    stack_size = 5
  },
  {
    type = "rail-planner",
    name = "rail",
    icon = "__base__/graphics/icons/rail.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-a[rail]",
    place_result = "straight-rail",
    stack_size = 100,
    straight_rail = "straight-rail",
    curved_rail = "curved-rail"
  },
  {
    type = "item",
    name = "player-port",
    icon = "__base__/graphics/icons/player-port.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "defensive-structure",
    order = "z[not-used]",
    place_result = "player-port",
    stack_size = 50
  },
  {
    type = "item",
    name = "gate",
    icon = "__base__/graphics/icons/gate.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[wall]-b[gate]",
    place_result = "gate",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "car",
    icon = "__base__/graphics/icons/car.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "b[personal-transport]-a[car]",
    place_result = "car",
    stack_size = 1
  },
  {
    type = "item-with-entity-data",
    name = "tank",
    icon = "__base__/graphics/icons/tank.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "b[personal-transport]-b[tank]",
    place_result = "tank",
    stack_size = 1
  },
  {
    type = "tool",
    name = "science-pack-1",
    icon = "__base__/graphics/icons/science-pack-1.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "a[science-pack-1]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = "tool",
    name = "science-pack-2",
    icon = "__base__/graphics/icons/science-pack-2.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "b[science-pack-2]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = "tool",
    name = "science-pack-3",
    icon = "__base__/graphics/icons/science-pack-3.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "c[science-pack-3]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = "tool",
    name = "military-science-pack",
    icon = "__base__/graphics/icons/military-science-pack.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "d[military-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = "tool",
    name = "production-science-pack",
    icon = "__base__/graphics/icons/production-science-pack.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "e[production-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = "tool",
    name = "high-tech-science-pack",
    icon = "__base__/graphics/icons/high-tech-science-pack.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "f[high-tech-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = "tool",
    name = "space-science-pack",
    icon = "__base__/graphics/icons/space-science-pack.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "g[space-science-pack]",
    stack_size = 2000,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = "item",
    name = "lab",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "g[lab]",
    place_result = "lab",
    stack_size = 10
  },
  {
    type = "item",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-c[train-stop]",
    place_result = "train-stop",
    stack_size = 10
  },
  {
    type = "item",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-d[rail-signal]",
    place_result = "rail-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-e[rail-signal-chain]",
    place_result = "rail-chain-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "steel-plate",
    icon = "__base__/graphics/icons/steel-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "d[steel-plate]",
    stack_size = 100
  },
  {
    type = "item",
    name = "underground-belt",
    icon = "__base__/graphics/icons/underground-belt.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "b[underground-belt]-a[underground-belt]",
    place_result = "underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-underground-belt",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "b[underground-belt]-b[fast-underground-belt]",
    place_result = "fast-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-underground-belt",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "b[underground-belt]-c[express-underground-belt]",
    place_result = "express-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "splitter",
    icon = "__base__/graphics/icons/splitter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "c[splitter]-a[splitter]",
    place_result = "splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "c[splitter]-b[fast-splitter]",
    place_result = "fast-splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "belt",
    order = "c[splitter]-c[express-splitter]",
    place_result = "express-splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "belt",
    order = "d[loader]-a[basic-loader]",
    place_result = "loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-loader",
    icon = "__base__/graphics/icons/fast-loader.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "belt",
    order = "d[loader]-b[fast-loader]",
    place_result = "fast-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-loader",
    icon = "__base__/graphics/icons/express-loader.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "belt",
    order = "d[loader]-c[express-loader]",
    place_result = "express-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "advanced-circuit",
    icon = "__base__/graphics/icons/advanced-circuit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "f[advanced-circuit]",
    stack_size = 200
  },
  {
    type = "item",
    name = "processing-unit",
    icon = "__base__/graphics/icons/processing-unit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "g[processing-unit]",
    stack_size = 100
  },
  {
    type = "item",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "a[robot]-a[logistic-robot]",
    place_result = "logistic-robot",
    stack_size = 50
  },
  {
    type = "item",
    name = "construction-robot",
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "logistic-network",
    order = "a[robot]-b[construction-robot]",
    place_result = "construction-robot",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-passive-provider",
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-passive-provider]",
    place_result = "logistic-chest-passive-provider",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-active-provider",
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-active-provider]",
    place_result = "logistic-chest-active-provider",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-storage",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-storage]",
    place_result = "logistic-chest-storage",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-requester",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-requester]",
    place_result = "logistic-chest-requester",
    stack_size = 50
  },
  {
    type = "item",
    name = "rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "e[rocket-silo]",
    place_result = "rocket-silo",
    stack_size = 1
  },
  {
    type = "item",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "c[signal]-a[roboport]",
    place_result = "roboport",
    stack_size = 5
  },
  {
    type = "item",
    name = "coin",
    icon = "__base__/graphics/icons/coin.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "science-pack",
    order = "y",
    stack_size = 100000
  },
  {
    type = "item",
    name = "big-electric-pole",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-c[big-electric-pole]",
    place_result = "big-electric-pole",
    stack_size = 50
  },
  {
    type = "item",
    name = "medium-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-b[medium-electric-pole]",
    place_result = "medium-electric-pole",
    stack_size = 50
  },
  {
    type = "item",
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[substation]",
    place_result = "substation",
    stack_size = 50
  },
  {
    type = "item",
    name = "accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "e[accumulator]-a[accumulator]",
    place_result = "accumulator",
    stack_size = 50
  },
  {
    type = "item",
    name = "steel-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    flags = {"goes-to-quickbar"},
    subgroup = "smelting-machine",
    order = "b[steel-furnace]",
    place_result = "steel-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"goes-to-quickbar"},
    subgroup = "smelting-machine",
    order = "c[electric-furnace]",
    place_result = "electric-furnace",
    stack_size = 50
  },
  {
    type = "item",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "module",
    order = "a[beacon]",
    place_result = "beacon",
    stack_size = 10
  },
  {
    type = "item",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "b[fluid]-a[storage-tank]",
    place_result = "storage-tank",
    stack_size = 50
  },
  {
    type = "item",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-c[pump]",
    place_result = "pump",
    stack_size = 50
  },
  {
    type = "blueprint",
    name = "blueprint",
    icon = "__base__/graphics/icons/blueprint.png",
    flags = {"goes-to-quickbar"},
    subgroup = "tool",
    order = "c[automated-construction]-a[blueprint]",
    stack_size = 1,
    stackable = false,
    draw_label_for_cursor_render = true,
    item_to_clear = "electronic-circuit",
    selection_color = { r = 0, g = 1, b = 0 },
    alt_selection_color = { r = 0, g = 1, b = 0 },
    selection_mode = {"blueprint"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy"
  },
  {
    type = "deconstruction-item",
    name = "deconstruction-planner",
    icon = "__base__/graphics/icons/deconstruction-planner.png",
    flags = {"goes-to-quickbar"},
    subgroup = "tool",
    order = "c[automated-construction]-b[deconstruction-planner]",
    stack_size = 1,
    entity_filter_count = 30,
    tile_filter_count = 30,
    selection_color = { r = 1, g = 0, b = 0 },
    alt_selection_color = { r = 0, g = 0, b = 1 },
    selection_mode = {"deconstruct"},
    alt_selection_mode = {"cancel-deconstruct"},
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed"
  },
  {
    type = "blueprint-book",
    name = "blueprint-book",
    icon = "__base__/graphics/icons/blueprint-book.png",
    flags = {"goes-to-quickbar"},
    subgroup = "tool",
    order = "c[automated-construction]-c[blueprint-book]",
    stack_size = 1,
    inventory_size = 1000
  },
  {
    type = "item",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "b[fluids]-b[pumpjack]",
    place_result = "pumpjack",
    stack_size = 20
  },
  {
    type = "item",
    name = "oil-refinery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "d[refinery]",
    place_result = "oil-refinery",
    stack_size = 10
  },
  {
    type = "item",
    name = "chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "e[chemical-plant]",
    place_result = "chemical-plant",
    stack_size = 10
  },
  {
    type = "item",
    name = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f[sulfur]",
    stack_size = 50
  },
  {
    type = "item",
    name = "empty-barrel",
    icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "d[empty-barrel]",
    stack_size = 10
  },
  {
    type = "item",
    name = "solid-fuel",
    icon = "__base__/graphics/icons/solid-fuel.png",
    flags = {"goes-to-main-inventory"},
    fuel_category = "chemical",
    fuel_value = "25MJ",
    fuel_acceleration_multiplier = 1.2,
    fuel_top_speed_multiplier = 1.05,
    subgroup = "raw-material",
    order = "c[solid-fuel]",
    stack_size = 50
  },
  {
    type = "item",
    name = "plastic-bar",
    icon = "__base__/graphics/icons/plastic-bar.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "g[plastic-bar]",
    stack_size = 100
  },
  {
    type = "item",
    name = "engine-unit",
    icon = "__base__/graphics/icons/engine-unit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "h[engine-unit]",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-engine-unit",
    icon = "__base__/graphics/icons/electric-engine-unit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "i[electric-engine-unit]",
    stack_size = 50
  },
  {
    type = "item",
    name = "explosives",
    icon = "__base__/graphics/icons/explosives.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "j[explosives]",
    stack_size = 50
  },
  {
    type = "item",
    name = "battery",
    icon = "__base__/graphics/icons/battery.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "j[battery]",
    stack_size = 200
  },
  {
    type = "item",
    name = "flying-robot-frame",
    icon = "__base__/graphics/icons/flying-robot-frame.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "l[flying-robot-frame]",
    stack_size = 50
  },
  {
    type = "item",
    name = "arithmetic-combinator",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    flags = { "goes-to-quickbar" },
    subgroup = "circuit-network",
    place_result="arithmetic-combinator",
    order = "c[combinators]-a[arithmetic-combinator]",
    stack_size= 50,
  },
  {
    type = "item",
    name = "decider-combinator",
    icon = "__base__/graphics/icons/decider-combinator.png",
    flags = { "goes-to-quickbar" },
    subgroup = "circuit-network",
    place_result="decider-combinator",
    order = "c[combinators]-b[decider-combinator]",
    stack_size= 50,
  },
  {
    type = "item",
    name = "constant-combinator",
    icon = "__base__/graphics/icons/constant-combinator.png",
    flags = { "goes-to-quickbar" },
    subgroup = "circuit-network",
    place_result="constant-combinator",
    order = "c[combinators]-c[constant-combinator]",
    stack_size= 50,
  },
  {
    type = "item",
    name = "power-switch",
    icon = "__base__/graphics/icons/power-switch.png",
    flags = { "goes-to-quickbar" },
    subgroup = "circuit-network",
    place_result="power-switch",
    order = "d[other]-a[power-switch]",
    stack_size= 50,
  },
  {
    type = "item",
    name = "programmable-speaker",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    flags = {"goes-to-quickbar"},
    subgroup = "circuit-network",
    order = "d[other]-b[programmable-speaker]",
    place_result = "programmable-speaker",
    stack_size = 50
  },
  {
    type = "item",
    name = "low-density-structure",
    icon = "__base__/graphics/icons/rocket-structure.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "m[rocket-structure]",
    stack_size = 10
  },
  {
    type = "item",
    name = "rocket-fuel",
    icon = "__base__/graphics/icons/rocket-fuel.png",
    flags = {"goes-to-main-inventory"},
    fuel_category = "chemical",
    fuel_value = "225MJ",
    fuel_acceleration_multiplier = 1.8,
    fuel_top_speed_multiplier = 1.15,
    subgroup = "intermediate-product",
    order = "n[rocket-fuel]",
    stack_size = 10
  },
  {
    type = "item",
    name = "rocket-control-unit",
    icon = "__base__/graphics/icons/rocket-control-unit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "o[rocket-control-unit]",
    stack_size = 10
  },
  {
    type = "item",
    name = "rocket-part",
    icon = "__base__/graphics/icons/rocket-part.png",
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "intermediate-product",
    order = "p[rocket-part]",
    stack_size = 5
  },
  {
    type = "item",
    name = "satellite",
    icon = "__base__/graphics/icons/satellite.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "q[satellite]",
    stack_size = 1
  },
  {
    type = "item",
    name = "concrete",
    icon = "__base__/graphics/icons/concrete.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "terrain",
    order = "b[concrete]-a[plain]",
    stack_size = 100,
    place_as_tile =
    {
      result = "concrete",
      condition_size = 4,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "hazard-concrete",
    icon = "__base__/graphics/icons/hazard-concrete.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "terrain",
    order = "b[concrete]-b[hazard]",
    stack_size = 100,
    place_as_tile =
    {
      result = "hazard-concrete-left",
      condition_size = 4,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "landfill",
    icon = "__base__/graphics/icons/landfill.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "terrain",
    order = "c[landfill]-a[dirt]",
    stack_size = 100,
    place_as_tile =
    {
      result = "grass",
      condition_size = 1,
      condition = { "ground-tile" }
    }
  },
  {
    -- This allows loading the selection-tool type item when mods are removed
    type = "selection-tool",
    name = "dummy-selection-tool",
    localised_name = {"item-name.blueprint"},
    icon = "__base__/graphics/icons/blueprint.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "tool",
    order = "c[automated-construction]-a[blueprint]",
    stack_size = 1,
    stackable = false,
    selection_color = { r = 0, g = 1, b = 0 },
    alt_selection_color = { r = 0, g = 1, b = 0 },
    selection_mode = {"blueprint"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy"
  },
  {
    type = "item",
    name = "electric-energy-interface",
    icons = { {icon = "__base__/graphics/icons/accumulator.png", tint = {r=1, g=0.8, b=1, a=1}} },
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "energy",
    order = "e[electric-energy-interface]-b[electric-energy-interface]",
    place_result = "electric-energy-interface",
    stack_size = 50
  },
  {
    type = "item",
    name = "uranium-ore",
    icon = "__base__/graphics/icons/uranium-ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "g[uranium-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "nuclear-reactor",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "f[nuclear-energy]-a[reactor]",
    place_result = "nuclear-reactor",
    stack_size = 50
  },
  {
    type = "item",
    name = "uranium-235",
    icon = "__base__/graphics/icons/uranium-235.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "r[uranium-235]",
    stack_size = 100
  },
  {
    type = "item",
    name = "uranium-238",
    icon = "__base__/graphics/icons/uranium-238.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "r[uranium-238]",
    stack_size = 100
  },
  {
    type = "item",
    name = "centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "g[centrifuge]",
    place_result = "centrifuge",
    stack_size = 50
  },
  {
    type = "item",
    name = "uranium-fuel-cell",
    icon = "__base__/graphics/icons/uranium-fuel-cell.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-a[uranium-fuel-cell]",
    fuel_category = "nuclear",
    burnt_result = "used-up-uranium-fuel-cell",
    fuel_value = "8GJ",
    stack_size = 50
  },
  {
    type = "item",
    name = "used-up-uranium-fuel-cell",
    icon = "__base__/graphics/icons/used-up-uranium-fuel-cell.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "r[used-up-uranium-fuel-cell]",
    stack_size = 50
  },
  {
    type = "item",
    name = "heat-exchanger",
    icon = "__base__/graphics/icons/heat-boiler.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "f[nuclear-energy]-b[heat-exchanger]",
    place_result = "heat-exchanger",
    stack_size = 50
  },
  {
    type = "item",
    name = "steam-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-c[steam-turbine]",
    place_result = "steam-turbine",
    stack_size = 10
  },
  {
    type = "item",
    name = "heat-pipe",
    icon = "__base__/graphics/icons/heat-pipe.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "f[nuclear-energy]-c[heat-pipe]",
    place_result = "heat-pipe",
    stack_size = 50
  },
  {
    type = "item",
    name = "simple-entity-with-force",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "other",
    order = "s[simple-entity-with-force]-f[simple-entity-with-force]",
    place_result = "simple-entity-with-force",
    stack_size = 50
  },
  {
    type = "item",
    name = "simple-entity-with-owner",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "other",
    order = "s[simple-entity-with-owner]-o[simple-entity-with-owner]",
    place_result = "simple-entity-with-owner",
    stack_size = 50
  },
  {
    type = "item-with-tags",
    name = "item-with-tags",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "other",
    order = "s[item-with-tags]-o[item-with-tags]",
    stack_size = 1
  },
  {
    type = "item-with-label",
    name = "item-with-label",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "other",
    order = "s[item-with-label]-o[item-with-label]",
    stack_size = 1
  },
  {
    type = "item-with-inventory",
    name = "item-with-inventory",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "other",
    order = "s[item-with-inventory]-o[item-with-inventory]",
    stack_size = 1,
    inventory_size = 1
  },
}
)

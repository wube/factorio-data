data:extend(
{
  {
    type = "item",
    name = "steel-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 32,
    subgroup = "storage",
    order = "a[items]-c[steel-chest]",
    place_result = "steel-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-transport-belt",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    icon_size = 32,
    subgroup = "belt",
    order = "a[transport-belt]-b[fast-transport-belt]",
    place_result = "fast-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "express-transport-belt",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    icon_size = 32,
    subgroup = "belt",
    order = "a[transport-belt]-c[express-transport-belt]",
    place_result = "express-transport-belt",
    stack_size = 100
  },
  {
    type = "item",
    name = "filter-inserter",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "e[filter-inserter]",
    place_result = "filter-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "stack-inserter",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "f[stack-inserter]",
    place_result = "stack-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "stack-filter-inserter",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 32,
    subgroup = "inserter",
    order = "g[stack-filter-inserter]",
    place_result = "stack-filter-inserter",
    stack_size = 50
  },
  {
    type = "item",
    name = "assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "c[assembling-machine-3]",
    place_result = "assembling-machine-3",
    stack_size = 50
  },
  {
    type = "item",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    icon_size = 32,
    subgroup = "energy",
    order = "d[solar-panel]-a[solar-panel]",
    place_result = "solar-panel",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "locomotive",
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-f[diesel-locomotive]",
    place_result = "locomotive",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "cargo-wagon",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-g[cargo-wagon]",
    place_result = "cargo-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "fluid-wagon",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-h[fluid-wagon]",
    place_result = "fluid-wagon",
    stack_size = 5
  },
  {
    type = "item-with-entity-data",
    name = "artillery-wagon",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-i[artillery-wagon]",
    place_result = "artillery-wagon",
    stack_size = 5
  },
  {
    type = "rail-planner",
    name = "rail",
    icon = "__base__/graphics/icons/rail.png",
    icon_size = 32,
    localised_name = {"item-name.rail"},
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
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "defensive-structure",
    order = "z[not-used]",
    place_result = "player-port",
    stack_size = 50
  },
  {
    type = "item-with-entity-data",
    name = "tank",
    icon = "__base__/graphics/icons/tank.png",
    icon_size = 32,
    subgroup = "transport",
    order = "b[personal-transport]-b[tank]",
    place_result = "tank",
    stack_size = 1
  },
  {
    type = "tool",
    name = "chemical-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/chemical-science-pack.png",
    icon_size = 32,
    subgroup = "science-pack",
    order = "d[chemical-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "military-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/military-science-pack.png",
    icon_size = 32,
    subgroup = "science-pack",
    order = "c[military-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "production-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/production-science-pack.png",
    icon_size = 32,
    subgroup = "science-pack",
    order = "e[production-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "utility-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__base__/graphics/icons/utility-science-pack.png",
    icon_size = 32,
    subgroup = "science-pack",
    order = "f[utility-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "space-science-pack",
    icon = "__base__/graphics/icons/space-science-pack.png",
    icon_size = 32,
    subgroup = "science-pack",
    order = "g[space-science-pack]",
    stack_size = 2000,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "item",
    name = "train-stop",
    icon = "__base__/graphics/icons/train-stop.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-c[train-stop]",
    place_result = "train-stop",
    stack_size = 10
  },
  {
    type = "item",
    name = "rail-signal",
    icon = "__base__/graphics/icons/rail-signal.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-d[rail-signal]",
    place_result = "rail-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "rail-chain-signal",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-e[rail-signal-chain]",
    place_result = "rail-chain-signal",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-underground-belt",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    icon_size = 32,
    subgroup = "belt",
    order = "b[underground-belt]-b[fast-underground-belt]",
    place_result = "fast-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-underground-belt",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    icon_size = 32,
    subgroup = "belt",
    order = "b[underground-belt]-c[express-underground-belt]",
    place_result = "express-underground-belt",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-splitter",
    icon = "__base__/graphics/icons/fast-splitter.png",
    icon_size = 32,
    subgroup = "belt",
    order = "c[splitter]-b[fast-splitter]",
    place_result = "fast-splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-splitter",
    icon = "__base__/graphics/icons/express-splitter.png",
    icon_size = 32,
    subgroup = "belt",
    order = "c[splitter]-c[express-splitter]",
    place_result = "express-splitter",
    stack_size = 50
  },
  {
    type = "item",
    name = "loader",
    icon = "__base__/graphics/icons/loader.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "belt",
    order = "d[loader]-a[basic-loader]",
    place_result = "loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "fast-loader",
    icon = "__base__/graphics/icons/fast-loader.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "belt",
    order = "d[loader]-b[fast-loader]",
    place_result = "fast-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "express-loader",
    icon = "__base__/graphics/icons/express-loader.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "belt",
    order = "d[loader]-c[express-loader]",
    place_result = "express-loader",
    stack_size = 50
  },
  {
    type = "item",
    name = "advanced-circuit",
    icon = "__base__/graphics/icons/advanced-circuit.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "f[advanced-circuit]",
    stack_size = 200
  },
  {
    type = "item",
    name = "processing-unit",
    icon = "__base__/graphics/icons/processing-unit.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "g[processing-unit]",
    stack_size = 100
  },
  {
    type = "item",
    name = "logistic-robot",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "a[robot]-a[logistic-robot]",
    place_result = "logistic-robot",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-passive-provider",
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-passive-provider]",
    place_result = "logistic-chest-passive-provider",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-active-provider",
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-active-provider]",
    place_result = "logistic-chest-active-provider",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-storage",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "b[storage]-c[logistic-chest-storage]",
    place_result = "logistic-chest-storage",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-buffer",
    icon = "__base__/graphics/icons/logistic-chest-buffer.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "b[storage]-d[logistic-chest-buffer]",
    place_result = "logistic-chest-buffer",
    stack_size = 50
  },
  {
    type = "item",
    name = "logistic-chest-requester",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "b[storage]-e[logistic-chest-requester]",
    place_result = "logistic-chest-requester",
    stack_size = 50
  },
  {
    type = "item",
    name = "rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 32,
    subgroup = "defensive-structure",
    order = "e[rocket-silo]",
    place_result = "rocket-silo",
    stack_size = 1
  },
  {
    type = "item",
    name = "roboport",
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 32,
    subgroup = "logistic-network",
    order = "c[signal]-a[roboport]",
    place_result = "roboport",
    stack_size = 10
  },
  {
    type = "item",
    name = "coin",
    icon = "__base__/graphics/icons/coin.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "science-pack",
    order = "y",
    stack_size = 100000
  },
  {
    type = "item",
    name = "substation",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[substation]",
    place_result = "substation",
    stack_size = 50
  },
  {
    type = "item",
    name = "accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    icon_size = 32,
    subgroup = "energy",
    order = "e[accumulator]-a[accumulator]",
    place_result = "accumulator",
    stack_size = 50
  },
  {
    type = "item",
    name = "beacon",
    icon = "__base__/graphics/icons/beacon.png",
    icon_size = 32,
    subgroup = "module",
    order = "a[beacon]",
    place_result = "beacon",
    stack_size = 10
  },
  {
    type = "item",
    name = "storage-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 32,
    subgroup = "storage",
    order = "b[fluid]-a[storage-tank]",
    place_result = "storage-tank",
    stack_size = 50
  },
  {
    type = "item",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    icon_size = 32,
    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-c[pump]",
    place_result = "pump",
    stack_size = 50
  },
  {
    type = "upgrade-item",
    name = "upgrade-planner",
    icon = "__base__/graphics/icons/upgrade-planner.png",
    icon_size = 32,
    subgroup = "tool",
    order = "c[automated-construction]-c[upgrade-planner]",
    stack_size = 1,
    mapper_count = 24,
    selection_color = {1, 0, 0},
    alt_selection_color = {0, 0, 1},
    selection_mode = {"upgrade"},
    alt_selection_mode = {"cancel-upgrade"},
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed"
  },
  {
    type = "deconstruction-item",
    name = "deconstruction-planner",
    icon = "__base__/graphics/icons/deconstruction-planner.png",
    icon_size = 32,
    subgroup = "tool",
    order = "c[automated-construction]-b[deconstruction-planner]",
    stack_size = 1,
    entity_filter_count = 30,
    tile_filter_count = 30,
    selection_color = {1, 0, 0},
    alt_selection_color = {0, 0, 1},
    selection_mode = {"deconstruct"},
    alt_selection_mode = {"cancel-deconstruct"},
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed",
    --mouse_cursor = "system-crosshair"
  },
  {
    type = "blueprint-book",
    name = "blueprint-book",
    icon = "__base__/graphics/icons/blueprint-book.png",
    icon_size = 32,
    subgroup = "tool",
    order = "c[automated-construction]-d[blueprint-book]",
    stack_size = 1,
    inventory_size = 1000
  },
  {
    type = "item",
    name = "pumpjack",
    icon = "__base__/graphics/icons/pumpjack.png",
    icon_size = 32,
    subgroup = "extraction-machine",
    order = "b[fluids]-b[pumpjack]",
    place_result = "pumpjack",
    stack_size = 20
  },
  {
    type = "item",
    name = "oil-refinery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "d[refinery]",
    place_result = "oil-refinery",
    stack_size = 10
  },
  {
    type = "item",
    name = "chemical-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "e[chemical-plant]",
    place_result = "chemical-plant",
    stack_size = 10
  },
  {
    type = "item",
    name = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "g[sulfur]",
    stack_size = 50
  },
  {
    type = "item",
    name = "empty-barrel",
    icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "d[empty-barrel]",
    stack_size = 10
  },
  {
    type = "item",
    name = "plastic-bar",
    icon = "__base__/graphics/icons/plastic-bar.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "f[plastic-bar]",
    stack_size = 100
  },
  {
    type = "item",
    name = "electric-engine-unit",
    icon = "__base__/graphics/icons/electric-engine-unit.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "i[electric-engine-unit]",
    stack_size = 50
  },
  {
    type = "item",
    name = "explosives",
    icon = "__base__/graphics/icons/explosives.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "j[explosives]",
    stack_size = 50
  },
  {
    type = "item",
    name = "battery",
    icon = "__base__/graphics/icons/battery.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "h[battery]",
    stack_size = 200
  },
  {
    type = "item",
    name = "flying-robot-frame",
    icon = "__base__/graphics/icons/flying-robot-frame.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "l[flying-robot-frame]",
    stack_size = 50
  },
  {
    type = "item",
    name = "arithmetic-combinator",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    icon_size = 32,
    subgroup = "circuit-network",
    place_result="arithmetic-combinator",
    order = "c[combinators]-a[arithmetic-combinator]",
    stack_size= 50
  },
  {
    type = "item",
    name = "decider-combinator",
    icon = "__base__/graphics/icons/decider-combinator.png",
    icon_size = 32,
    subgroup = "circuit-network",
    place_result="decider-combinator",
    order = "c[combinators]-b[decider-combinator]",
    stack_size= 50
  },
  {
    type = "item",
    name = "constant-combinator",
    icon = "__base__/graphics/icons/constant-combinator.png",
    icon_size = 32,
    subgroup = "circuit-network",
    place_result="constant-combinator",
    order = "c[combinators]-c[constant-combinator]",
    stack_size= 50
  },
  {
    type = "item",
    name = "power-switch",
    icon = "__base__/graphics/icons/power-switch.png",
    icon_size = 32,
    subgroup = "circuit-network",
    place_result="power-switch",
    order = "d[other]-a[power-switch]",
    stack_size= 50
  },
  {
    type = "item",
    name = "programmable-speaker",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    icon_size = 32,
    subgroup = "circuit-network",
    order = "d[other]-b[programmable-speaker]",
    place_result = "programmable-speaker",
    stack_size = 50
  },
  {
    type = "item",
    name = "low-density-structure",
    icon = "__base__/graphics/icons/rocket-structure.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "o[rocket-structure]",
    stack_size = 10
  },
  {
    type = "item",
    name = "nuclear-fuel",
    icon = "__base__/graphics/icons/nuclear-fuel.png",
    icon_size = 32,
    fuel_category = "chemical",
    fuel_value = "1.21GJ",
    fuel_acceleration_multiplier = 2.5,
    fuel_top_speed_multiplier = 1.15,
    -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
    subgroup = "intermediate-product",
    order = "q[uranium-rocket-fuel]",
    stack_size = 1
  },
  {
    type = "item",
    name = "rocket-control-unit",
    icon = "__base__/graphics/icons/rocket-control-unit.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "n[rocket-control-unit]",
    stack_size = 10
  },
  {
    type = "item",
    name = "rocket-part",
    icon = "__base__/graphics/icons/rocket-part.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "intermediate-product",
    order = "q[rocket-part]",
    stack_size = 5
  },
  {
    type = "item",
    name = "satellite",
    icon = "__base__/graphics/icons/satellite.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "m[satellite]",
    stack_size = 1,
    rocket_launch_product = {"space-science-pack", 1000}
  },
  {
    type = "item",
    name = "concrete",
    icon = "__base__/graphics/icons/concrete.png",
    icon_size = 32,
    subgroup = "terrain",
    order = "b[concrete]-a[plain]",
    stack_size = 100,
    place_as_tile =
    {
      result = "concrete",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "refined-concrete",
    icon = "__base__/graphics/icons/refined-concrete.png",
    icon_size = 32,
    subgroup = "terrain",
    order = "b[concrete]-c[refined]",
    stack_size = 100,
    place_as_tile =
    {
      result = "refined-concrete",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "hazard-concrete",
    icon = "__base__/graphics/icons/hazard-concrete.png",
    icon_size = 32,
    subgroup = "terrain",
    order = "b[concrete]-b[hazard]",
    stack_size = 100,
    place_as_tile =
    {
      result = "hazard-concrete-left",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "refined-hazard-concrete",
    icon = "__base__/graphics/icons/refined-hazard-concrete.png",
    icon_size = 32,
    subgroup = "terrain",
    order = "b[concrete]-d[refined-hazard]",
    stack_size = 100,
    place_as_tile =
    {
      result = "refined-hazard-concrete-left",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "landfill",
    icon = "__base__/graphics/icons/landfill.png",
    icon_size = 32,
    subgroup = "terrain",
    order = "c[landfill]-a[dirt]",
    stack_size = 100,
    place_as_tile =
    {
      result = "landfill",
      condition_size = 1,
      condition = { "ground-tile" }
    }
  },
  {
    -- This allows loading the selection-tool type item when mods are removed
    type = "selection-tool",
    name = "selection-tool",
    icon = "__base__/graphics/icons/blueprint.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "c[automated-construction]-a[blueprint]",
    stack_size = 1,
    stackable = false,
    selection_color = { r = 0, g = 1, b = 0 },
    alt_selection_color = { r = 0, g = 1, b = 0 },
    selection_mode = {"blueprint"},
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    --entity_filters = {"stone-furnace", "steel-furnace"},
    --entity_type_filters = {"furnace", "assembling-machine"},
    --tile_filters = {"concrete", "stone-path"},
    --entity_filter_mode = "whitelist",
    --tile_filter_mode = "whitelist",
    --alt_entity_filters = {"stone-furnace", "steel-furnace"},
    --alt_entity_type_filters = {"furnace", "assembling-machine"},
    --alt_tile_filters = {"concrete", "stone-path"},
    --alt_entity_filter_mode = "whitelist",
    --alt_tile_filter_mode = "whitelist",
    show_in_library = false
  },
  {
    type = "item",
    name = "electric-energy-interface",
    icons = { {icon = "__base__/graphics/icons/accumulator.png", tint = {r=1, g=0.8, b=1, a=1}} },
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "energy",
    order = "e[electric-energy-interface]-b[electric-energy-interface]",
    place_result = "electric-energy-interface",
    stack_size = 50
  },
  {
    type = "item",
    name = "heat-interface",
    icon = "__base__/graphics/entity/heat-interface/heat-interface.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "energy",
    order = "f[heat-interface]",
    place_result = "heat-interface",
    stack_size = 20
  },
  {
    type = "item",
    name = "uranium-ore",
    icon = "__base__/graphics/icons/mip/uranium-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/mip/uranium-ore.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/uranium-ore-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/uranium-ore-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/mip/uranium-ore-3.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "g[uranium-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "nuclear-reactor",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 32,
    subgroup = "energy",
    order = "f[nuclear-energy]-a[reactor]",
    place_result = "nuclear-reactor",
    stack_size = 10
  },
  {
    type = "item",
    name = "uranium-235",
    icon = "__base__/graphics/icons/uranium-235.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "r[uranium-235]",
    stack_size = 100
  },
  {
    type = "item",
    name = "uranium-238",
    icon = "__base__/graphics/icons/uranium-238.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "r[uranium-238]",
    stack_size = 100
  },
  {
    type = "item",
    name = "centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "g[centrifuge]",
    place_result = "centrifuge",
    stack_size = 50
  },
  {
    type = "item",
    name = "uranium-fuel-cell",
    icon = "__base__/graphics/icons/uranium-fuel-cell.png",
    icon_size = 32,
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
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "r[used-up-uranium-fuel-cell]",
    stack_size = 50
  },
  {
    type = "item",
    name = "heat-exchanger",
    icon = "__base__/graphics/icons/heat-boiler.png",
    icon_size = 32,
    subgroup = "energy",
    order = "f[nuclear-energy]-c[heat-exchanger]",
    place_result = "heat-exchanger",
    stack_size = 50
  },
  {
    type = "item",
    name = "steam-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    icon_size = 32,
    subgroup = "energy",
    order = "f[nuclear-energy]-d[steam-turbine]",
    place_result = "steam-turbine",
    stack_size = 10
  },
  {
    type = "item",
    name = "heat-pipe",
    icon = "__base__/graphics/icons/heat-pipe.png",
    icon_size = 32,
    subgroup = "energy",
    order = "f[nuclear-energy]-b[heat-pipe]",
    place_result = "heat-pipe",
    stack_size = 50
  },
  {
    type = "item",
    name = "simple-entity-with-force",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[simple-entity-with-force]-f[simple-entity-with-force]",
    place_result = "simple-entity-with-force",
    stack_size = 50
  },
  {
    type = "item",
    name = "simple-entity-with-owner",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[simple-entity-with-owner]-o[simple-entity-with-owner]",
    place_result = "simple-entity-with-owner",
    stack_size = 50
  },
  {
    type = "item-with-tags",
    name = "item-with-tags",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[item-with-tags]-o[item-with-tags]",
    stack_size = 1
  },
  {
    type = "item-with-label",
    name = "item-with-label",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[item-with-label]-o[item-with-label]",
    stack_size = 1
  },
  {
    type = "item-with-inventory",
    name = "item-with-inventory",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "s[item-with-inventory]-o[item-with-inventory]",
    stack_size = 1,
    inventory_size = 1
  },
  {
    type = "item",
    name = "infinity-chest",
    icon = "__base__/graphics/icons/infinity-chest.png",
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "t[item]-o[infinity-chest]",
    stack_size = 10,
    place_result = "infinity-chest"
  },
  {
    type = "item",
    name = "infinity-pipe",
    icons =
    {{
      icon = "__base__/graphics/icons/pipe.png",
      tint = {r = 0.5, g = 0.5, b = 1}
    }},
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "other",
    order = "t[item]-o[infinity-pipe]",
    stack_size = 10,
    place_result = "infinity-pipe"
  }
}
)

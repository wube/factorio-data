local simulations = require("__base__/prototypes/tips-and-tricks-simulations")

data:extend(
{
  {
    type = "tips-and-tricks-item",
    name = "introduction",
    order = "a-[basic]-a[introduction]",
    starting_status = "unlocked",
    trigger =
    {
      type = "time-elapsed",
      ticks = 60 * 60 * 5 -- 5 minutes
    },
    simulation = simulations.introduction,
  },

  {
    type = "tips-and-tricks-item-category",
    name = "game-interaction",
    order = "a-[game-interaction]"
  },
  {
    type = "tips-and-tricks-item",
    name = "show-info",
    category = "game-interaction",
    order = "b",
    dependencies = {"introduction"},
    simulation = simulations.show_info
  },
  {
    type = "tips-and-tricks-item",
    name = "e-confirm",
    category = "game-interaction",
    order = "c",
    trigger =
    {
      type = "set-logistic-request",
      count = 5
    },
    skip_trigger =
    {
      type = "use-confirm", -- is tailored for this tip, so it only triggers on confirming the set-logistic-request dialog
      count = 3
    },
    dependencies = {"introduction"},
    image = "__base__/graphics/tips-and-tricks/e-confirm.png"
  },
  {
    type = "tips-and-tricks-item",
    name = "clear-cursor",
    category = "game-interaction",
    order = "d",
    dependencies = {"introduction"},
    image = "__base__/graphics/tips-and-tricks/clear-cursor.png"
  },
  {
    type = "tips-and-tricks-item",
    name = "pipette",
    category = "game-interaction",
    order = "e",
    trigger =
    {
      type = "build-entity",
      count = 120,
    },
    skip_trigger =
    {
      type = "use-pipette",
      count = 5
    },
    dependencies = {"introduction"},
    simulation = simulations.pipette
  },
  {
    type = "tips-and-tricks-item",
    name = "stack-transfers",
    tag = "[item=wooden-chest]",
    category = "game-interaction",
    order = "f",
    trigger =
    {
      type = "manual-transfer",
      count = 20
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "stack-transfer",
          transfer = "stack"
        },
        {
          type = "stack-transfer",
          transfer = "inventory"
        },
        {
          type = "stack-transfer",
          transfer = "whole-inventory"
        }
      }
    },
    dependencies = {"introduction"},
    tutorial = "stack-transfers",
    image = "__base__/graphics/tips-and-tricks/stack-transfers.png"
  },
  {
    type = "tips-and-tricks-item",
    name = "entity-transfers",
    tag = "[item=burner-mining-drill][item=stone-furnace]",
    category = "game-interaction",
    order = "g",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "dependencies-met",
        },
        {
          type = "time-elapsed",
          ticks = 60 * 60 * 30 -- 30 minutes later
        }
      }
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "entity-transfer",
          transfer = "in"
        },
        {
          type = "entity-transfer",
          transfer = "out"
        }
      }
    },
    dependencies = {"stack-transfers"},
    tutorial = "entity-transfers",
    simulation = simulations.entity_transfers
  },
  {
    type = "tips-and-tricks-item",
    name = "z-dropping",
    category = "game-interaction",
    order = "h",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "dependencies-met",
        },
        {
          type = "time-elapsed",
          ticks = 60 * 60 * 30 -- 30 minutes later
        }
      }
    },
    dependencies = {"entity-transfers"},
    simulation = simulations.z_drop
  },
  {
    type = "tips-and-tricks-item",
    name = "shoot-targeting",
    category = "game-interaction",
    tag = "[item=pistol]",
    order = "i",
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "group-attack"
        },
        {
          type = "time-elapsed",
          ticks = 60 * 60 * 135 -- 135 minutes
        }
      }
    },
    dependencies = {"introduction"},
    simulation = simulations.shoot_targeting
  },
  {
    type = "tips-and-tricks-item",
    name = "bulk-crafting",
    category = "game-interaction",
    tag = "[item=iron-gear-wheel]",
    order = "j",
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "craft-item",
          event_type = "crafting-of-single-item-ordered",
          consecutive = true,
          count = 5
        },
        {
          type = "craft-item",
          event_type = "crafting-of-multiple-items-ordered",
          consecutive = true,
          count = 10
        }
      }
    },
    dependencies = {"introduction"},
    image = "__base__/graphics/tips-and-tricks/bulk-crafting.png"
  },

  {
    type = "tips-and-tricks-item-category",
    name = "inserters",
    order = "b-[inserters]"
  },
  {
    type = "tips-and-tricks-item",
    name = "inserters",
    category = "inserters",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "unlocked-recipe",
      recipe = "inserter"
    },
    dependencies = {"introduction"},
    simulation = simulations.inserters
  },
  {
    type = "tips-and-tricks-item",
    name = "burner-inserter-refueling",
    tag = "[entity=burner-inserter][item=coal]",
    category = "inserters",
    indent = 1,
    order = "b",
    trigger =
    {
      type = "build-entity",
      entity = "burner-inserter",
      count = 3
    },
    dependencies = {"inserters"},
    simulation = simulations.burner_inserter_refueling
  },
  {
    type = "tips-and-tricks-item",
    name = "long-handed-inserters",
    tag = "[entity=long-handed-inserter]",
    category = "inserters",
    indent = 1,
    order = "c",
    trigger =
    {
      type = "research",
      technology = "automation"
    },
    dependencies = {"inserters"},
    simulation = simulations.long_inserters
  },
  {
    type = "tips-and-tricks-item",
    name = "move-between-labs",
    tag = "[entity=lab]",
    category = "inserters",
    indent = 1,
    order = "d",
    trigger =
    {
      type = "build-entity",
      entity = "lab",
      count = 3
    },
    dependencies = {"inserters"},
    simulation = simulations.move_between_labs
  },
  {
    type = "tips-and-tricks-item",
    name = "insertion-limits",
    tag = "[entity=boiler]",
    category = "inserters",
    indent = 1,
    order = "e",
    trigger =
    {
      type = "build-entity",
      entity = "inserter",
      match_type_only = true,
      count = 5
    },
    dependencies = {"inserters"},
    simulation = simulations.insertion_limits
  },
  {
    type = "tips-and-tricks-item",
    name = "limit-chests",
    tag = "[entity=iron-chest]",
    category = "inserters",
    indent = 1,
    order = "f",
    trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "build-entity",
          entity = "wooden-chest",
          match_type_only = true,
          count = 4
        },
        {
          type = "build-entity",
          entity = "inserter",
          match_type_only = true,
          count = 4
        }
      }
    },
    skip_trigger =
    {
      type = "limit-chest",
      count = 2
    },
    dependencies = {"inserters"},
    image = "__base__/graphics/tips-and-tricks/limit-chests.png"
  },

  {
    type = "tips-and-tricks-item-category",
    name = "belts",
    order = "c-[belts]"
  },
  {
    type = "tips-and-tricks-item",
    name = "transport-belts",
    order = "a",
    is_title = true,
    category = "belts",
    trigger =
    {
      type = "unlocked-recipe",
      recipe = "transport-belt"
    },
    dependencies = {"introduction"},
    simulation = simulations.transport_belt
  },
  {
    type = "tips-and-tricks-item",
    name = "belt-lanes",
    tag = "[entity=transport-belt]",
    category = "belts",
    indent = 1,
    order = "b",
    trigger =
    {
      type = "build-entity",
      entity = "transport-belt",
      match_type_only = true,
      count = 30
    },
    dependencies = {"transport-belts"},
    simulation = simulations.belt_lanes
  },
  {
    type = "tips-and-tricks-item",
    name = "splitters",
    tag = "[entity=splitter]",
    category = "belts",
    indent = 1,
    order = "c",
    trigger =
    {
      type = "research",
      technology = "logistics"
    },
    dependencies = {"introduction"},
    simulation = simulations.splitters
  },
  {
    type = "tips-and-tricks-item",
    name = "splitter-filters",
    tag = "[entity=splitter][item=electronic-circuit]",
    category = "belts",
    indent = 1,
    order = "d",
    trigger =
    {
      type = "build-entity",
      entity = "splitter",
      match_type_only = true,
      count = 10
    },
    dependencies = {"splitters"},
    simulation = simulations.splitter_filters
  },
  {
    type = "tips-and-tricks-item",
    name = "underground-belts",
    tag = "[entity=underground-belt]",
    category = "belts",
    indent = 1,
    order = "e",
    trigger =
    {
      type = "research",
      technology = "logistics"
    },
    dependencies = {"introduction"},
    simulation = simulations.underground_belt
  },

  {
    type = "tips-and-tricks-item-category",
    name = "electric-network",
    order = "d-[electric-network]"
  },
  {
    type = "tips-and-tricks-item",
    name = "electric-network",
    category = "electric-network",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "sequence",
          triggers =
          {
            {
              type = "and", -- making sure that it only gets unlocked in levels where this is not disabled, as in the tutorial
              triggers =
              {
                {
                  type = "unlocked-recipe",
                  recipe = "steam-engine"
                },
                {
                  type = "unlocked-recipe",
                  recipe = "boiler"
                }
              }
            },
            {
              type = "time-elapsed",
              ticks = 60 * 60 * 5 -- 15 minutes
            }
          }
        },
        {
          type = "build-entity",
          entity = "steam-engine"
        },
        {
          type = "build-entity",
          entity = "boiler"
        },
        {
          type = "build-entity",
          entity = "offshore-pump"
        },
      }
    },
    dependencies = {"introduction"},
    image = "__base__/graphics/tips-and-tricks/electric-network.png"
  },
  {
    type = "tips-and-tricks-item",
    name = "steam-power",
    tag = "[entity=steam-engine]",
    category = "electric-network",
    indent = 1,
    order = "b",
    dependencies = {"electric-network"},
    simulation = simulations.boiler
  },
  {
    type = "tips-and-tricks-item",
    name = "low-power",
    tag = "[img=utility/electricity_icon]",
    category = "electric-network",
    indent = 1,
    order = "d",
    trigger =
    {
      type = "low-power",
      count = 3 -- checked once per 12 seconds
    },
    dependencies = {"electric-network"},
    simulation = simulations.low_power
  },
  {
    type = "tips-and-tricks-item",
    name = "electric-pole-connections",
    tag = "[item=copper-cable]",
    category = "electric-network",
    indent = 1,
    order = "c",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "time-elapsed",
          ticks = 4 * 60 * 60 * 60 -- 4 hours
        },
        {
          type = "build-entity",
          entity = "small-electric-pole",
          match_type_only = true,
          count = 15
        }
      }
    },
    dependencies = {"electric-network"},
    simulation = simulations.electric_pole_connections
  },
  {
    type = "tips-and-tricks-item",
    name = "connect-switch",
    tag = "[entity=power-switch]",
    category = "electric-network",
    indent = 1,
    order = "e",
    trigger =
    {
      type = "build-entity",
      entity = "power-switch"
    },
    dependencies = {"electric-network"},
    simulation = simulations.power_switch_connections
  },

  {
    type = "tips-and-tricks-item-category",
    name = "copy-paste",
    order = "e-[copy-paste]"
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-entity-settings",
    category = "copy-paste",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "set-recipe",
      consecutive = true,
      count = 3
    },
    skip_trigger =
    {
      type = "paste-entity-settings",
      count = 2
    },
    dependencies = {"introduction"},
    simulation = simulations.copy_entity_settings
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-trains",
    tag = "[entity=locomotive]",
    category = "copy-paste",
    indent = 1,
    order = "b",
    trigger =
    {
      type = "build-entity",
      entity = "locomotive",
      count = 3
    },
    dependencies = {"copy-paste"},
    simulation = simulations.copy_paste_trains
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-filters",
    tag = "[entity=filter-inserter]",
    category = "copy-paste",
    indent = 1,
    order = "c",
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "build-entity",
          entity = "filter-inserter",
          count = 3
        },
        {
          type = "build-entity",
          entity = "stack-filter-inserter",
          count = 3
        }
      }
    },
    dependencies = {"copy-paste"},
    simulation = simulations.copy_paste_filters
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-requester-chest",
    tag = "[entity=logistic-chest-requester]",
    category = "copy-paste",
    indent = 1,
    order = "d",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "build-entity",
          entity = "logistic-chest-requester",
          match_type_only = true,
          count = 10
        },
        {
          type = "set-logistic-request",
          logistic_chest_only = true,
          count = 20
        }
      }
    },
    skip_trigger =
    {
      type = "paste-entity-settings",
      source = "assembling-machine-1",
      target = "logistic-chest-requester",
      match_type_only = true,
      count = 2
    },
    dependencies = {"copy-paste"},
    simulation = simulations.copy_paste_requester_chest
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-spidertron",
    tag = "[entity=spidertron]",
    category = "copy-paste",
    indent = 1,
    order = "e",
    trigger =
    {
      type = "build-entity",
      entity = "spidertron",
      count = 2
    },
    dependencies = {"copy-paste"},
    simulation = simulations.copy_paste_spidertron
  },

  {
    type = "tips-and-tricks-item-category",
    name = "drag-building",
    order = "f-[drag-building]"
  },
  {
    type = "tips-and-tricks-item",
    name = "drag-building",

    category = "drag-building",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "build-entity",
      count = 60,
    },
    skip_trigger =
    {
      type = "build-entity",
      build_by_dragging = true,
      count = 10
    },
    dependencies = {"introduction"},
    simulation = simulations.drag_building
  },
  {
    type = "tips-and-tricks-item",
    name = "drag-building-poles",
    tag = "[entity=small-electric-pole]",
    category = "drag-building",
    order = "b",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "small-electric-pole",
      match_type_only = true,
      count = 15,
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "small-electric-pole",
      match_type_only = true,
      count = 3,
      build_by_dragging = true
    },
    dependencies = {"drag-building"},
    simulation = simulations.drag_building_poles
  },
  {
    type = "tips-and-tricks-item",
    name = "drag-building-underground-belts",
    tag = "[entity=underground-belt]",
    category = "drag-building",
    order = "c",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "underground-belt",
      match_type_only = true,
      count = 30,
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "underground-belt",
      match_type_only = true,
      count = 3,
      build_by_dragging = true
    },
    dependencies = {"drag-building"},
    simulation = simulations.drag_building_underground
  },

  {
    type = "tips-and-tricks-item-category",
    name = "trains",
    order = "h-[trains]"
  },
  {
    type = "tips-and-tricks-item",
    name = "trains",
    category = "trains",
    trigger =
    {
      type = "research",
      technology = "railway"
    },
    dependencies = {"introduction"},
    simulation = simulations.trains,
    order = "a",
    is_title = true,
  },
  {
    type = "tips-and-tricks-item",
    name = "rail-building",
    tag = "[item=rail]",
    category = "trains",
    indent = 1,
    order = "b",
    trigger =
    {
      type = "build-entity",
      entity = "straight-rail"
    },
    dependencies = {"trains"},
    simulation = simulations.rail_building
  },
  {
    type = "tips-and-tricks-item",
    name = "train-stops",
    tag = "[item=train-stop]",
    category = "trains",
    indent = 1,
    order = "c",
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "build-entity",
          entity = "train-stop"
        },
        {
          type = "and",
          triggers =
          {
            {
              type = "research",
              technology = "automated-rail-transportation"
            },
            {
              type = "build-entity",
              entity = "straight-rail",
              count = 20
            }
          }
        }
      }
    },
    dependencies = {"trains"},
    tutorial = "trains-stations",
    simulation = simulations.train_stop
  },
  {
    type = "tips-and-tricks-item",
    name = "rail-signals-basic",
    tag = "[item=rail-signal]",
    category = "trains",
    indent = 1,
    order = "d",
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "build-entity",
          entity = "rail-signal",
          count = 1
        },
        {
          type = "and",
          triggers =
          {
            {
              type = "research",
              technology = "rail-signals"
            },
            {
              type = "build-entity",
              entity = "locomotive",
              count = 2
            }
          }
        }
      }
    },
    tutorial = "trains-basic-signals",
    simulation = simulations.rail_signals
  },
  {
    type = "tips-and-tricks-item",
    name = "rail-signals-advanced",
    tag = "[item=rail-chain-signal]",
    category = "trains",
    indent = 1,
    order = "e",
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "build-entity",
          entity = "rail-signal",
          count = 30
        },
        {
          type = "build-entity",
          entity = "rail-chain-signal"
        }
      }
    },
    dependencies = {"rail-signals-basic"},
    tutorial = "trains-advanced-signals",
    simulation = simulations.rail_signals_advanced
  },
  {
    type = "tips-and-tricks-item",
    name = "gate-over-rail",
    tag = "[entity=gate]",
    category = "trains",
    order = "g",
    trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "build-entity",
          entity = "straight-rail",
          count = 60
        },
        {
          type = "build-entity",
          entity = "stone-wall",
          count = 50
        },
        {
          type = "research",
          technology = "gate",
        }
      }
    },
    dependencies = {"trains"},
    indent = 1,
    simulation = simulations.gate_over_rail
  },
  {
    type = "tips-and-tricks-item",
    name = "pump-connection",
    tag = "[entity=pump]",
    category = "trains",
    order = "h",
    trigger =
    {
      type = "build-entity",
      entity = "fluid-wagon"
    },
    dependencies = {"trains"},
    indent = 1,
    simulation = simulations.fluid_wagon_connection
  },
  {
    type = "tips-and-tricks-item",
    name = "train-stop-same-name",
    tag = "[entity=train-stop][entity=train-stop]",
    category = "trains",
    order = "i",
    trigger =
    {
      type = "build-entity",
      entity = "train-stop",
      count = 4
    },
    dependencies = {"trains"},
    indent = 1,
    simulation = simulations.train_stops_same_name
  },

  {
    type = "tips-and-tricks-item-category",
    name = "logistic-network",
    order = "i-[logistic-network]"
  },
  {
    type = "tips-and-tricks-item",
    name = "logistic-network",
    category = "logistic-network",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "research",
          technology = "construction-robotics"
        },
        {
          type = "research",
          technology = "logistic-robotics"
        }
      }
    },
    dependencies = {"introduction"},
    simulation = simulations.logistic_network
  },
  {
    type = "tips-and-tricks-item",
    name = "personal-logistics",
    tag = "[entity=character]",
    category = "logistic-network",
    indent = 1,
    order = "b",
    trigger =
    {
      type = "research",
      technology = "logistic-robotics"
    },
    dependencies = {"logistic-network"},
    simulation = simulations.personal_logistics
  },
  {
    type = "tips-and-tricks-item",
    name = "construction-robots",
    category = "logistic-network",
    tag = "[item=construction-robot]",
    order = "c",
    trigger =
    {
      type = "research",
      technology = "construction-robotics"
    },
    dependencies = {"logistic-network"},
    indent = 1,
    simulation = simulations.construction_robots
  },
  {
    type = "tips-and-tricks-item",
    name = "passive-provider-chest",
    tag = "[item=logistic-chest-passive-provider]",
    category = "logistic-network",
    indent = 1,
    order = "d",
    dependencies = {"logistic-network"},
    simulation = simulations.personal_logistics
  },
  {
    type = "tips-and-tricks-item",
    name = "storage-chest",
    tag = "[item=logistic-chest-storage]",
    category = "logistic-network",
    indent = 1,
    order = "e",
    dependencies = {"logistic-network"},
    simulation = simulations.construction_robots
  },
  {
    type = "tips-and-tricks-item",
    name = "requester-chest",
    tag = "[item=logistic-chest-requester]",
    category = "logistic-network",
    indent = 1,
    order = "f",
    trigger =
    {
      type = "research",
      technology = "logistic-system"
    },
    dependencies = {"logistic-network"},
    simulation = simulations.requester_chest
  },
  {
    type = "tips-and-tricks-item",
    name = "active-provider-chest",
    tag = "[item=logistic-chest-active-provider]",
    category = "logistic-network",
    indent = 1,
    order = "g",
    trigger =
    {
      type = "research",
      technology = "logistic-system"
    },
    dependencies = {"logistic-network"},
    simulation = simulations.active_provider_chest
  },
  {
    type = "tips-and-tricks-item",
    name = "buffer-chest",
    tag = "[item=logistic-chest-buffer]",
    category = "logistic-network",
    indent = 1,
    order = "g",
    trigger =
    {
      type = "research",
      technology = "logistic-system"
    },
    dependencies = {"logistic-network"},
    simulation = simulations.buffer_chest
  },

  {
    type = "tips-and-tricks-item-category",
    name = "ghost-building",
    order = "j-[ghost-building]"
  },
  {
    type = "tips-and-tricks-item",
    name = "ghost-building",
    category = "ghost-building",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "research",
      technology = "construction-robotics"
    },
    dependencies = {"introduction"},
    simulation = simulations.ghost_building
  },
  {
    type = "tips-and-tricks-item",
    name = "ghost-rail-planner",
    tag = "[item=rail][item=construction-robot]",
    category = "ghost-building",
    indent = 1,
    order = "b",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "or",
          triggers =
          {
            {
              type = "build-entity",
              entity = "roboport",
              match_type_only = true
            },
            {
              type = "craft-item",
              item = "personal-roboport-equipment",
              event_type = "crafting-finished"
            }
          }
        },
        {
          type = "build-entity",
          entity = "straight-rail",
          count = 100
        }
      }
    },
    dependencies = {"ghost-building", "rail-building"},
    simulation = simulations.ghost_rail_building
  },

  {
    type = "tips-and-tricks-item",
    name = "copy-paste",
    tag = "[item=copy-paste-tool]",
    category = "ghost-building",
    indent = 1,
    order = "c",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "dependencies-met",
        },
        {
          type = "time-elapsed",
          ticks = 60 * 60 * 60 * 2 -- 2 hours
        }
      }
    },
    dependencies = {"ghost-building"},
    simulation = simulations.copy_paste
  },

  {
    type = "tips-and-tricks-item-category",
    name = "fast-replace",
    order = "k-[fast-replace]"
  },
  {
    type = "tips-and-tricks-item",
    name = "fast-replace",
    category = "fast-replace",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "build-entity",
          entity = "steel-furnace",
          count = 10
        },
        {
          type = "build-entity",
          entity = "assembling-machine-2",
          count = 10
        },
        {
          type = "build-entity",
          entity = "assembling-machine-3",
          count = 10
        }
      }
    },
    skip_trigger =
    {
      type = "fast-replace",
      count = 2
    },
    dependencies = {"introduction"},
    simulation = simulations.fast_replace
  },
  {
    type = "tips-and-tricks-item",
    name = "fast-replace-direction",
    category = "fast-replace",
    indent = 1,
    order = "b",
    trigger =
    {
      type = "build-entity",
      entity = "transport-belt",
      match_type_only = true,
      count = 50
    },
    skip_trigger =
    {
      type = "fast-replace",
      source = "transport-belt",
      target = "transport-belt",
      count = 4
    },
    simulation = simulations.fast_replace_direction
  },
  {
    type = "tips-and-tricks-item",
    name = "fast-replace-belt-splitter",
    tag = "[item=transport-belt][item=splitter]",
    category = "fast-replace",
    indent = 1,
    order = "c",
    trigger =
    {
      type = "build-entity",
      entity = "splitter",
      match_type_only = true,
      count = 20
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "fast-replace",
          source = "splitter",
          target = "transport-belt",
          match_type_only = true,
          count = 2
        },
        {
          type = "fast-replace",
          source = "transport-belt",
          target = "splitter",
          match_type_only = true,
          count = 2
        }
      }
    },
    dependencies = {"fast-replace"},
    simulation = simulations.fast_replace_belt_splitter
  },
  {
    type = "tips-and-tricks-item",
    name = "fast-replace-belt-underground",
    tag = "[item=transport-belt][item=underground-belt]",
    category = "fast-replace",
    indent = 1,
    order = "d",
    trigger =
    {
      type = "build-entity",
      entity = "underground-belt",
      match_type_only = true,
      count = 20
    },
    dependencies = {"fast-replace"},
    simulation = simulations.fast_replace_belt_underground
  },

  {
    type = "tips-and-tricks-item",
    name = "rotating-assemblers",
    tag = "[entity=assembling-machine-2]",
    order = "y",
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "set-recipe",
          uses_fluid = true,
          machine = "assembling-machine-2"
        },
        {
          type = "set-recipe",
          uses_fluid = true,
          machine = "assembling-machine-3"
        }
      }
    },
    dependencies = {"introduction"},
    simulation = simulations.rotating_assemblers
  },

  {
    type = "tips-and-tricks-item",
    name = "circuit-network",
    tag = "[item=red-wire]",
    order = "z",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "research",
          technology = "circuit-network"
        },
        {
          type = "time-elapsed",
          ticks = 60 * 60 * 30
        }
      }
    },
    dependencies = {"introduction"},
    simulation = simulations.circuit_network
  }
})

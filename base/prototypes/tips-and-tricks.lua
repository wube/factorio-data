local simulations = require("__base__/prototypes/tips-and-tricks-simulations")

data:extend(
{
  {
    type = "tips-and-tricks-item-category",
    name = "game-interaction",
    order = "a-[game-interaction]"
  },
  {
    type = "tips-and-tricks-item",
    name = "show-info",
    category = "game-interaction",
    order = "a",
    trigger =
    {
      type = "set-recipe",
      count = 5
    },
    skip_trigger =
    {
      type = "toggle-show-entity-info",
      count = 1
    },
    simulation = simulations.show_info
  },
  {
    type = "tips-and-tricks-item",
    name = "e-confirm",
    category = "game-interaction",
    order = "b",
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
    simulation = simulations.e_confirm
  },
  {
    type = "tips-and-tricks-item",
    name = "clear-cursor",
    category = "game-interaction",
    order = "c",
    trigger =
    {
      type = "time-elapsed",
      ticks = 5 * minute
    },
    skip_trigger =
    {
      type = "clear-cursor",
      count = 5
    },
    simulation = simulations.clear_cursor
  },
  {
    type = "tips-and-tricks-item",
    name = "pipette",
    category = "game-interaction",
    order = "d",
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
    simulation = simulations.pipette
  },
  {
    type = "tips-and-tricks-item",
    name = "stack-transfers",
    tag = "[item=wooden-chest]",
    category = "game-interaction",
    order = "e",
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
    tutorial = "stack-transfers",
    simulation = simulations.stack_transfers
  },
  {
    type = "tips-and-tricks-item",
    name = "entity-transfers",
    tag = "[item=burner-mining-drill][item=stone-furnace]",
    category = "game-interaction",
    order = "f",
    trigger =
    {
      type = "time-since-last-tip-activation",
      ticks = 30 * minute
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
    order = "g",
    trigger =
    {
      type = "time-since-last-tip-activation",
      ticks = 30 * minute
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "drop-item",
          drop_into_entity = false,
          count = 5
        },
        {
          type = "drop-item",
          drop_into_entity = true,
          count = 15
        }
      }
    },
    dependencies = {"entity-transfers"},
    simulation = simulations.z_drop
  },
  {
    type = "tips-and-tricks-item",
    name = "shoot-targeting",
    tag = "[item=pistol]",
    category = "game-interaction",
    order = "h",
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
          ticks = 135 * minute
        }
      }
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "shoot",
          target = "enemy"
        },
        {
          type = "shoot",
          target = "entity"
        }
      }
    },
    simulation = simulations.shoot_targeting
  },
  {
    type = "tips-and-tricks-item",
    name = "bulk-crafting",
    tag = "[item=iron-gear-wheel]",
    category = "game-interaction",
    order = "i",
    trigger =
    {
      type = "craft-item",
      event_type = "crafting-of-single-item-ordered",
      consecutive = true,
      count = 5
    },
    skip_trigger =
    {
      type = "craft-item",
      event_type = "crafting-of-multiple-items-ordered",
      consecutive = true,
      count = 3
    },
    simulation = simulations.bulk_crafting
  },
  {
    type = "tips-and-tricks-item",
    name = "rotating-assemblers",
    tag = "[entity=assembling-machine-2]",
    category = "game-interaction",
    order = "j",
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
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "rotate-entity",
          entity = "assembling-machine-2",
          count = 3
        },
        {
          type = "rotate-entity",
          entity = "assembling-machine-3",
          count = 3
        }
      }
    },
    simulation = simulations.rotating_assemblers
  },
  {
    type = "tips-and-tricks-item",
    name = "entity-flip",
    tag = "",
    category = "game-interaction",
    order = "k",
    trigger =
    {
      type = "set-recipe",
      machine = "oil-refinery",
      recipe = "advanced-oil-processing",
      count = 5
    },
    skip_trigger =
    {
      type = "flip-entity",
      count = 3
    },
    simulation = simulations.entity_flip
  },
  {
    type = "tips-and-tricks-item",
    name = "circuit-network",
    tag = "[item=red-wire]",
    category = "game-interaction",
    order = "l",
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
          ticks = 30 * minute
        },
        {
          type = "time-since-last-tip-activation",
          ticks = 15 * minute
        }
      }
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "manual-wire-drag",
          wire_type = "red",
          count = 5
        },
        {
          type = "manual-wire-drag",
          wire_type = "green",
          count = 5
        }
      }
    },
    simulation = simulations.circuit_network
  },
  {
    type = "tips-and-tricks-item",
    name = "spidertron-control",
    tag = "[entity=spidertron]",
    category = "game-interaction",
    order = "m",
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "build-entity",
          entity = "spidertron",
          count = 1
        },
        {
          type = "time-elapsed",
          ticks = 30 * minute
        },
        {
          type = "time-since-last-tip-activation",
          ticks = 15 * minute
        }
      }
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "enter-vehicle",
          vehicle = "spidertron",
          match_type_only = true,
          count = 1
        },
        {
          type = "send-spidertron",
          append = true,
          count = 5
        },
        {
          type = "send-spidertron",
          append = false,
          count = 5
        }
      }
    },
    simulation = simulations.spidertron_control
  },
  {
    type = "tips-and-tricks-item",
    name = "belt-lanes",
    tag = "[entity=transport-belt]",
    category = "game-interaction",
    order = "n",
    trigger =
    {
      type = "build-entity",
      entity = "transport-belt",
      match_type_only = true,
      count = 30
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "build-entity",
          entity = "transport-belt",
          match_type_only = true,
          count = 400
        },
        {
          type = "build-entity",
          entity = "inserter",
          match_type_only = true,
          count = 40
        }
      }
    },
    simulation = simulations.belt_lanes
  },
  {
    type = "tips-and-tricks-item",
    name = "splitters",
    tag = "[entity=splitter]",
    category = "game-interaction",
    order = "o",
    trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "research",
          technology = "logistics"
        },
        {
          type = "build-entity",
          entity = "transport-belt",
          match_type_only = true,
          count = 200
        }
      }
    },
    skip_trigger =
    {
      type = "set-filter",
      entity = "splitter",
      match_type_only = true,
      count = 3
    },
    simulation = simulations.splitters
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
      type = "build-entity",
      count = 50,
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "inserter",
      count = 20,
      match_type_only = true
    },
    simulation = simulations.inserters
  },
  {
    type = "tips-and-tricks-item",
    name = "burner-inserter-refueling",
    tag = "[entity=burner-inserter][item=coal]",
    category = "inserters",
    order = "b",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "burner-inserter",
      count = 3
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "inserter",
      match_type_only = true,
      count = 50
    },
    dependencies = {"inserters"},
    simulation = simulations.burner_inserter_refueling
  },
  {
    type = "tips-and-tricks-item",
    name = "long-handed-inserters",
    tag = "[entity=long-handed-inserter]",
    category = "inserters",
    order = "c",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "automation"
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "long-handed-inserter",
      count = 15
    },
    dependencies = {"inserters"},
    simulation = simulations.long_inserters
  },
  {
    type = "tips-and-tricks-item",
    name = "move-between-labs",
    tag = "[entity=lab]",
    category = "inserters",
    order = "d",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "lab",
      count = 3
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "lab",
      count = 12
    },
    dependencies = {"inserters"},
    simulation = simulations.move_between_labs
  },
  {
    type = "tips-and-tricks-item",
    name = "insertion-limits",
    tag = "[entity=boiler]",
    category = "inserters",
    order = "e",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "inserter",
      match_type_only = true,
      count = 5
    },
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "build-entity",
          entity = "assembling-machine-1",
          match_type_only = true,
          count = 10
        },
        {
          type = "time-elapsed",
          ticks = 180 * minute
        }
      }
    },
    dependencies = {"inserters"},
    simulation = simulations.insertion_limits
  },
  {
    type = "tips-and-tricks-item",
    name = "limit-chests",
    tag = "[entity=iron-chest]",
    category = "inserters",
    order = "f",
    indent = 1,
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
    simulation = simulations.limit_chest
  },

  {
    type = "tips-and-tricks-item-category",
    name = "electric-network",
    order = "c-[electric-network]"
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
                  type = "unlock-recipe",
                  recipe = "steam-engine"
                },
                {
                  type = "unlock-recipe",
                  recipe = "boiler"
                }
              }
            },
            {
              type = "time-elapsed",
              ticks = 15 * minute
            },
            {
              type = "time-since-last-tip-activation",
              ticks = 15 * minute
            }
          }
        },
        {
          type = "craft-item",
          item = "small-electric-pole",
          event_type = "crafting-finished"
        },
        {
          type = "craft-item",
          item = "steam-engine",
          event_type = "crafting-finished"
        },
        {
          type = "craft-item",
          item = "boiler",
          event_type = "crafting-finished"
        },
        {
          type = "craft-item",
          item = "offshore-pump",
          event_type = "crafting-finished"
        }
      }
    },
    skip_trigger =
    {
      type = "generating-power",
      count = 25 -- checked once per 12 seconds (in total 5 minutes)
    },
    simulation = simulations.electric_network
  },
  {
    type = "tips-and-tricks-item",
    name = "steam-power",
    tag = "[entity=steam-engine]",
    category = "electric-network",
    order = "b",
    indent = 1,
    skip_trigger =
    {
      type = "generating-power",
      count = 25 -- checked once per 12 seconds (in total 5 minutes)
    },
    dependencies = {"electric-network"},
    simulation = simulations.steam_power
  },
  {
    type = "tips-and-tricks-item",
    name = "electric-pole-connections",
    tag = "[item=copper-cable]",
    category = "electric-network",
    order = "c",
    indent = 1,
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "time-elapsed",
          ticks = 240 * minute
        },
        {
          type = "build-entity",
          entity = "small-electric-pole",
          match_type_only = true,
          count = 15
        }
      }
    },
    skip_trigger =
    {
      type = "manual-wire-drag",
      wire_type = "copper",
      count = 5
    },
    dependencies = {"electric-network"},
    simulation = simulations.electric_pole_connections
  },
  {
    type = "tips-and-tricks-item",
    name = "low-power",
    tag = "[img=utility/electricity_icon]",
    category = "electric-network",
    order = "d",
    indent = 1,
    trigger =
    {
      type = "low-power",
      count = 3 -- checked once per 12 seconds
    },
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "low-power",
          count = 3 -- checked once per 12 seconds
        },
        {
          type = "time-elapsed",
          ticks = 180 * minute
        }
      }
    },
    dependencies = {"electric-network"},
    simulation = simulations.low_power
  },
  {
    type = "tips-and-tricks-item",
    name = "connect-switch",
    tag = "[entity=power-switch]",
    category = "electric-network",
    order = "e",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "power-switch"
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "manual-wire-drag",
          wire_type = "copper",
          source = "power-switch",
          count = 1
        },
        {
          type = "manual-wire-drag",
          wire_type = "copper",
          target = "power-switch",
          count = 1
        }
      }
    },
    dependencies = {"electric-network"},
    simulation = simulations.power_switch_connections
  },

  {
    type = "tips-and-tricks-item-category",
    name = "copy-paste",
    order = "d-[copy-paste]"
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
    simulation = simulations.copy_entity_settings
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-trains",
    tag = "[entity=locomotive]",
    category = "copy-paste",
    order = "b",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "locomotive",
      count = 3
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "paste-entity-settings",
          source = "locomotive",
          target = "locomotive",
          count = 1
        },
        {
          type = "paste-entity-settings",
          source = "train-stop",
          target = "train-stop",
          count = 1
        },
        {
          type = "paste-entity-settings",
          source = "locomotive",
          target = "train-stop",
          count = 1
        },
        {
          type = "paste-entity-settings",
          source = "train-stop",
          target = "locomotive",
          count = 1
        }
      }
    },
    dependencies = {"copy-entity-settings"},
    simulation = simulations.copy_paste_trains
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-filters",
    tag = "[entity=fast-inserter]",
    category = "copy-paste",
    order = "c",
    indent = 1,
    trigger =
    {
      type = "set-filter",
      consecutive = true,
      count = 3
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "paste-entity-settings",
          source = "fast-inserter",
          target = "fast-inserter",
          count = 1
        },
        {
          type = "paste-entity-settings",
          source = "splitter",
          target = "splitter",
          count = 1
        },
        {
          type = "paste-entity-settings",
          source = "requester-chest",
          target = "requester-chest",
          count = 1
        },
        {
          type = "paste-entity-settings",
          source = "cargo-wagon",
          target = "cargo-wagon",
          count = 1
        }
      }
    },
    dependencies = {"copy-entity-settings"},
    simulation = simulations.copy_paste_filters
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-requester-chest",
    tag = "[entity=requester-chest]",
    category = "copy-paste",
    order = "d",
    indent = 1,
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "build-entity",
          entity = "requester-chest",
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
      target = "requester-chest",
      match_type_only = true,
      count = 2
    },
    dependencies = {"copy-entity-settings"},
    simulation = simulations.copy_paste_requester_chest
  },
  {
    type = "tips-and-tricks-item",
    name = "copy-paste-spidertron",
    tag = "[entity=spidertron][entity=spidertron]",
    category = "copy-paste",
    order = "e",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "spidertron",
      count = 2
    },
    skip_trigger =
    {
      type = "paste-entity-settings",
      source = "spidertron",
      target = "spidertron",
      count = 1
    },
    dependencies = {"copy-entity-settings"},
    simulation = simulations.copy_paste_spidertron
  },

  {
    type = "tips-and-tricks-item-category",
    name = "drag-building",
    order = "e-[drag-building]"
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
      build_by_dragging = false,
      build_in_line = true,
      consecutive = true,
      count = 4
    },
    skip_trigger =
    {
      type = "build-entity",
      build_by_dragging = true,
      build_in_line = true,
      consecutive = true,
      count = 5
    },
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
      consecutive = true,
      linear_power_pole_line = true,
      count = 7
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "small-electric-pole",
      match_type_only = true,
      build_by_dragging = true,
      consecutive = true,
      linear_power_pole_line = true,
      count = 3
    },
    dependencies = {"drag-building"},
    simulation = simulations.drag_building_poles
  },
  {
    type = "tips-and-tricks-item",
    name = "pole-dragging-coverage",
    tag = "[entity=small-electric-pole][img=utility/electricity_icon_unplugged]",
    category = "drag-building",
    order = "c",
    indent = 1,
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "dependencies-met",
        },
        {
          type = "time-elapsed",
          ticks = 180 * minute
        }
      }
    },
    dependencies = {"drag-building-poles"},
    simulation = simulations.pole_dragging_coverage
  },
  {
    type = "tips-and-tricks-item",
    name = "drag-building-underground-belts",
    tag = "[entity=underground-belt]",
    category = "drag-building",
    order = "d",
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
      build_by_dragging = true,
      count = 3
    },
    dependencies = {"drag-building"},
    simulation = simulations.drag_building_underground
  },
  {
    type = "tips-and-tricks-item",
    name = "fast-belt-bending",
    tag = "[entity=transport-belt]",
    category = "drag-building",
    order = "e",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "transport-belt",
      match_type_only = true,
      build_by_dragging = true,
      count = 200
    },
    skip_trigger =
    {
      type = "fast-belt-bend",
      count = 3
    },
    dependencies = {"drag-building"},
    simulation = simulations.smart_belt_building
  },

  {
    type = "tips-and-tricks-item",
    name = "fast-obstacle-traversing",
    tag = "[entity=transport-belt][entity=underground-belt]",
    category = "drag-building",
    order = "f",
    indent = 1,
    trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "build-entity",
          entity = "transport-belt",
          match_type_only = true,
          build_by_dragging = true,
          count = 200
        },
        {
          type = "build-entity",
          entity = "underground-belt",
          match_type_only = true,
          build_by_dragging = true,
          count = 20
        }
      }
    },
    skip_trigger =
    {
      type = "belt-traverse",
      count = 3
    },
    dependencies = {"drag-building"},
    simulation = simulations.fast_obstacle_traversing
  },

  {
    type = "tips-and-tricks-item-category",
    name = "trains",
    order = "f-[trains]"
  },
  {
    type = "tips-and-tricks-item",
    name = "trains",
    category = "trains",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "research",
      technology = "railway"
    },
    skip_trigger =
    {
      type = "enter-vehicle",
      vehicle = "locomotive",
      match_type_only = true,
      count = 5
    },
    simulation = simulations.trains
  },
  {
    type = "tips-and-tricks-item",
    name = "rail-building",
    tag = "[item=rail]",
    category = "trains",
    order = "b",
    indent = 1,
    trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "craft-item",
          item = "rail",
          event_type = "crafting-finished"
        },
        {
          type = "build-entity",
          entity = "straight-rail"
        }
      }
    },
    skip_trigger =
    {
      type = "use-rail-planner",
      count = 5,
      build_mode = "normal"
    },
    simulation = simulations.rail_building
  },
  {
    type = "tips-and-tricks-item",
    name = "train-stops",
    tag = "[item=train-stop]",
    category = "trains",
    order = "d",
    indent = 1,
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
    skip_trigger =
    {
      type = "plan-train-path",
      distance = 10
    },
    tutorial = "trains-stations",
    simulation = simulations.train_stop
  },
  {
    type = "tips-and-tricks-item",
    name = "rail-signals-basic",
    tag = "[item=rail-signal]",
    category = "trains",
    order = "e",
    indent = 1,
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
              technology = "automated-rail-transportation"
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
    skip_trigger =
    {
      type = "build-entity",
      entity = "rail-signal",
      count = 20
    },
    tutorial = "trains-basic-signals",
    simulation = simulations.rail_signals
  },
  {
    type = "tips-and-tricks-item",
    name = "rail-signals-advanced",
    tag = "[item=rail-chain-signal]",
    category = "trains",
    order = "f",
    indent = 1,
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
    skip_trigger =
    {
      type = "build-entity",
      entity = "rail-chain-signal",
      count = 20
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
    indent = 1,
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
    skip_trigger =
    {
      type = "gate-over-rail-build",
      count = 4
    },
    simulation = simulations.gate_over_rail
  },
  {
    type = "tips-and-tricks-item",
    name = "pump-connection",
    tag = "[entity=pump]",
    category = "trains",
    order = "h",
    indent = 1,
    trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "build-entity",
          entity = "train-stop",
          count = 2
        },
        {
          type = "or",
          triggers =
          {
            {
              type = "craft-item",
              item = "fluid-wagon",
              event_type = "crafting-finished"
            },
            {
              type = "build-entity",
              entity = "fluid-wagon"
            }
          }
        }
      }
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "fluid-wagon",
      count = 10
    },
    simulation = simulations.fluid_wagon_connection
  },
  {
    type = "tips-and-tricks-item",
    name = "train-stop-same-name",
    tag = "[entity=train-stop][entity=train-stop]",
    category = "trains",
    order = "i",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "train-stop",
      count = 4
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "train-stop",
      count = 25
    },
    simulation = simulations.train_stops_same_name
  },

  {
    type = "tips-and-tricks-item-category",
    name = "logistic-network",
    order = "g-[logistic-network]"
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
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "build-entity",
          entity = "roboport",
          count = 5
        },
        {
          type = "or",
          triggers =
          {
            {
              type = "craft-item",
              item = "logistic-robot",
              event_type = "crafting-finished",
              count = 5
            },
            {
              type = "craft-item",
              item = "construction-robot",
              event_type = "crafting-finished",
              count = 5
            },
            {
              type = "set-logistic-request",
              count = 6
            }
          }
        }
      }
    },
    simulation = simulations.logistic_network
  },
  {
    type = "tips-and-tricks-item",
    name = "personal-logistics",
    tag = "[entity=character]",
    category = "logistic-network",
    order = "b",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "logistic-robotics"
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "dependencies-met"
        },
        {
          type = "set-logistic-request",
          count = 1
        },
        {
          type = "or",
          triggers =
          {
            {
              type = "build-entity",
              entity = "passive-provider-chest",
              count = 1
            },
            {
              type = "build-entity",
              entity = "storage-chest",
              count = 1
            }
          }
        }
      }
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
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "construction-robotics"
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "mine-item-by-robot",
          count = 1
        },
        {
          type = "build-entity-by-robot",
          count = 1
        }
      }
    },
    dependencies = {"logistic-network"},
    simulation = simulations.construction_robots
  },
  {
    type = "tips-and-tricks-item",
    name = "passive-provider-chest",
    tag = "[item=passive-provider-chest]",
    category = "logistic-network",
    order = "d",
    indent = 1,
    skip_trigger =
    {
      type = "build-entity",
      entity = "passive-provider-chest",
      count = 10
    },
    dependencies = {"logistic-network"},
    simulation = simulations.personal_logistics
  },
  {
    type = "tips-and-tricks-item",
    name = "storage-chest",
    tag = "[item=storage-chest]",
    category = "logistic-network",
    order = "e",
    indent = 1,
    skip_trigger =
    {
      type = "build-entity",
      entity = "storage-chest",
      count = 10
    },
    dependencies = {"logistic-network"},
    simulation = simulations.construction_robots
  },
  {
    type = "tips-and-tricks-item",
    name = "requester-chest",
    tag = "[item=requester-chest]",
    category = "logistic-network",
    order = "f",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "logistic-system"
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "requester-chest",
      count = 10
    },
    dependencies = {"logistic-network"},
    simulation = simulations.requester_chest
  },
  {
    type = "tips-and-tricks-item",
    name = "active-provider-chest",
    tag = "[item=active-provider-chest]",
    category = "logistic-network",
    order = "g",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "logistic-system"
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "active-provider-chest",
      count = 10
    },
    dependencies = {"logistic-network"},
    simulation = simulations.active_provider_chest
  },
  {
    type = "tips-and-tricks-item",
    name = "buffer-chest",
    tag = "[item=buffer-chest]",
    category = "logistic-network",
    order = "h",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "logistic-system"
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "buffer-chest",
      count = 10
    },
    dependencies = {"logistic-network"},
    simulation = simulations.buffer_chest
  },

  {
    type = "tips-and-tricks-item-category",
    name = "ghost-building",
    order = "h-[ghost-building]"
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
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "alternative-build",
          count = 5
        },
        {
          type = "research",
          technology = "construction-robotics"
        }
      }
    },
    simulation = simulations.ghost_building
  },
  {
    type = "tips-and-tricks-item",
    name = "ghost-rail-planner",
    tag = "[item=rail][item=construction-robot]",
    category = "ghost-building",
    order = "b",
    indent = 1,
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
            },
            {
              type = "place-equipment",
              equipment = "personal-roboport-equipment"
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
    skip_trigger =
    {
      type = "use-rail-planner",
      build_mode = "forced",
      count = 5
    },
    dependencies = {"ghost-building", "rail-building"},
    simulation = simulations.ghost_rail_building
  },

  {
    type = "tips-and-tricks-item",
    name = "copy-paste",
    tag = "[item=copy-paste-tool]",
    category = "ghost-building",
    order = "c",
    indent = 1,
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
          ticks = 120 * minute
        },
        {
          type = "time-since-last-tip-activation",
          ticks = 15 * minute
        }
      }
    },
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "dependencies-met",
        },
        {
          type = "activate-paste",
          count = 5
        }
      }
    },
    dependencies = {"ghost-building"},
    simulation = simulations.copy_paste
  },
  {
    type = "tips-and-tricks-item-category",
    name = "fast-replace",
    order = "i-[fast-replace]"
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
    simulation = simulations.fast_replace
  },
  {
    type = "tips-and-tricks-item",
    name = "fast-replace-direction",
    category = "fast-replace",
    order = "b",
    indent = 1,
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
    dependencies = {"belt-lanes"},
    simulation = simulations.fast_replace_direction
  },
  {
    type = "tips-and-tricks-item",
    name = "fast-replace-belt-splitter",
    tag = "[item=transport-belt][item=splitter]",
    category = "fast-replace",
    order = "c",
    indent = 1,
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
    order = "d",
    indent = 1,
    trigger =
    {
      type = "build-entity",
      entity = "underground-belt",
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
          source = "underground-belt",
          target = "transport-belt",
          match_type_only = true,
          count = 4
        },
        {
          type = "fast-replace",
          source = "transport-belt",
          target = "underground-belt",
          match_type_only = true,
          count = 4
        }
      }
    },
    dependencies = {"fast-replace"},
    simulation = simulations.fast_replace_belt_underground
  }
})

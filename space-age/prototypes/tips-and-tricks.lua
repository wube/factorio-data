local simulations = require("__space-age__/prototypes/tips-and-tricks-simulations")

data:extend(
{
  {
    type = "tips-and-tricks-item-category",
    name = "space-age",
    order = "k-[space-age]"
  },
  {
    type = "tips-and-tricks-item",
    name = "fulgora-briefing",
    tag = "[planet=fulgora]",
    category = "space-age",
    order = "a-a",
    trigger =
    {
      type = "research",
      technology = "planet-discovery-fulgora"
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "change-surface",
          surface = "fulgora"
        },
        {
          type = "sequence",
          triggers =
          {
            {
              type = "research",
              technology = "planet-discovery-fulgora"
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
        }
      }
    },
    simulation = simulations.fulgora_briefing
  },

  {
    type = "tips-and-tricks-item",
    name = "lightning-mechanics",
    tag = "[item=lightning-rod]",
    category = "space-age",
    order = "a-b",
    indent = 1,
    trigger =
    {
      type = "change-surface",
      surface = "fulgora"
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "lightning-rod",
      count = 2,
      match_type_only = true
    },
    simulation = simulations.lightning_mechanics
  },
  {
    type = "tips-and-tricks-item",
    name = "gleba-briefing",
    tag = "[planet=gleba]",
    category = "space-age",
    order = "b-a",
    trigger =
    {
      type = "research",
      technology = "planet-discovery-gleba"
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "change-surface",
          surface = "gleba"
        },
        {
          type = "sequence",
          triggers =
          {
            {
              type = "research",
              technology = "planet-discovery-gleba"
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
        }
      }
    },
    simulation = simulations.gleba_briefing
  },
  {
    type = "tips-and-tricks-item",
    name = "agriculture",
    tag = "[item=agricultural-tower]",
    category = "space-age",
    order = "b-b",
    indent = 1,
    trigger =
    {
      type = "change-surface",
      surface = "gleba"
    },
    skip_trigger =
    {
      type = "build-entity",
      entity = "agricultural-tower",
      count = 1,
      match_type_only = true
    },
    simulation = simulations.agriculture
  },
  {
    type = "tips-and-tricks-item",
    name = "vulcanus-briefing",
    tag = "[planet=vulcanus]",
    category = "space-age",
    order = "c-a",
    trigger =
    {
      type = "research",
      technology = "planet-discovery-vulcanus"
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "change-surface",
          surface = "vulcanus"
        },
        {
          type = "sequence",
          triggers =
          {
            {
              type = "research",
              technology = "planet-discovery-vulcanus"
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
        }
      }
    },
    simulation = simulations.vulcanus_briefing
  },
  {
    type = "tips-and-tricks-item",
    name = "lava-processing",
    tag = "[item=foundry]",
    category = "space-age",
    order = "c-b",
    indent = 1,
    trigger =
    {
      type = "change-surface",
      surface = "vulcanus"
    },
    skip_trigger =
    {
      type = "set-recipe",
      recipe = "molten-iron-from-lava",
      count = 1
    },
    simulation = simulations.lava_processing
  },
  {
    type = "tips-and-tricks-item",
    name = "aquilo-briefing",
    tag = "[planet=aquilo]",
    category = "space-age",
    order = "d-a",
    trigger =
    {
      type = "research",
      technology = "planet-discovery-aquilo"
    },
    skip_trigger =
    {
      type = "or",
      triggers =
      {
        {
          type = "change-surface",
          surface = "aquilo"
        },
        {
          type = "sequence",
          triggers =
          {
            {
              type = "research",
              technology = "planet-discovery-aquilo"
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
        }
      }
    },
    simulation = simulations.aquilo_briefing
  },
  {
    type = "tips-and-tricks-item",
    name = "heating-mechanics",
    tag = "[item=heating-tower]",
    category = "space-age",
    order = "d-b",
    indent = 1,
    trigger =
    {
      type = "change-surface",
      surface = "aquilo"
    },
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "build-entity",
          entity = "heating-tower",
          count = 1,
          match_type_only = true
        },
        {
          type = "build-entity",
          entity = "heat-pipe",
          count = 5,
          match_type_only = true
        }
      }
    },
    simulation = simulations.heating_mechanics
  },

  {
    type = "tips-and-tricks-item-category",
    name = "space-platform",
    order = "l-[space-age]"
  },
  {
    type = "tips-and-tricks-item",
    name = "space-platform",
    category = "space-platform",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "build-entity",
      entity = "rocket-silo"
    },
    skip_trigger =
    {
      type = "research",
      technology = "space-science-pack"
    },
    simulation = simulations.space_platform
  },
  {
    type = "tips-and-tricks-item",
    name = "orbital-logistics",
    tag = "[entity=cargo-landing-pad]",
    category = "space-platform",
    order = "b",
    indent = 1,
    trigger =
    {
      type = "apply-starter-pack",
      count = 1
    },
    skip_trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "set-logistic-request",
          entity = "cargo-landing-pad",
          count = 5
        },
        {
          type = "set-logistic-request",
          entity = "space-platform-hub",
          count = 5
        }
      }
    },
    simulation = simulations.orbital_logistics
  },
  {
    type = "tips-and-tricks-item",
    name = "removing-trash-in-space",
    tag = "[item=space-platform-starter-pack][entity=inserter]",
    category = "space-platform",
    order = "c",
    indent = 1,
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "apply-starter-pack",
          count = 1
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
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "apply-starter-pack",
          count = 1
        },
        {
          type = "time-elapsed",
          ticks = 180 * minute
        }
      }
    },
    dependencies = {"space-platform"},
    simulation = simulations.removing_trash_in_space
  },
  {
    type = "tips-and-tricks-item",
    name = "space-science",
    tag = "[item=space-science-pack]",
    category = "space-platform",
    order = "d",
    indent = 1,
    trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "research",
          technology = "space-science-pack"
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
    skip_trigger =
    {
      type = "set-recipe",
      recipe = "space-science-pack",
      count = 1
    },
    dependencies = {"space-platform"},
    simulation = simulations.space_science
  },
  {
    type = "tips-and-tricks-item",
    name = "asteroid-defense",
    tag = "[item=metallic-asteroid-chunk][entity=gun-turret]",
    category = "space-platform",
    order = "e",
    indent = 1,
    trigger =
    {
      type = "and",
      triggers =
      {
        {
          type = "craft-item",
          item = "thruster",
          count = 1,
          event_type = "crafting-finished"
        },
        {
          type = "set-recipe",
          recipe = "thruster-fuel",
          count = 1
        },
        {
          type = "set-recipe",
          recipe = "thruster-oxidizer",
          count = 1
        }
      }
    },
    skip_trigger =
    {
      type = "kill",
      entity = "small-metallic-asteroid",
      match_type_only = true,
      damage_type = "physical",
      count = 1
    },
    dependencies = {"space-platform"},
    simulation = simulations.asteroid_defense
  },

  {
    type = "tips-and-tricks-item-category",
    name = "spoilables",
    order = "m-[spoilables]"
  },
  {
    type = "tips-and-tricks-item",
    name = "spoilables",
    category = "spoilables",
    order = "a",
    is_title = true,
    trigger =
    {
      type = "change-surface",
      surface = "gleba"
    },
    skip_trigger =
    {
      type = "sequence",
      triggers =
      {
        {
          type = "change-surface",
          surface = "gleba"
        },
        {
          type = "time-elapsed",
          ticks = 180 * minute
        }
      }
    },
    simulation = simulations.spoilables
  },
  {
    type = "tips-and-tricks-item",
    name = "spoilables-result",
    tag = "[item=jellynut]",
    category = "spoilables",
    order = "b",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "agriculture"
    },
    skip_trigger =
    {
      type = "set-recipe",
      machine = "biochamber",
      count = 5
    },
    dependencies = {"spoilables"},
    simulation = simulations.spoilables_result
  },
  {
    type = "tips-and-tricks-item",
    name = "spoilables-research",
    tag = "[item=agricultural-science-pack]",
    category = "spoilables",
    order = "c",
    indent = 1,
    trigger =
    {
      type = "research",
      technology = "agricultural-science-pack"
    },
    skip_trigger =
    {
      type = "research-with-science-pack",
      science_pack = "agricultural-science-pack"
    },
    dependencies = {"spoilables"},
    simulation = simulations.spoilables_research
  },
})

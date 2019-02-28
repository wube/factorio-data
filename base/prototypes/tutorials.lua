-- build_entity = "steel-furnace",
-- craft_item = "pipe",
data:extend(
{
  {
    type = "tutorial",
    name = "trains-basics",
    scenario = "trains-basics",
    order = "d[trains]-a[basic-train]",
    trigger =
    {
      type = "research-technology",
      technology = "railway"
    },
    icon = "__base__/graphics/technology/railway.png",
    icon_size = 128,
    related_items = {"rail", "locomotive"}
  },
  {
    type = "tutorial",
    name = "trains-ghost-rail-planner",
    scenario = "trains-ghost-rail-planner",
    order = "d[trains]-b[ghost-rail-planner]",
    trigger =
    {
      type = "research-technology",
      technology = "construction-robotics"
    },
    icon = "__base__/graphics/technology/railway.png",
    icon_size = 128,
    related_items = {"rail", "construction-robot"},
    dependencies = {"trains-basics", "construction-robots"}
  },
  {
    type = "tutorial",
    name = "trains-stations",
    scenario = "trains-stations",
    order = "d[trains]-c[stations]",
    trigger =
    {
      type = "research-technology",
      technology = "automated-rail-transportation"
    },
    icon = "__base__/graphics/technology/automated-rail-transportation.png",
    icon_size = 128,
    related_items = {"train-stop", "locomotive", "cargo-wagon"},
    dependencies = {"trains-basics"}
  },
  {
    type = "tutorial",
    name = "trains-basic-signals",
    scenario = "trains-basic-signals",
    order = "d[trains]-d[basic-signal]",
    trigger =
    {
      type = "research-technology",
      technology = "rail-signals"
    },
    icon = "__base__/graphics/technology/rail-signals.png",
    icon_size = 128,
    related_items = {"rail-signal", "locomotive"},
    dependencies = {"trains-stations"}
  },
  {
    type = "tutorial",
    name = "trains-advanced-signals",
    scenario = "trains-advanced-signals",
    order = "d[trains]-e[advanced-signal]",
    trigger =
    {
      type = "research-technology",
      technology = "rail-signals"
    },
    icon = "__base__/graphics/technology/rail-signals.png",
    icon_size = 128,
    related_items = {"rail-signal", "rail-chain-signal", "locomotive"},
    dependencies = {"trains-basic-signals"}
  },
  {
    type = "tutorial",
    name = "logistic-system-basic",
    scenario = "logistic-system-basic",
    order = "b[worker-robots]-a[basic]",
    trigger =
    {
      type = "research-technology",
      technology = "character-logistic-slots-1"
    },
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 128,
    related_items = {"roboport", "logistic-robot", "logistic-chest-storage", "logistic-chest-passive-provider"}
  },
  {
    type = "tutorial",
    name = "construction-robots",
    scenario = "construction-robots",
    order = "b[worker-robots]-b[construction-robots]",
    trigger =
    {
      type = "research-technology",
      technology = "construction-robotics"
    },
    icon = "__base__/graphics/technology/construction-robotics.png",
    icon_size = 128,
    related_items = {"roboport", "construction-robot", "blueprint"},
    dependencies = {"logistic-system-basic"}
  },
  --[[
  {
    type = "tutorial",
    name = "logistic-robots",
    scenario = "logistic-robots",
    order = "b[worker-robots]-c[logistic-robots]",
    technology = "logistic-system",
    icon = "__base__/graphics/technology/logistic-system.png",
    icon_size = 128,
    related_items = {"roboport", "logistic-robot", "logistic-chest-passive-provider", "logistic-chest-requester"}
  },
  ]]
  {
    type = "tutorial",
    name = "stack-transfers",
    scenario = "stack-transfers",
    order = "a[interface]-a[stack-transfers]",
    trigger =
    {
      type = "manual-transfer",
      count = 20
    },
    icon = "__base__/graphics/technology/toolbelt.png",
    icon_size = 128,
    related_items = {"iron-chest"}
  }
})

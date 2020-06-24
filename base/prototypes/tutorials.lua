-- build_entity = "steel-furnace",
-- craft_item = "pipe",
data:extend(
{
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
    dependencies = {"trains-basics", "construction-robots"},
    locked_when_dependencies_not_completed = false
  },
  {
    type = "tutorial",
    name = "logistic-system-basic",
    scenario = "logistic-system-basic",
    order = "b[worker-robots]-a[basic]",
    trigger =
    {
      type = "research-technology",
      technology = "logistic-robotics"
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
    dependencies = {"logistic-system-basic"},
    locked_when_dependencies_not_completed = false
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
})

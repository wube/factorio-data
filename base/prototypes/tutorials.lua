-- build_entity = "steel-furnace",
-- craft_item = "pipe",
data:extend(
{
  {
    type = "tutorial",
    name = "trains-basics",
    scenario = "trains-basics",
    order = "a[trains]-a[basic-train]",
    technology = "railway",
    icon = "__base__/graphics/technology/railway.png",
    icon_size = 128,
    related_items = {"rail", "locomotive"}
  },
  {
    type = "tutorial",
    name = "trains-ghost-rail-planner",
    scenario = "trains-ghost-rail-planner",
    order = "a[trains]-b[ghost-rail-planner]",
    technology = "construction-robotics",
    icon = "__base__/graphics/technology/railway.png",
    icon_size = 128,
    related_items = {"rail", "construction-robot"}
  },
  {
    type = "tutorial",
    name = "trains-stations",
    scenario = "trains-stations",
    order = "a[trains]-c[stations]",
    technology = "automated-rail-transportation",
    icon = "__base__/graphics/technology/automated-rail-transportation.png",
    icon_size = 128,
    related_items = {"train-stop", "locomotive", "cargo-wagon"}
  },
  {
    type = "tutorial",
    name = "trains-basic-signals",
    scenario = "trains-basic-signals",
    order = "a[trains]-d[basic-signal]",
    technology = "rail-signals",
    icon = "__base__/graphics/technology/rail-signals.png",
    icon_size = 128,
    related_items = {"rail-signal", "locomotive"}
  },
  {
    type = "tutorial",
    name = "trains-advanced-signals",
    scenario = "trains-advanced-signals",
    order = "a[trains]-e[advanced-signal]",
    technology = "rail-signals",
    icon = "__base__/graphics/technology/rail-signals.png",
    icon_size = 128,
    related_items = {"rail-signal", "rail-chain-signal", "locomotive"}
  }
})

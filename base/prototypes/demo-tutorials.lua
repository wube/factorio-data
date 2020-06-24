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
    related_items = {"iron-chest"},
    unlocked = true
  },
})

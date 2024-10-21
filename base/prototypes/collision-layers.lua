data:extend(
{
  -- TODO boskid: temporary list for compatibility, it would be nice to rework that list from scratch
  { type = "collision-layer", order = "01", name = "ground_tile" },
  { type = "collision-layer", order = "02", name = "water_tile" },
  { type = "collision-layer", order = "03", name = "resource" },
  { type = "collision-layer", order = "04", name = "doodad" },
  { type = "collision-layer", order = "05", name = "floor" },
  { type = "collision-layer", order = "06", name = "rail" },
  { type = "collision-layer", order = "07", name = "transport_belt" },
  { type = "collision-layer", order = "08", name = "item" },
  { type = "collision-layer", order = "09", name = "ghost" },
  { type = "collision-layer", order = "10", name = "object" },
  { type = "collision-layer", order = "11", name = "player" },
  { type = "collision-layer", order = "12", name = "car" },
  { type = "collision-layer", order = "13", name = "train" },
  { type = "collision-layer", order = "14", name = "elevated_rail" },
  { type = "collision-layer", order = "15", name = "elevated_train" },
  { type = "collision-layer", order = "16", name = "empty_space" },
  { type = "collision-layer", order = "17", name = "lava_tile" },
  { type = "collision-layer", order = "18", name = "meltable" },
  { type = "collision-layer", order = "19", name = "rail_support" },
  { type = "collision-layer", order = "20", name = "trigger_target" }, -- for collision masks that collide with nothing, but still need to be targetable by trigger events
  { type = "collision-layer", order = "21", name = "cliff" }, -- certain object-layer decoratives should collide with cliffs

  { type = "collision-layer", name = "is_lower_object" },
  { type = "collision-layer", name = "is_object" },
})

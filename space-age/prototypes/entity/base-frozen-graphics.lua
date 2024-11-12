local function frozen_pipe_cover_pictures()
  return
  {
    north =
    {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-north.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    east =
    {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-east.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    south =
    {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-south.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    },
    west =
    {
      filename = "__space-age__/graphics/entity/frozen/pipe-covers/pipe-cover-west.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5
    }
  }
end
for _, prototype in pairs({
  data.raw["assembling-machine"]["assembling-machine-1"],
  data.raw["assembling-machine"]["assembling-machine-2"],
  data.raw["assembling-machine"]["assembling-machine-3"],
  data.raw["assembling-machine"]["chemical-plant"],
  data.raw["assembling-machine"]["oil-refinery"],
  data.raw["generator"]["steam-engine"],
  data.raw["mining-drill"]["electric-mining-drill"],
  data.raw["mining-drill"]["pumpjack"],
  data.raw["pipe"]["pipe"],
  data.raw["pipe-to-ground"]["pipe-to-ground"],
  data.raw["pump"]["pump"],
  data.raw["storage-tank"]["storage-tank"]
}) do
  local fluid_boxes = prototype.fluid_boxes or {prototype.fluid_box}
  for _, fluid_box in pairs(fluid_boxes) do
    if type(fluid_box) == "table" and fluid_box.pipe_covers and fluid_box.pipe_covers.north
      and fluid_box.pipe_covers.north.layers and fluid_box.pipe_covers.north.layers[1]
      and fluid_box.pipe_covers.north.layers[1].filename == "__base__/graphics/entity/pipe-covers/pipe-cover-north.png" then
        fluid_box.pipe_covers_frozen = frozen_pipe_cover_pictures()
    end
  end
end

local function assemblerpipepicturesfrozen()
  return
  {
    north =
    {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-N-frozen.png",
      priority = "extra-high",
      width = 71,
      height = 38,
      shift = util.by_pixel(2.25, 13.5),
      scale = 0.5
    },
    east =
    {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-E-frozen.png",
      priority = "extra-high",
      width = 42,
      height = 76,
      shift = util.by_pixel(-24.5, 1),
      scale = 0.5
    },
    south =
    {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-S-frozen.png",
      priority = "extra-high",
      width = 88,
      height = 61,
      shift = util.by_pixel(0, -31.25),
      scale = 0.5
    },
    west =
    {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-W-frozen.png",
      priority = "extra-high",
      width = 39,
      height = 73,
      shift = util.by_pixel(25.75, 1.25),
      scale = 0.5
    }
  }
end

data.raw["assembling-machine"]["assembling-machine-1"].graphics_set.reset_animation_when_frozen = true
data.raw["assembling-machine"]["assembling-machine-1"].graphics_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-1-frozen.png",
  priority = "high",
  width = 214,
  height = 226,
  shift = util.by_pixel(0, 2),
  scale = 0.5
}
data.raw["assembling-machine"]["assembling-machine-2"].graphics_set.reset_animation_when_frozen = true
data.raw["assembling-machine"]["assembling-machine-2"].graphics_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-2-frozen.png",
  priority = "high",
  width = 214,
  height = 218,
  shift = util.by_pixel(0, 4),
  scale = 0.5
}
for key, fluid_box in pairs(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes) do
  if type(fluid_box) == "table" then
    fluid_box.pipe_picture_frozen = assemblerpipepicturesfrozen()
  end
end
data.raw["assembling-machine"]["assembling-machine-3"].graphics_set.reset_animation_when_frozen = true
data.raw["assembling-machine"]["assembling-machine-3"].graphics_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-3-frozen.png",
  priority = "high",
  width = 214,
  height = 237,
  shift = util.by_pixel(0, -0.75),
  scale = 0.5
}
for key, fluid_box in pairs(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes) do
  if type(fluid_box) == "table" then
    fluid_box.pipe_picture_frozen = assemblerpipepicturesfrozen()
  end
end


data.raw["assembling-machine"]["chemical-plant"].graphics_set.frozen_patch =
{
  north =
  {
    filename = "__space-age__/graphics/entity/frozen/chemical-plant/chemical-plant-frozen.png",
    priority = "high",
    width = 220,
    height = 292,
    shift = util.by_pixel(0.5, -9),
    scale = 0.5
  },
  east =
  {
    filename = "__space-age__/graphics/entity/frozen/chemical-plant/chemical-plant-frozen.png",
    priority = "high",
    x = 220,
    width = 220,
    height = 292,
    shift = util.by_pixel(0.5, -9),
    scale = 0.5
  },
  south =
  {
    filename = "__space-age__/graphics/entity/frozen/chemical-plant/chemical-plant-frozen.png",
    priority = "high",
    x = 220 * 2,
    width = 220,
    height = 292,
    shift = util.by_pixel(0.5, -9),
    scale = 0.5
  },
  west =
  {
    filename = "__space-age__/graphics/entity/frozen/chemical-plant/chemical-plant-frozen.png",
    priority = "high",
    x = 220 * 3,
    width = 220,
    height = 292,
    shift = util.by_pixel(0.5, -9),
    scale = 0.5
  }
}

data.raw["assembling-machine"]["oil-refinery"].graphics_set.frozen_patch =
{
  north =
  {
    filename = "__space-age__/graphics/entity/frozen/oil-refinery/oil-refinery.png",
    priority = "high",
    width = 386,
    height = 430,
    shift = util.by_pixel(0, -7.5),
    scale = 0.5
  },
  east =
  {
    filename = "__space-age__/graphics/entity/frozen/oil-refinery/oil-refinery.png",
    priority = "high",
    width = 386,
    x = 386,
    height = 430,
    shift = util.by_pixel(0, -7.5),
    scale = 0.5
  },
  south =
  {
    filename = "__space-age__/graphics/entity/frozen/oil-refinery/oil-refinery.png",
    priority = "high",
    width = 386,
    x = 386 * 2,
    height = 430,
    shift = util.by_pixel(0, -7.5),
    scale = 0.5
  },
  west =
  {
    filename = "__space-age__/graphics/entity/frozen/oil-refinery/oil-refinery.png",
    priority = "high",
    width = 386,
    x = 386 * 3,
    height = 430,
    shift = util.by_pixel(0, -7.5),
    scale = 0.5
  }
}

data.raw["assembling-machine"]["centrifuge"].graphics_set.reset_animation_when_frozen = true
data.raw["assembling-machine"]["centrifuge"].graphics_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/centrifuge/centrifuge-frozen.png",
  priority = "high",
  width = 256,
  height = 320,
  shift = util.by_pixel(0, -16),
  scale = 0.5
}

data.raw["furnace"]["electric-furnace"].graphics_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/electric-furnace/electric-furnace.png",
  width = 239,
  height = 219,
  shift = util.by_pixel(0.75, 5.75),
  scale = 0.5
}

data.raw["beacon"]["beacon"].graphics_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/beacon/beacon-frozen.png",
  width = 212,
  height = 192,
  scale = 0.5,
  shift = util.by_pixel(0.5, 1)
}
data.raw["lab"]["lab"].frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/lab/lab.png",
  width = 194,
  height = 174,
  shift = util.by_pixel(0, 1.5),
  scale = 0.5
}

for _, inserter in pairs(data.raw.inserter) do
  if inserter.platform_frozen == nil then
    inserter.platform_frozen =
    {
      sheet =
      {
        filename = "__space-age__/graphics/entity/frozen/inserter/inserter-platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        shift = util.by_pixel(1.5, 7.5-1),
        scale = 0.5
      }
    }
    inserter.hand_base_frozen =
    {
      filename = "__space-age__/graphics/entity/frozen/inserter/inserter-hand.png",
      priority = "extra-high",
      x = 130 * 4,
      width = 130,
      height = 136,
      scale = 0.25
    }
    local hand_x = 0
    if inserter.name ~= "bulk-inserter" then
      hand_x = 130 * 2
    end
    inserter.hand_closed_frozen =
    {
      filename = "__space-age__/graphics/entity/frozen/inserter/inserter-hand.png",
      priority = "extra-high",
      x = hand_x + 130,
      width = 130,
      height = 164,
      scale = 0.25
    }
    inserter.hand_open_frozen =
    {
      filename = "__space-age__/graphics/entity/frozen/inserter/inserter-hand.png",
      priority = "extra-high",
      x = hand_x,
      width = 130,
      height = 164,
      scale = 0.25
    }
  end
end

data.raw["mining-drill"]["pumpjack"].graphics_set.frozen_patch =
{
  sheet =
  {
    filename = "__space-age__/graphics/entity/frozen/pumpjack/pumpjack.png",
    priority = "extra-high",
    width = 256,
    height = 256,
    scale = 0.5
  }
}

local pipe_pictures = data.raw["pipe"]["pipe"].pictures
for _, property in pairs({"straight_vertical_single", "straight_vertical", "straight_vertical_window", "straight_horizontal",
  "straight_horizontal_window", "corner_up_right", "corner_up_left", "corner_down_right", "corner_down_left", "t_up", "t_down",
  "t_right", "t_left", "cross", "ending_up", "ending_down", "ending_right", "ending_left"}) do
    local frozen_property = property .. "_frozen"
    pipe_pictures[frozen_property] = table.deepcopy(pipe_pictures[property])
    pipe_pictures[frozen_property].filename = util.string_replace(pipe_pictures[frozen_property].filename,
                                                                  "__base__/graphics/entity/pipe",
                                                                  "__space-age__/graphics/entity/frozen/pipe")
end

local ptg = data.raw["pipe-to-ground"]["pipe-to-ground"]
ptg.frozen_patch = table.deepcopy(ptg.pictures)
for _, property in pairs({"north", "south", "west", "east"}) do
  ptg.frozen_patch[property].filename = util.string_replace(ptg.frozen_patch[property].filename,
                                                            "__base__/graphics/entity/pipe-to-ground",
                                                            "__space-age__/graphics/entity/frozen/pipe-to-ground")
end

data.raw["pump"]["pump"].frozen_patch =
{
  north =
  {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    width = 128,
    height = 192,
    scale = 0.5
  },
  east =
  {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    x = 128,
    width = 128,
    height = 128,
    scale = 0.5
  },
  south =
  {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    x = 128 * 2,
    width = 128,
    height = 192,
    scale = 0.5
  },
  west =
  {
    filename = "__space-age__/graphics/entity/frozen/pump/pump.png",
    priority = "extra-high",
    x = 128 * 3,
    width = 128,
    height = 128,
    scale = 0.5
  }
}

data.raw["radar"]["radar"].frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/radar/radar.png",
  width = 196,
  height = 254,
  shift = util.by_pixel(1, -16),
  scale = 0.5,
  direction_count = 1
}
data.raw["radar"]["radar"].reset_orientation_when_frozen = true

data.raw["roboport"]["roboport"].frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/roboport/roboport-base.png",
  width = 228,
  height = 277,
  shift = util.by_pixel(2, -2.25),
  scale = 0.5
}

data.raw["rocket-silo"]["rocket-silo"].hole_frozen =
{
  filename = "__space-age__/graphics/entity/frozen/rocket-silo/01-rocket-silo-hole-frozen.png",
  width = 400,
  height = 270,
  shift = util.by_pixel(-5, 16),
  scale = 0.5
}
data.raw["rocket-silo"]["rocket-silo"].base_frozen =
{
  filename = "__space-age__/graphics/entity/frozen/rocket-silo/06-rocket-silo-frozen.png",
  width = 608,
  height = 596,
  shift = util.by_pixel(3, -1),
  scale = 0.5
}
data.raw["rocket-silo"]["rocket-silo"].door_back_frozen =
{
  filename = "__space-age__/graphics/entity/frozen/rocket-silo/04-door-back-frozen.png",
  width = 312,
  height = 286,
  shift = util.by_pixel(37, 12),
  scale = 0.5
}
data.raw["rocket-silo"]["rocket-silo"].door_front_frozen =
{
  filename = "__space-age__/graphics/entity/frozen/rocket-silo/05-door-front-frozen.png",
  width = 332,
  height = 300,
  shift = util.by_pixel(-28, 33),
  scale = 0.5
}
data.raw["rocket-silo"]["rocket-silo"].base_front_frozen =
{
  filename = "__space-age__/graphics/entity/frozen/rocket-silo/14-rocket-silo-front-frozen.png",
  width = 580,
  height = 262,
  shift = util.by_pixel(-1, 78),
  scale = 0.5
}

data.raw["storage-tank"]["storage-tank"].pictures.frozen_patch =
{
  sheets =
  {
    {
      filename = "__space-age__/graphics/entity/frozen/storage-tank/storage-tank.png",
      priority = "extra-high",
      frames = 2,
      width = 219,
      height = 215,
      shift = util.by_pixel(-0.25, 3.75),
      scale = 0.5
    }
  }
}

data.raw["transport-belt"]["transport-belt"].belt_animation_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/transport-belt/transport-belt.png",
  priority = "extra-high",
  size = 128,
  scale = 0.5,
  line_length = 1,
  direction_count = 20
}
data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/fast-transport-belt/fast-transport-belt.png",
  priority = "extra-high",
  size = 128,
  scale = 0.5,
  line_length = 1,
  direction_count = 20
}
data.raw["transport-belt"]["express-transport-belt"].belt_animation_set.frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/express-transport-belt/express-transport-belt.png",
  priority = "extra-high",
  size = 128,
  scale = 0.5,
  line_length = 1,
  direction_count = 20
}

for _, ug in pairs(
{
  data.raw["underground-belt"]["underground-belt"],
  data.raw["underground-belt"]["fast-underground-belt"],
  data.raw["underground-belt"]["express-underground-belt"]
}) do
  ug.structure.frozen_patch_in =
  {
    sheet =
    {
      filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
      priority = "extra-high",
      width = 192,
      height = 192,
      y = 192,
      scale = 0.5
    }
  }
  ug.structure.frozen_patch_out =
  {
    sheet =
    {
      filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
      priority = "extra-high",
      width = 192,
      height = 192,
      scale = 0.5
    }
  }
end

for _, splitter in pairs(
{
  data.raw["splitter"]["splitter"],
  data.raw["splitter"]["fast-splitter"],
  data.raw["splitter"]["express-splitter"]
}) do
  splitter.frozen_patch =
  {
    north =
    {
      filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
      priority = "extra-high",
      width = 192,
      height = 128,
      scale = 0.5
    },
    east =
    {
      filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
      priority = "extra-high",
      x = 192,
      width = 128,
      height = 192,
      scale = 0.5
    },
    south =
    {
      filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
      priority = "extra-high",
      x = 192 + 128,
      width = 192,
      height = 128,
      scale = 0.5
    },
    west =
    {
      filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
      priority = "extra-high",
      x = 192 * 2 + 128,
      width = 128,
      height = 192,
      scale = 0.5
    }
  }
end

data.raw["arithmetic-combinator"]["arithmetic-combinator"].frozen_patch =
{
  sheet = {
    scale = 0.5,
    filename = "__space-age__/graphics/entity/frozen/combinator/arithmetic-combinator-frozen.png",
    width = 144,
    height = 124,
    shift = util.by_pixel(0.5, 7.5)
  }
}
data.raw["decider-combinator"]["decider-combinator"].frozen_patch =
{
  sheet = {
    scale = 0.5,
    filename = "__space-age__/graphics/entity/frozen/combinator/decider-combinator-frozen.png",
    width = 156,
    height = 132,
    shift = util.by_pixel(0.5, 7.5)
  }
}
data.raw["selector-combinator"]["selector-combinator"].frozen_patch =
{
  sheet = {
    scale = 0.5,
    filename = "__space-age__/graphics/entity/frozen/combinator/selector-combinator-frozen.png",
    width = 154,
    height = 160,
    shift = util.by_pixel( 1.0, -1.0)
  }
}

data.raw["power-switch"]["power-switch"].frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/power-switch/power-switch.png",
  width = 168,
  height = 138,
  shift = util.by_pixel(-3, 2),
  scale = 0.5
}

data.raw.generator["steam-turbine"].horizontal_frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/steam-turbine/steam-turbine-H.png",
  width = 320,
  height = 245,
  shift = util.by_pixel(0, -2.75),
  scale = 0.5
}
data.raw.generator["steam-turbine"].vertical_frozen_patch =
{
  filename = "__space-age__/graphics/entity/frozen/steam-turbine/steam-turbine-V.png",
  width = 217,
  height = 347,
  shift = util.by_pixel(4.75, 6.75),
  scale = 0.5
}
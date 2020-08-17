data:extend(
{
  {
    type = "item-subgroup",
    name = "crash-site",
    group = "production",
    order = "x"
  }
})
data:extend(
{
  {
    type = "item",
    name = "crash-site-lab-broken",
    icon = "__base__/graphics/icons/crash-site-lab-broken.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-lab-broken]",
    place_result = "crash-site-lab-broken",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-lab-repaired",
    icon = "__base__/graphics/icons/crash-site-lab-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-lab-repaired]",
    place_result = "crash-site-lab-repaired",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-assembling-machine-1-broken",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-1-broken.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-assembling-machine-1-broken]",
    place_result = "crash-site-assembling-machine-1-broken",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-assembling-machine-1-repaired",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-1-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-assembling-machine-1-repaired]",
    place_result = "crash-site-assembling-machine-1-repaired",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-assembling-machine-2-broken",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-2-broken.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-assembling-machine-2-broken]",
    place_result = "crash-site-assembling-machine-2-broken",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-assembling-machine-2-repaired",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-2-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-assembling-machine-2-repaired]",
    place_result = "crash-site-assembling-machine-2-repaired",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-electric-pole",
    icon = "__base__/graphics/icons/crash-site-electric-pole.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-electric-pole]",
    place_result = "crash-site-electric-pole",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-generator",
    icon = "__base__/graphics/icons/crash-site-generator.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-generator]",
    place_result = "crash-site-generator",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-chest-1",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-chest]",
    place_result = "crash-site-chest-1",
    stack_size = 1,
    flags = {"hidden"}
  },
  {
    type = "item",
    name = "crash-site-chest-2",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "x[crash-site-chest]",
    place_result = "crash-site-chest-2",
    stack_size = 1,
    flags = {"hidden"}
  }
})

local big_wreck_item = function(n)
  return
  {
    type = "item",
    name = "crash-site-spaceship-wreck-big-"..n,
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-big-"..n..".png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "z[crash-site-spaceship]-b",
    place_result = "crash-site-spaceship-wreck-big-"..n,
    stack_size = 1,
    flags = {"hidden"}
  }
end

local medium_wreck_item = function(n)
  return
  {
    type = "item",
    name = "crash-site-spaceship-wreck-medium-"..n,
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-"..n..".png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "z[crash-site-spaceship]-c",
    place_result = "crash-site-spaceship-wreck-medium-"..n,
    stack_size = 1,
    flags = {"hidden"}
  }
end

local small_wreck_item = function(n)
  return
  {
    type = "item",
    name = "crash-site-spaceship-wreck-small-"..n,
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-"..n..".png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "crash-site",
    order = "z[crash-site-spaceship]-d",
    place_result = "crash-site-spaceship-wreck-small-"..n,
    stack_size = 1,
    flags = {"hidden"}
  }
end
data:extend(
{
  {
    type = "burner-usage",
    name = "food",
    empty_slot_sprite =
    {
      filename = "__core__/graphics/icons/mip/empty-food-slot.png",
      priority = "extra-high-no-scale",
      size = 64,
      mipmap_count = 2,
      flags = {"gui-icon"},
    },
    empty_slot_caption = {"gui.food"},
    empty_slot_description = {"gui.food-description"},

    icon =
    {
      filename = "__core__/graphics/icons/alerts/food-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_fuel_status = {"entity-status.no-food"},

    accepted_fuel_key = "description.accepted-food",
    burned_in_key = "digested-by", -- factoriopedia
  },
  {
    type = "burner-usage",
    name = "nutrients",
    empty_slot_sprite =
    {
      filename = "__core__/graphics/icons/mip/empty-nutrients-slot.png",
      priority = "extra-high-no-scale",
      size = 64,
      mipmap_count = 2,
      flags = {"gui-icon"},
    },
    empty_slot_caption = {"gui.nutrients"},
    empty_slot_description = {"gui.nutrients-description"},

    icon =
    {
      filename = "__core__/graphics/icons/alerts/nutrients-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_fuel_status = {"entity-status.no-nutrients"},

    accepted_fuel_key = "description.accepted-nutrients",
    burned_in_key = "eaten-by", -- factoriopedia
  }
})

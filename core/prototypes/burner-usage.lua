data:extend(
{
  {
    type = "burner-usage",
    name = "fuel",
    empty_slot_sprite =
    {
      filename = "__core__/graphics/icons/mip/empty-fuel-slot.png",
      priority = "extra-high-no-scale",
      size = 64,
      mipmap_count = 2,
      flags = {"gui-icon"},
    },
    empty_slot_caption = {"gui.fuel"},
    empty_slot_description = {"gui.fuel-description"},

    icon =
    {
      filename = "__core__/graphics/icons/alerts/fuel-icon-red.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      flags = {"icon"}
    },
    no_fuel_status = {"entity-status.no-fuel"},

    accepted_fuel_key = "description.accepted-fuel",
    burned_in_key = "burned-in", -- factoriopedia
  }
})

local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

data:extend(
{
  {
    type = "procession-layer-inheritance-group",
    name = "procession-stars-bg",
    intermezzo_application = { offset = true, rotation = false },
    arrival_application = { offset = true, pod_offset = true, rotation = false }
  }
})

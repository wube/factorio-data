local procession_style = require("__base__/prototypes/planet/procession-style")
local procession_graphic_catalogue = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local pod_layers =
{
  {
    type = "pod-movement",
    frames =
    {
      { timestamp = 0 , tilt = 0.125, tilt_t = 0, offset  = {0, 0} }
    }
  },
  {
    type = "pod-distance-traveled",
    frames =
    {
      { timestamp = 0 , distance = 0.0 },
      { timestamp = 50, distance = 512.0/20.0 },
    }
  },
  {
    type = "pod-opacity",
    lut = "__core__/graphics/color_luts/lut-day.png",
    frames = {{ timestamp = 0, cutscene_opacity = 1, outside_opacity = 0, lut_blend = 1, environment_volume = 0, environment_muffle_intensity = 1}}
  },
}
return pod_layers

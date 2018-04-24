local M = {}

-- Add a list of autoplace peaks based on rectangles to the table ret.
-- Rectangles is a table of rectangle specifications:
--  {{max_temp, max_water}, {min_temp, min_water}, influence}
-- temperatures range from 35 to -25 (°C), water from 0 to 1.
-- the peak resulting from each rectangle has a preset influence 
-- within the rectangle and goes to zero after 5°C or 0.1 water level outside
-- of the rectangle.
-- Influence is optional and has default value of default_influence or 1.
function M.peaks(rectangles, ret, default_influence)
  if rectangles == nil or #rectangles == 0 then
    return
  end

  for i, rect in ipairs(rectangles) do
    local temp_center = (rect[2][1] + rect[1][1]) / 2
    local temp_range = math.abs(rect[2][1] - rect[1][1]) / 2
    local water_center = (rect[2][2] + rect[1][2]) / 2
    local water_range = math.abs(rect[2][2] - rect[1][2]) / 2
    ret[#ret + 1] =
    {
      influence = rect[3] or default_influence or 1,
      min_influence = 0,
      temperature_optimal = temp_center,
      temperature_range = temp_range,
      temperature_max_range = temp_range + 5,
      water_optimal = water_center,
      water_range = water_range,
      water_max_range = water_range + 0.1,
    }
  end

  return ret
end

return M

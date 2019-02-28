local rectangle_logging_enabled = false

local function log_rectangle(name, ranges)
  if not rectangle_logging_enabled then
    return
  end
  local parts = ""
  for k,v in pairs(ranges) do
    parts = parts .. " " .. k .. ":" .. v.min .. ".." .. v.max
  end
  log("Biome rectangle: "..name..parts)
end

return {
  rectangle_logging_enabled = rectangle_logging_enabled,
  log_rectangle = log_rectangle
}

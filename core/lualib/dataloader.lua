local data_duplicate_checker = require("data-duplicate-checker")

-- all the prototypes will be collected here
data = {}
-- raw data
data.raw = {}
-- this will be overwritten in the c++ based on whether we are in demo or not
-- careful: using this flag to change the number prototypes that are created will make saves not load between demo/retail
data.is_demo = false
local table_string = "table"

function data.extend(self, otherdata)
  -- if somebody calls data.extend{protoarray}, shift the arg over, so data.extend and data:extend are equivalent
  if self ~= data and otherdata == nil then
    otherdata = self
  end
  if type(otherdata) ~= table_string then
    error("Invalid array of prototypes:\n\n" .. serpent.block(otherdata, {maxlevel= 1}))
  elseif #otherdata == 0  then
    if otherdata.type or otherdata.name then
      error("Expected array of prototypes, but got a single prototype:\n\n" .. serpent.block(otherdata, {maxlevel= 1}))
    end
    error("Invalid array of prototypes:\n\n" .. serpent.block(otherdata, {maxlevel= 1}))
  end

  for _, e in ipairs(otherdata) do

    if not e.type then
      error("Missing type in the following prototype definition:\n" .. serpent.block(e))
    end

    if not e.name then
      error("Missing name in the following prototype definition:\n" .. serpent.block(e))
    end

    local t = data.raw[e.type]
    if t == nil then
      t = {}
      data.raw[e.type] = t
    end

    data_duplicate_checker.check_for_duplicates(t, e)
    data_duplicate_checker.check_for_overwrites(t, e)
    t[e.name] = e
  end
end

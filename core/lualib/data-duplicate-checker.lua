local CHECK_DUPLICATES = false
local CHECK_NAME_OVERWRITE = false
local error_type
local error_names = {}
local CHECK_OVERWRITES = false
local table_string = "table"

local data_duplicate_checker = {}

local check_for_duplicates = function(prototypes, overwrite)
  if not CHECK_DUPLICATES then return end
  if error_type and error_type ~= overwrite.type then
    error("Duplicate prototypes of ".. error_type .. serpent.block(error_names))
  end

  local existing = prototypes[overwrite.name]
  if not existing then return end
  if not CHECK_NAME_OVERWRITE then
    if not table.compare(existing, overwrite) then return end
  end

  if not error_type then
    error_type = overwrite.type
  end

  table.insert(error_names, overwrite.name)

  --error("Duplicate prototype: " .. serpent.block
  --{
  --  name = overwrite.name,
  --  type = overwrite.type
  --})

end

local is_same = function(a, b)
  if type(a) ~= type(b) then
    return false
  end
  if type(a) == "table" then
    return table.compare(a, b)
  end
  return a == b
end

local COUNT_DIFFERENCE_THRESHOLD = 1
local CHANGED_DATA_THRESHOLD = 0.5
local is_table_overwrite_substantial = function(old, new)
  local old_count = table_size(old)
  local new_count = table_size(new)

  if math.abs(old_count - new_count) >= COUNT_DIFFERENCE_THRESHOLD then
    return true
  end

  local changed_count = 0
  for k, v in pairs(new) do
    if not is_same(v, old[k]) then
      changed_count = changed_count + 1
    end
  end

  return (changed_count / old_count) >= CHANGED_DATA_THRESHOLD
end

local recursive_check_diff
recursive_check_diff = function(existing, overwrite, diffs, path)
  for k, v in pairs(overwrite) do
    table.insert(path, k)
    local current = existing[k]
    if type(v) == table_string then
      if not current or is_table_overwrite_substantial(current, v) then
        table.insert(diffs, {path = util.copy(path), new_value = v})
      else
        recursive_check_diff(current, v, diffs, path)
      end
    else
      if current ~= v then
        table.insert(diffs, {path = util.copy(path), new_value = v, old_value = current})
      end
    end
    table.remove(path, #path)
  end
end

local unwind_path = function(path)
  local string = ""
  for k, v in pairs (path) do
    local v_string = tostring(v)
    if tonumber(v) then
      v_string = "["..v_string.."]"
    elseif v_string:find("%-") then
      v_string = "[\""..v_string.."\"]"
    elseif string == "" then
      v_string = v_string
    else
      v_string = "."..v_string
    end
    string = string..v_string
  end
  return string
end

local output_value = function(value)

  if value == nil then
    return "nil"
  end

  if value == true then
    return "true"
  end

  if value == false then
    return "false"
  end

  if type(value) == table_string then
    return serpent.block(value)
  end

  if tonumber(value) then
    return value
  end

  return "\""..value.."\""
end

local output_diffs = function(diffs)
  local diff_string = ""
  for k, diff in pairs(diffs) do
    diff_string = diff_string.."\n"..unwind_path(diff.path).." = " .. output_value(diff.new_value)
  end
  log("\n\nDiffs: "..diff_string.."\n\n")
  error("Diffs: "..diff_string)
end

local check_for_overwrites = function(prototypes, overwrite)
  if not CHECK_OVERWRITES then return end

  local existing = prototypes[overwrite.name]
  if not existing then return end

  if table.compare(existing, overwrite) then error("These two prototypes are exactly the same, so you can just remove the overwrite".. serpent.block{name = existing.name}) end

  local diffs = {}
  local path = {"data", "raw", overwrite.type, overwrite.name}
  recursive_check_diff(existing, overwrite, diffs, path)


  --error("These two prototypes are different, so you can just add the overwrite".. serpent.block{name = existing.name, type = existing.type, diffs = diffs})

  output_diffs(diffs)

end

data_duplicate_checker.check_for_duplicates = check_for_duplicates
data_duplicate_checker.check_for_overwrites = check_for_overwrites

return data_duplicate_checker

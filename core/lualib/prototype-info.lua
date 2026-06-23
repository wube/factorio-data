local hierarchy = require("prototype-hierarchy")

local info = {}

local function add_recursive(base_type, current_type, data)
  local current = {}
  info[current_type] = current
  current.base_type = base_type
  current.children = {}
  current.types = {}
  for k,v in pairs(data) do
    if k == '_abstract' then
      current.abstract = v
    else
      local child = add_recursive(base_type, k, v)
      child.parent = current_type
      table.insert(current.children, k)
      for _, child_derived in pairs(child.types) do
        table.insert(current.types, child_derived)
      end
    end
  end
  if not current.abstract then
    table.insert(current.types, current_type)
  end
  return current
end

for base_type,data in pairs(hierarchy) do
  add_recursive(base_type, base_type, data)
end

-- quick self check
for base_type, prototypes in pairs(defines.prototypes) do
  for prototype_type in pairs(prototypes) do
    assert(info[prototype_type])
    assert(not info[prototype_type].abstract)
    assert(info[prototype_type].base_type == base_type)
  end
end

return info

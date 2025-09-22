local util = require("util")
local meld = {}

meld.control_marker = {} -- empty but unique table used as a marker
meld.control_handlers = {}

meld.delete = function()
  return { marker = meld.control_marker, op = "delete"}
end
meld.control_handlers.delete = function(target, k, v)
  target[k] = nil
end

meld.overwrite = function(new)
  return { marker = meld.control_marker, op = "overwrite", data = new }
end
meld.control_handlers.overwrite = function(target, k, v)
  target[k] = util.copy(v.data)
end

meld.invoke = function(fct)
  return { marker = meld.control_marker, op = "invoke", fct = fct }
end
meld.control_handlers.invoke = function(target, k, v)
  target[k] = v.fct(target[k])
end

meld.append = function(data)
  return { marker = meld.control_marker, op = "append", data = data }
end
meld.control_handlers.append = function(target, k, v)
  target[k] = target[k] or {}
  for _, to_append in pairs(v.data) do
    table.insert(target[k], util.copy(to_append))
  end
end

-- recursive table merge but it reuses target table (does not deepcopy it). When target is not to be reused or more than
--  2 tables are to be merged, consider using util.merge. When there is conflict of 2 values, a value from the source will
--  win overwriting the existing value. There are also control structures available for extra operations that would not
--  be possible under normal merge rules
meld.meld = function(target, source)
  for k,v in pairs(source) do
    if type(v) ~= "table" then
      target[k] = v
    elseif v.marker == meld.control_marker then
      meld.control_handlers[v.op](target, k, v)
    elseif target[k] and type(target[k]) == "table" then
      meld.meld(target[k], v)
    else
      target[k] = util.copy(v)
    end
  end
  return target
end

meld.__call = function(self, target, source)
  return meld.meld(target, source)
end
setmetatable(meld, meld)

return meld

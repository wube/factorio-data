
-- all the prototypes will be collected here
data = {}
-- raw data
data.raw = {}
-- this will be overwritten in the c++ based on whether we are in demo or not
data.is_demo = false

function data.extend(self, otherdata)
  for _, e in ipairs(otherdata) do
    if not e.type or not e.name then
      error("Missing name or type in the following prototype definition " .. serpent.block(e))
    end
    local t = self.raw[e.type]
    if t == nil then
      t = {}
      self.raw[e.type] = t
    end
    t[e.name] = e
  end
end

function data.clear(self)
  for k, v in pairs(self.raw) do
    self.raw[k] = nil
  end
end

function compare()
  local entries = {}
  local raw1 = data.raw
  local raw2 = data.rawafter
  if type(raw1) ~= "table" then error("data.raw is not a table.") end
  if type(raw2) ~= "table" then error("data.rawafter is not a table.") end
  
  for _, t in pairs({raw1, raw2}) do
    for entrytype, entrynames in pairs(t) do
      if entries[entrytype] == nil then
        entries[entrytype] = {}
      end
      for name in pairs(entrynames) do
        entries[entrytype][name] = {["name"] = name}
      end
    end
  end
  
  for entrytype, entrynames in pairs(entries) do
    if raw1[entrytype] ~= nil and raw2[entrytype] ~= nil then
      for name in pairs(entrynames) do
        if raw1[entrytype][name] ~= nil and raw2[entrytype][name] ~= nil
        and type(raw1[entrytype][name]) == "table" and type(raw2[entrytype][name]) == "table" then
          if tcompare(raw1[entrytype][name], raw2[entrytype][name]) then
            entrynames[name] = nil
          end
        end
      end
      if not (entrynames and next(entrynames) ~= nil) then
        entries[entrytype] = nil
      end
    end
  end
  
  if next(entries) == nil then
    data.differences = nil
  else
    data.differences = entries
    data.raw = data.rawafter
  end
  data.rawafter = nil
end

function tcompare(table1, table2)
  local a,b,c,d,t
  for z=0,-1,0 do
    a,b = next(table1,a)
    c,d = next(table2,c)
    if a == nil then return c == nil end
    t = type(b)
    if t ~= type(d) then
      return false
    elseif t == "table" then
      if not tcompare(b,d) then return false end
    elseif b ~= d then
      return false
    end
  end
end

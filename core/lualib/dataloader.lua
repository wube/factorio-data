
-- all the prototypes will be collected here
data = {}
-- raw data
data.raw = {}
-- this will be overwritten in the c++ based on whether we are in demo or not
data.is_demo = false
local table_string = "table"
local name_string = "name"

function data.extend(self, otherdata)
  if type(otherdata) ~= table_string or #otherdata == 0 then
    error("Invalid prototype array " .. serpent.block(otherdata, {maxlevel= 1}))
  end
  
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
  if type(raw1) ~= table_string then error("data.raw is not a table.") end
  if type(raw2) ~= table_string then error("data.rawafter is not a table.") end
  
  for _, t in pairs({raw1, raw2}) do
    for entrytype, entrynames in pairs(t) do
      local entries_index = entries[entrytype]
      if entries_index == nil then
        entries[entrytype] = {}
        entries_index = entries[entrytype]
      end
      
      for name in pairs(entrynames) do
        entries_index[name] = {[name_string] = name}
      end
    end
  end
  
  local entries_to_erase = {}
  
  for entrytype, entrynames in pairs(entries) do
    local raw1_entrytype = raw1[entrytype]
    local raw2_entrytype = raw2[entrytype]
    
    if raw1_entrytype ~= nil and raw2_entrytype ~= nil then
      local entry_names_to_erase = {}
      
      for name in pairs(entrynames) do
        local raw1_entrytype_name = raw1_entrytype[name]
        local raw2_entrytype_name = raw2_entrytype[name]
        
        if raw1_entrytype_name ~= nil and raw2_entrytype_name ~= nil
        and type(raw1_entrytype_name) == table_string and type(raw2_entrytype_name) == table_string then
          if tcompare(raw1_entrytype_name, raw2_entrytype_name) then
            table.insert(entry_names_to_erase, name)
          end
        end
      end
      
      for _,name in pairs(entry_names_to_erase) do
        entrynames[name] = nil
      end
      
      if not (entrynames and next(entrynames) ~= nil) then
        table.insert(entries_to_erase, entrytype)
      end
    end
  end
  
  for _,entrytype in pairs(entries_to_erase) do
    entries[entrytype] = nil
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
    elseif t == table_string then
      if not tcompare(b,d) then return false end
    elseif b ~= d then
      return false
    end
  end
end

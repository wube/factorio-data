
-- all the prototypes will be collected here
data = {}
-- raw data
data.raw = {}

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


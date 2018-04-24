
module(..., package.seeall)

function distance(position1, position2)
  return ((position1.x - position2.x)^2 + (position1.y - position2.y)^2)^0.5
end

function findfirstentity(boundingbox, name)
  for _, entity in ipairs(game.find_entities(boundingbox)) do
    if entity.name == name then
      return entity
    end
  end
  return nil
end

function positiontostr(pos)
  return string.format("[%g, %g]", pos.x, pos.y)
end

function table.deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        -- don't copy factorio rich objects
        elseif object.__self then
          return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

function table.compare( tbl1, tbl2 )
    for k, v in pairs( tbl1 ) do
        if  type(v) == "table" and type(tbl2[k]) == "table" then
            if not table.compare( v, tbl2[k] )  then return false end
        else
            if ( v ~= tbl2[k] ) then return false end
        end
    end
    for k, v in pairs( tbl2 ) do
        if type(v) == "table" and type(tbl1[k]) == "table" then
            if not table.compare( v, tbl1[k] ) then return false end
        else 
            if v ~= tbl1[k] then return false end
        end
    end
    return true
end

function formattime(ticks)
  local seconds = ticks / 60
  local minutes = math.floor((seconds)/60)
  local seconds = math.floor(seconds - 60*minutes)
  return string.format("%d:%02d", minutes, seconds)
end


function moveposition(position, direction, distance)

  if direction == defines.direction.north then
    return {position[1], position[2] - distance}
  end

  if direction == defines.direction.south then
    return {position[1], position[2] + distance}
  end

  if direction == defines.direction.east then
    return {position[1] + distance, position[2]}
  end

  if direction == defines.direction.west then
    return {position[1] - distance, position[2]}
  end
end

function oppositedirection(direction)
  if direction == defines.direction.north then
    return defines.direction.south
  end

  if direction == defines.direction.south then
    return defines.direction.north
  end

  if direction == defines.direction.east then
    return defines.direction.west
  end

  if direction == defines.direction.west then
    return defines.direction.east
  end
end

function ismoduleavailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        return true
      end
    end
    return false
  end
end

function multiplystripes(count, stripes)
  ret = {}
  for k, stripe in ipairs(stripes) do
    for i = 1, count do
      ret[#ret + 1] = stripe
    end
  end
  return ret
end

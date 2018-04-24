local next_expression_number = 1;
local id_expression = function(expr)
  if (expr.type == "literal-number") then
    return "literal-number:" .. expr.literal_value
  elseif expr.type == "variable" then
    -- only valid as long as we're not allowing new variables in local scopes;
    -- if we do, the same name could mean different things at different
    -- points in the same procedure
    return "variable:" .. expr.variable_name
  else
    -- Would be better to use a hash but
    -- at least this will allow the compiler to identify
    -- explicitly duplicated expressions
    local id = "expr#" .. next_expression_number
    next_expression_number = next_expression_number + 1
    return id
  end
end

-- 'to noise expression'
-- adds a metatable so you can do arithmetic operations on noise expressions
local function tne(v)
  if type(v) == "number" then
    return tne{
      type = "literal-number",
      literal_value = v
    }
  elseif type(v) == "table" then
    local noise_expression_metatable = {
      __add = function(lhs, rhs)
        return tne{
          type = "function-application",
          function_name = "add",
          arguments = { tne(lhs), tne(rhs) }
        }
      end,
      __sub = function(lhs, rhs)
        return tne{
          type = "function-application",
          function_name = "subtract",
          arguments = { tne(lhs), tne(rhs) }
        }
      end,
      __mul = function(lhs, rhs)
        return tne{
          type = "function-application",
          function_name = "multiply",
          arguments = { tne(lhs), tne(rhs) }
        }
      end,
      __div = function(lhs, rhs)
        return tne{
          type = "function-application",
          function_name = "divide",
          arguments = { tne(lhs), tne(rhs) }
        }
      end,
      __pow = function(lhs, rhs)
        return tne{
          type = "function-application",
          function_name = "exponentiate",
          arguments = { tne(lhs), tne(rhs) }
        }
      end,
    }
    if v.type ~= nil then
      setmetatable(v, noise_expression_metatable)
      if v.expression_id == nil then
        v.expression_id = id_expression(v)
      end
      return v
    else
      error("Can't turn table without 'type' property into noise expression")
    end
  else
    error("Can't turn "..type(v).." into noise expression")
  end
end

local function nfvar(name)
  return tne{
    type = "variable",
    variable_name = name
  }
end

-- Call this to...define a noise function using lua syntax.
-- Your lua function will be passed x, y, tile properties, and map properties.
-- The arguments are 'noise expression' objects to which arithmetic operations may be applied.
local function define_noise_function( func )
  local x = nfvar("x")
  local y = nfvar("y")
  local tile_props = {
    distance = nfvar("distance"),
    tier = nfvar("tier")
  }
  local map_props = {
    seed = nfvar("map_seed"),
    width = nfvar("map_width"),
    height = nfvar("map_height"),
    starting_area_size = nfvar("starting_area_size"),
    segmentation_multiplier = nfvar("segmentation_multiplier"),
    terrace_elevation_offset = nfvar("terrace_elevation_offset"),
    terrace_elevation_interval = nfvar("terrace_elevation_interval"),
    water_level = nfvar("water_level"),
    finite_water_level = nfvar("finite_water_level"),
  }
  return tne(func(x,y,tile_props,map_props))
end

local function clamp(v, min, max)
  return tne{
    type = "function-application",
    function_name = "clamp",
    arguments = {
      tne(v),
      tne(min),
      tne(max)
    }
  }
end

local function max(a, b)
  return clamp(a, b, math.huge)
end

local function min(a, b)
  return clamp(a, -math.huge, b)
end

local function ridge(v, min, max)
  return tne{
    type = "function-application",
    function_name = "ridge",
    arguments = {
      tne(v),
      tne(min),
      tne(max)
    }
  }
end

local function terrace(v, offset, width, strength)
  return tne{
    type = "function-application",
    function_name = "terrace",
    arguments = {
      tne(v), tne(offset), tne(width), tne(strength)
    }
  }
end

-- Terrace at elevations at which the game will place cliffs
-- if change in elevation is steep enough.
-- strength = 0: no-op; strength = 1: vertical slopes between terrace elevations (definitely place cliffs)
local function terrace_for_cliffs(v, strength, map)
  return terrace(v, map.terrace_elevation_offset, map.terrace_elevation_interval, strength)
end

return {
  to_noise_expression = tne,
  define_noise_function = define_noise_function,
  clamp = clamp,
  min = min,
  max = max,
  ridge = ridge,
  terrace = terrace,
  terrace_for_cliffs = terrace_for_cliffs,
}

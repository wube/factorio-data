local tne

-- level is the number of levels up *from the caller*
-- we want to take our location from, defaulting to 1.
local function csloc(level)
  if level == nil then level = 0 end
  -- to debug.getinfo,
  --   1 = this very function (csloc)
  --   2 = the caller
  -- etc.
  -- we want our level = 0 to mean the caller of csloc,
  -- level = 1 to be the caller of that, etc.  So add 2.
  local info = debug.getinfo(level+2, "Sl")
  local filename
  if string.sub(info.source, 1, 1) == "@" then
    filename = string.sub(info.source, 2)
  else
    filename = "data:" .. info.source
  end
  return
  {
    filename = filename,
    line_number = info.currentline,
  }
end

local tne

local function fraction(num, den)
  if den == nil then den = 1 end
  return tne(num)/tne(den)
end

local function funcapp(name, arguments)
  local fixed_arguments = {}
  for k,v in pairs(arguments) do
    fixed_arguments[k] = tne(v)
  end
  return tne{
    type = "function-application",
    source_location = sloc or csloc(1),
    function_name = name,
    arguments = fixed_arguments
  }
end

local noise_expression_metatable =
{
  __add = function(lhs, rhs)
    return tne{
      type = "function-application",
      source_location = csloc(1),
      function_name = "add",
      arguments = { tne(lhs), tne(rhs) }
    }
  end,
  __sub = function(lhs, rhs)
    return tne{
      type = "function-application",
      source_location = csloc(1),
      function_name = "subtract",
      arguments = { tne(lhs), tne(rhs) }
    }
  end,
  __unm = function(val)
    return tne{
      type = "function-application",
      source_location = csloc(1),
      function_name = "subtract",
      arguments = { tne(0), tne(val) }
    }
  end,
  __mul = function(lhs, rhs)
    return tne{
      type = "function-application",
      source_location = csloc(1),
      function_name = "multiply",
      arguments = { tne(lhs), tne(rhs) }
    }
  end,
  __div = function(lhs, rhs)
    return tne{
      type = "function-application",
      source_location = csloc(1),
      function_name = "divide",
      arguments = { tne(lhs), tne(rhs) }
    }
  end,
  __pow = function(lhs, rhs)
    return tne{
      type = "function-application",
      source_location = csloc(1),
      function_name = "exponentiate",
      arguments = { tne(lhs), tne(rhs) }
    }
  end
  -- Missing: __lt, __le, __eq because Lua forces the return values to be boolean, so these cannot be implemented to return a noise expression.
  --   Use less_than(), less_or_equal(), equals() instead.
}

function fixne(v)
  if v.type == nil then
    error("Tried to create noise expression with no 'type'")
  end
  if v.source_location == nil then
    error("Noise expression has no 'source_location'")
  end

  setmetatable(v, noise_expression_metatable)
  -- if v.expression_id == nil then
  --   v.expression_id = id_expression(v)
  -- end
  return v
end

function log2(power)
  return funcapp("log2", { power })
end

local function fmod(lhs, rhs)
  return funcapp("modulo", { lhs, rhs })
end

local function floor(value)
  return funcapp("floor", { value })
end

local function ceil(value)
  return funcapp("ceil", { value })
end

local function band(...)
  return funcapp("bitwise-and", { ... })
end

local function bor(...)
  return funcapp("bitwise-or", { ... })
end

local function bxor(...)
  return funcapp("bitwise-xor", { ... })
end

local function bnot(value)
  return funcapp("bitwise-not", { value })
end

local function sin(value)
  return funcapp("sin", { value })
end

local function cos(value)
  return funcapp("cos", { value })
end

local function atan2(y, x)
  return funcapp("atan2", { y, x })
end

-- This results in a number that is '0' for 'false' or '1' for 'true'.
local function less_than(lhs, rhs)
  return funcapp("less-than", { lhs, rhs })
end

-- This results in a number that is '0' for 'false' or '1' for 'true'.
local function less_or_equal(lhs, rhs)
  return funcapp("less-or-equal", { lhs, rhs })
end

-- This results in a number that is '0' for 'false' or '1' for 'true'.
local function equals(lhs, rhs)
  return funcapp("equals", { lhs, rhs })
end

-- 'to noise expression'
-- turns simple values into noise expressions and
-- adds a metatable so you can do arithmetic operations on noise expressions
function tne(v, sloc)
  if type(v) == "number" then
    return fixne{
      type = "literal-number",
      source_location = sloc or csloc(1),
      literal_value = v
    }
  elseif type(v) == "boolean" then
    return fixne{
      type = "literal-boolean",
      source_location = sloc or csloc(1),
      literal_value = v
    }
  elseif type(v) == "string" then
    return tne{
      type = "literal-string",
      literal_value = v
    }
  elseif type(v) == "table" then
    if v.type == nil then
      error("Can't turn table without 'type' property into noise expression")
    end
    if v.source_location == nil then
      v.source_location = sloc or csloc(1)
    end
    return fixne(v)
  else
    error("Can't turn "..type(v).." into noise expression")
  end
end

local function nfvar(name, sloc)
  return tne{
    type = "variable",
    source_location = sloc or csloc(1),
    variable_name = name
  }
end

local function literal_object(obj, sloc)
  return tne{
    type = "literal-object",
    source_location = sloc or csloc(1),
    literal_value = obj
  }
end

local function literal_string(str, sloc)
  return tne{
    type = "literal-string",
    source_location = sloc or csloc(1),
    literal_value = str
  }
end

local function absolute_value(x)
  return funcapp("absolute-value", {x})
end

local function autoplace_probability(autoplace)
  return funcapp("autoplace-probability", { literal_object(autoplace) })
end

local function autoplace_richness(autoplace)
  return funcapp("autoplace-richness", { literal_object(autoplace) })
end

local function random_penalty(source, random_penalty_amplitude, opts)
  if opts == nil then opts = {} end
  if random_penalty_amplitude == nil then random_penalty_amplitude = 1 end
  return tne{
    type = "function-application",
    function_name = "random-penalty",
    arguments =
    {
      x = opts.x or nfvar("x"),
      y = opts.y or nfvar("y"),
      source = tne(source),
      amplitude = tne(random_penalty_amplitude)
    }
  }
end

local function random_between(lower, upper)
  return random_penalty(upper, upper-lower)
end

local function random(amplitude)
  return random_penalty(amplitude, amplitude)
end

-- Call this to...define a noise function using lua syntax.
-- Your lua function will be passed x, y, tile properties, and map properties.
-- The arguments are 'noise expression' objects to which arithmetic operations may be applied.
local function define_noise_function( func )
  local x = nfvar("x")
  local y = nfvar("y")
  local tile_props =
  {
    x = x,
    y = y,
    distance = nfvar("distance"),
    tier = nfvar("tier_from_start")
  }
  local map_props =
  {
    seed = nfvar("map_seed"),
    width = nfvar("map_width"),
    height = nfvar("map_height"),
    starting_area_radius = nfvar("starting_area_radius"),
    segmentation_multiplier = nfvar("segmentation_multiplier"),
    terrace_elevation_offset = nfvar("terrace_elevation_offset"),
    terrace_elevation_interval = nfvar("terrace_elevation_interval"),
    wlc_elevation_offset = nfvar("wlc_elevation_offset"), -- add this to your (presumably centered around 0) elevation to correct water coverage
    wlc_elevation_minimum = nfvar("wlc_elevation_minimum"), -- minimum elevation to be applied to areas outside the starting lake *after* the offset
    water_level = nfvar("water_level"),
    finite_water_level = nfvar("finite_water_level")
  }
  return tne(func(x,y,tile_props,map_props), csloc(0)) -- TODO: Pass in sloc of the function, if we know it
end

local function clamp(v, min, max, sloc)
  return funcapp(
    "clamp",
    {
      tne(v, sloc),
      tne(min, sloc),
      tne(max, sloc)
    },
    sloc
  )
end

local function reduce(reducer, list)
  local result = list[1]
  for i=2,#list do
    result = reducer(result, list[i])
  end
  return result
end

local function max(...)
  local sloc = csloc(1)
  return reduce(function(a,b)
    return clamp(a, b, math.huge, sloc)
  end, {...})
end

local function min(...)
  local sloc = csloc(1)
  return reduce(function(a,b)
    return clamp(a, -math.huge, b, sloc)
  end, {...})
end

local function ridge(v, min, max, sloc)
  return tne{
    type = "function-application",
    function_name = "ridge",
    source_location = sloc or csloc(1),
    arguments =
    {
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
    arguments =
    {
      tne(v), tne(offset), tne(width), tne(strength)
    }
  }
end

-- Terrace at elevations at which the game will place cliffs
-- if change in elevation is steep enough.
-- strength = 0: no-op; strength = 1: vertical slopes between terrace elevations
local function terrace_for_cliffs(v, strength, map)
  if strength == nil then
    strength = clamp(nfvar("cliffiness"), 0, 1)
  end
  return max(
    terrace(v, map.terrace_elevation_offset, map.terrace_elevation_interval, strength),
    min(v, 4) -- Prevent area below the first cliff from going under water
  )
end

local function make_array(list)
  local value_expressions = {}

  for i=1,#list do
    value_expressions[i] = tne(list[i])
  end

  return tne{
    type = "array-construction",
    value_expressions = value_expressions
  }
end

local function make_point_list(list)
  local value_expressions = {}

  for i=1,#list do
    value_expressions[i] = make_array(list[i])
  end

  return tne{
    type = "array-construction",
    value_expressions = value_expressions
  }
end

local function distance_from(x, y, points, max_distance)
  local arguments =
  {
    x = x,
    y = y,
    points = points
  }
  if max_distance then
    arguments["maximum_distance"] = tne(max_distance)
  end
  -- todo: misspell to test compilation crashing gracefully
  return funcapp("distance-from-nearest-point", arguments)
end

local function get_control_setting(name)
  local vars = {}
  for i,attr in ipairs{"frequency","size","richness"} do
    for j,attrattr in ipairs{"multiplier"} do
      vars[attr.."_"..attrattr] = nfvar("control-setting:"..name..":"..attr..":"..attrattr)
    end
  end
  return vars
end

local function if_else_chain(...)
  local args = {...}
  local arg_count = 0
  local arg_expressions = {}
  for i,ar in ipairs(args) do
    arg_expressions[i] = tne(ar)
    arg_count = arg_count + 1
  end
  if arg_count % 2 ~= 1 then
    error("if_else_chain requires an odd number of arguments")
  end
  return
  {
    type = "if-else-chain",
    arguments = arg_expressions
  }
end

local function literal_object(val, sloc)
  return
  {
    type = "literal-object",
    source_location = sloc or csloc(1),
    literal_value = val
  }
end

local function literal_expression(x)
  return
  {
    type = "literal-expression",
    literal_value = tne(x)
  }
end

local function noise_layer_name_to_id(name)
  return funcapp("noise-layer-name-to-id", {tne(name)})
end

local function delimit_procedure(expression)
  return
  {
    type = "procedure-delimiter",
    expression = tne(expression)
  }
end

local function compile_time_log(...)
  local args = {...}
  arg_expressions = {}
  for i,arg in ipairs(args) do
    if type(arg) == "string" then
      arg = literal_string(arg)
    end
    arg_expressions[i] = tne(arg)
  end
  return funcapp("compile-time-log", arg_expressions)
end

-- Useful for preventing tail-calls
-- because we want to not lose part of the stacktrace
-- in order that csloc() gives the desired result
local function ident(x)
  return x
end

return
{
  csloc = csloc,
  to_noise_expression = tne,
  define_noise_function = define_noise_function,
  clamp = clamp,
  compile_time_log = compile_time_log,
  ident = ident,
  min = min,
  max = max,
  ridge = ridge,
  terrace = terrace,
  terrace_for_cliffs = terrace_for_cliffs,
  make_array = make_array,
  make_point_list = make_point_list,
  distance_from = distance_from,
  var = nfvar,
  get_control_setting = get_control_setting,
  absolute_value = absolute_value,
  autoplace_probability = autoplace_probability,
  autoplace_richness = autoplace_richness,
  fraction = fraction,
  function_application = funcapp,
  if_else_chain = if_else_chain,
  literal_expression = literal_expression,
  literal_object = literal_object,
  literal_string = literal_string,
  noise_layer_name_to_id = noise_layer_name_to_id,
  random = random,
  random_between = random_between,
  random_penalty = random_penalty,
  delimit_procedure = delimit_procedure,
  log2 = log2,
  fmod = fmod,
  floor = floor,
  ceil = ceil,
  band = band,
  bor = bor,
  bxor = bxor,
  bnot = bnot,
  sin = sin,
  cos = cos,
  atan2 = atan2,
  less_than = less_than,
  less_or_equal = less_or_equal,
  equals = equals,
}

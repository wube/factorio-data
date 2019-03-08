local function ca2d_blit(ca2d, x0, y0, text)
  local width = ca2d.width
  local height = ca2d.height
  local x = x0
  local y = y0
  local chardata = ca2d.chardata
  for i=1,#text do
    local char = string.sub(text,i,i)
    if char == "\r" then
      x = x0
    elseif char == "\n" then
      x = x0
      y = y + 1
    else
      if x <= width and y <= height then
        chardata[(y-1) * width + x] = char
      end
      x = x + 1
    end
  end
end

local function ca2d_tolines(ca2d, opts)
  opts = opts or {}
  local lines = {}
  for y=1,ca2d.height do
    local linechars = {}
    local linelength = 0
    if opts.trimlines then
      for x=1,linelength do
  local char = ca2d.chardata[(y-1)*ca2d.width + x]
  if char ~= " " then
    linelength = x
  end
      end
    else
      linelength = ca2d.width
    end
    for x=1,linelength do
      linechars[x] = ca2d.chardata[(y-1)*ca2d.width + x]
    end
    lines[y] = table.concat(linechars, "")
  end
  return lines
end

local function ca2d_tostring(ca2d, opts)
  local lines = ca2d_tolines(ca2d, opts)
  return table.concat(lines, "\n")
end

local ca2d_metatable =
{
  __tostring = ca2d_tostring
}

local function make_ca2d(width, height, opts)
  opts = opts or {}
  local fillchar = opts.fillchar or " "
  local chardata = {}
  for y=1,height do
    for x=1,width do
      chardata[#chardata+1] = fillchar
    end
  end

  local ca2d =
  {
    width = width,
    height = height,
    chardata = chardata,
    blit = ca2d_blit
  }
  setmetatable(ca2d, ca2d_metatable)
  return ca2d
end

-- local test_ca2d = make_ca2d(6, 4)
-- test_ca2d:blit(1,1,"topp")
-- test_ca2d:blit(2,2,"{")
-- test_ca2d:blit(3,3,"}")
-- print(test_ca2d)

local function char_block_blit(block, ca2d, x, y)
  ca2d_blit(ca2d, x, y, block.text)
end

local char_block_metatable =
{
  __tostring = function(block)
    return block.text
  end
}

local function char_block(text)
  local width = 0
  local height = 0
  local cl_len = 0
  local cl_height = 0
  for i=1,#text do
    local char = string.sub(text,i,i)
    if char == "\n" then
      cl_len = 0
      cl_height = 0
    elseif char == "\r" then
      cl_len = 0
    else
      if cl_height == 0 then
  cl_height = 1
  height = height + 1
      end
      cl_len = cl_len + 1
      width = math.max(width, cl_len)
    end
  end
  local block =
  {
    type = "char-block",
    width = width,
    height = height,
    text = text,
    blit = char_block_blit
  }
  setmetatable(block, char_block_metatable)
  return block
end

local function row_block_blit(block, ca2d, x, y)
  local dxm
  local dym
  if block.direction == nil then
    error("Row block has no direction!")
  elseif block.direction == "right" then
    dxm = 1 ; dym = 0
  elseif block.direction == "down" then
    dxm = 0 ; dym = 1
  else
    error("Invalid row block direction: "..block.direction)
  end
  for i=1,#block.cells do
    local cell = block.cells[i]
    local cx = x
    local cy = y
    if block.direction == "right" then
      cy = y + math.floor((block.height - cell.height)/2)
    elseif block.direction == "down" then
      cx = x + math.floor((block.width - cell.width)/2)
    end
    cell:blit(ca2d, cx, cy)
    x = x + dxm * cell.width
    y = y + dym * cell.height
  end
end

local row_block_metatable =
{
  __tostring = function(block)
    local ca2d = make_ca2d(block.width, block.height)
    block:blit(ca2d, 1, 1)
    return tostring(ca2d)
  end
}

local function to_block(v)
  if type(v) == "number" then
    v = v .. ""
  end
  if type(v) == "string" then
    v = char_block(v)
  end
  if type(v) ~= "table" then
    error("to_block: don't know what to do with a "..type(v).."!")
  end
  if v.type == nil then
    error("to_block: don't know what to do with this one that has no type!")
  end
  return v
end

local function row_block(cells, direction)
  if direction == nil then
    error("No direction specified for row block")
  end
  local height = 0
  local width = 0
  for i=1,#cells do
    local cell = cells[i]
    if cell == nil then error("Cell "..i.." is nil!") end
    if cell.width == nil then error("Cell "..i.." has no width!") end
    if cell.height == nil then error("Cell "..i.." has no height!") end
    if direction == "right" then
      height = math.max(height, cell.height)
      width  = width + cell.width
    elseif direction == "down" then
      width  = math.max(width, cell.width)
      height = height + cell.height
    else
      error("Bad block direction: "..direction)
    end
  end
  local block =
  {
    type = "row",
    direction = direction,
    width = width,
    height = height,
    cells = cells,
    blit = row_block_blit
  }
  setmetatable(block, row_block_metatable)
  return block
end

local function paren(side, height)
  if height < 1 then height = 1 end

  if height == 1 then
    if side == "right" then
      return char_block(")")
    else
      return char_block("(")
    end
  end

  local lines = {}
  if side == "right" then
    lines[1] = " \\"
    for i=2,height-1 do lines[i] = " |" end
    lines[height] = " /"
  else
    lines[1] = "/ "
    for i=2,height-1 do lines[i] = "| " end
    lines[height] = "\\ "
  end

  -- print(side.." paren:\n"..table.concat(lines, "\n"))
  return char_block(table.concat(lines, "\n"))
end

-- Put parentheses around it!
local function parenthesize_block(block)
  return row_block({ paren("left", block.height), block, paren("right", block.height) }, "right")
end

local function infix_block(blocks, sep, direction, precedence)
  sep = to_block(sep)
  local cells = {}
  for i=1,#blocks do
    if #cells > 0 then
      cells[#cells+1] = sep
    end
    cells[#cells+1] = to_block(blocks[i])
  end
  local block = row_block(cells, direction)
  block.infix_precedence = precedence
  return block
end

-- precedence values from https://en.cppreference.com/w/c/language/operator_precedence
local function_infix_symbols =
{
  add =
  {
    symbol = "+",
    precedence = 4
  },
  subtract =
  {
    symbol = "-",
    precedence = 4
  },
  multiply =
  {
    symbol = "*",
    precedence = 3
  },
  divide =
  {
    symbol = "/",
    precedence = 3
  },
  exponentiate =
  {
    symbol = "^",
    precedence = 2.5
  }
}

local function expression_to_ascii_math(expr, precedence)
  if expr.type == "function-application" then
    local argblocks = {}
    local infix = function_infix_symbols[expr.function_name]

    for i=1,#expr.arguments do
      argblocks[i] = expression_to_ascii_math(expr.arguments[i])
    end

    local args_are_small = true
    for a=1,#argblocks do
      local arg = argblocks[a]
      if arg.width > 4 then args_are_small = false end
      if arg.height > 1 then args_are_small = false end
      local arg_infix_precedence = arg.infix_precedence or 0
      if arg_infix_precedence > 0 then args_are_small = false end
    end

    local infix_padding = " "
    if expr.function_name == "multiply" and args_are_small then
      infix_padding = ""
    elseif expr.function_name == "divide" then
      if args_are_small then
        infix_padding = ""
      else
        infix = nil
      end
    end

    for i=1,#expr.arguments do
      local argprec = argblocks[i].infix_precedence or 0
      if infix and infix.precedence < argprec then
        argblocks[i] = parenthesize_block(argblocks[i])
      end
    end

    if infix then
      return infix_block(argblocks, infix_padding..infix.symbol..infix_padding, "right", infix.precedence)
    elseif expr.function_name == "divide" then
      local numblock = argblocks[1]
      local denblock = argblocks[2]
      if numblock == nil then error("No numerator!") end
      if denblock == nil then error("No denominator!") end
      local block = row_block({numblock, char_block(string.rep("-", math.max(numblock.width, denblock.width))), denblock}, "down")
      block.infix_precedence = 3
      return block
    else
      return row_block({char_block(expr.function_name), parenthesize_block(infix_block(argblocks, ", ", "right"))}, "right")
    end
  elseif expr.type == "literal-number" then
    return char_block(expr.literal_value.."")
  elseif expr.type == "variable" then
    return char_block(expr.variable_name)
  else
    return char_block("<" .. expr.type .. ">")
  end
end

local noise = require('noise')
local tne = noise.to_noise_expression

local testing = false
if testing then
  local expr = noise.define_noise_function(
    function(x,y,tile,map)
      return (3 / x) + 32 ^ ((x + (x*x + y*y)^(tne(1)/2 + tne(map.seed)))/(1000 - tile.distance))
    end
  )
  print(expression_to_ascii_math(expr))
end

return expression_to_ascii_math

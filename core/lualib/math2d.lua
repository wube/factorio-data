local math2d = {}

math2d.position = {}

-- Takes a position that might be either a two element array, or a table
-- with x and y keys, and returns a position with x and y keys.
math2d.position.ensure_xy = function(pos)
  local new_pos

  if pos.x ~= nil then
    new_pos = {x = pos.x, y = pos.y}
  else
    new_pos = {x = pos[1], y = pos[2]}
  end

  return new_pos
end

math2d.position.distance_squared = function(p1, p2)
  p1 = math2d.position.ensure_xy(p1)
  p2 = math2d.position.ensure_xy(p2)

  local dx = p1.x - p2.x
  local dy = p1.y - p2.y
  return dx * dx + dy * dy
end

math2d.position.distance = function(p1, p2)
  return math.sqrt(math2d.position.distance_squared(p1, p2))
end

math2d.position.rotate_vector = function(vector, angle_in_deg)
  local cosAngle = math.cos(math.rad(angle_in_deg))
  local sinAngle = math.sin(math.rad(angle_in_deg))

  vector = math2d.position.ensure_xy(vector)
  local x = cosAngle * vector.x - sinAngle * vector.y
  local y = sinAngle * vector.x + cosAngle * vector.y

  return {x = x, y = y}
end

math2d.position.subtract = function(p1, p2)
  p1 = math2d.position.ensure_xy(p1)
  p2 = math2d.position.ensure_xy(p2)

  return {x = p1.x - p2.x, y = p1.y - p2.y}
end

math2d.position.add = function(p1, p2)
  p1 = math2d.position.ensure_xy(p1)
  p2 = math2d.position.ensure_xy(p2)

  return {x = p1.x + p2.x, y = p1.y + p2.y}
end

math2d.position.multiply_scalar = function(vec, scalar)
  vec = math2d.position.ensure_xy(vec)
  return {x = vec.x * scalar, y = vec.y * scalar}
end

math2d.position.divide_scalar = function(vec, scalar)
  vec = math2d.position.ensure_xy(vec)
  return {x = vec.x / scalar, y = vec.y / scalar}
end

math2d.position.vector_length = function(vec)
  vec = math2d.position.ensure_xy(vec)
  return math.sqrt(vec.x*vec.x + vec.y*vec.y)
end

math2d.position.get_normalised = function(vec)
  vec = math2d.position.ensure_xy(vec)

  local length = math.sqrt(vec.x*vec.x + vec.y*vec.y)
  return {x = vec.x / length, y = vec.y / length}
end

math2d.bounding_box = {}

-- Takes a bounding box with positions that might be either two element arrays, or tables
-- with x and y keys, and returns a bounding box with positions with x and y keys.
math2d.bounding_box.ensure_xy = function(bounding_box)
  local new_bounding_box = {}
  new_bounding_box.left_top = math2d.position.ensure_xy(bounding_box.left_top)
  new_bounding_box.right_bottom = math2d.position.ensure_xy(bounding_box.right_bottom)
  return new_bounding_box
end

function math2d.bounding_box.get_centre(box)
  box = math2d.bounding_box.ensure_xy(box)

  local x = box.left_top.x + (box.right_bottom.x - box.left_top.x) / 2
  local y = box.left_top.y + (box.right_bottom.y - box.left_top.y) / 2

  return {x = x, y = y}
end

function math2d.bounding_box.contains_point(box, point)
  box = math2d.bounding_box.ensure_xy(box)
  point = math2d.position.ensure_xy(point)

  return box.left_top.x <= point.x and box.right_bottom.x >= point.x and
         box.left_top.y <= point.y and box.right_bottom.y >= point.y
end

function math2d.bounding_box.contains_box(box, other)
  box = math2d.bounding_box.ensure_xy(box)
  other = math2d.bounding_box.ensure_xy(other)

  return box.left_top.x <= other.left_top.x and
         box.left_top.y <= other.left_top.y and
         box.right_bottom.x >= other.right_bottom.x and
         box.right_bottom.y >= other.right_bottom.y
end

function math2d.bounding_box.collides_with(box1,box2)
  box1 = math2d.bounding_box.ensure_xy(box1)
  box2 = math2d.bounding_box.ensure_xy(box2)

  return box1.left_top.x < box2.right_bottom.x and
    box2.left_top.x < box1.right_bottom.x and
    box1.left_top.y < box2.right_bottom.y and
    box2.left_top.y < box1.right_bottom.y
end

function math2d.bounding_box.create_from_centre(centre, width, height)
  height = height or width
  centre = math2d.position.ensure_xy(centre)

  return
  {
    left_top = { x = centre.x - width / 2, y = centre.y - height / 2},
    right_bottom = {x = centre.x + width / 2, y = centre.y + height / 2}
  }
end

return math2d
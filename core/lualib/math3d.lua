local math3d = {}

math3d.projection_constant = 0.7071067811865

function math3d.project_vec3(vec3)
  return
  {
    vec3[1],
    (vec3[2] + vec3[3]) * math3d.projection_constant
  }
end

math3d.vector4 = {}
math3d.vector4.zero = {0, 0, 0, 0}

function math3d.vector4.dot_product(u, v)
  return u[1] * v[1] + u[2] * v[2] + u[3] * v[3] + u[4] * v[4]
end

function math3d.vector4.add(u, v)
  return { u[1]+v[1], u[2]+v[2], u[3]+v[3], u[4]+v[4] }
end

function math3d.vector4.sub(u, v)
  return { u[1]-v[1], u[2]-v[2], u[3]-v[3], u[4]-v[4] }
end

function math3d.vector4.from_vec3(u)
  return { u[1], u[2], u[3], 1 }
end

math3d.vector3 = {}
math3d.vector3.zero = {0, 0, 0}

function math3d.vector3.dot_product(u, v)
  return u[1] * v[1] + u[2] * v[2] + u[3] * v[3]
end

function math3d.vector3.add(u, v)
  return { u[1]+v[1], u[2]+v[2], u[3]+v[3] }
end

function math3d.vector3.sub(u, v)
  return { u[1]-v[1], u[2]-v[2], u[3]-v[3] }
end

function math3d.vector3.mul(u, k)
  return { u[1]*k, u[2]*k, u[3]*k }
end

function math3d.vector3.cross_product(u, v)
  return {u[2]*v[3] - u[3]*v[2],u[3]*v[1] - u[1]*v[3],u[1]*v[2] - u[2]*v[1]}
end

function math3d.vector3.angle(u, v)
  local len = math.sqrt(math3d.vector3.dot_product(u,u) * math3d.vector3.dot_product(v,v))
  local cos_phi = math3d.vector3.dot_product(u, v) / len
  return math.acos(cos_phi)
end

math3d.vector2 = {}
math3d.vector2.zero = {0, 0}

function math3d.vector2.dot_product(u, v)
  return u[1] * v[1] + u[2] * v[2]
end

function math3d.vector2.add(u, v)
  return { u[1]+v[1], u[2]+v[2] }
end

function math3d.vector2.sub(u, v)
  return { u[1]-v[1], u[2]-v[2] }
end

function math3d.vector2.mul(u, k)
  return { u[1]*k, u[2]*k }
end

function math3d.vector2.rotate(v, phi)
  local sin_phi = math.sin(phi)
  local cos_phi = math.cos(phi)
  return
  {
    v[1] * cos_phi - v[2] * sin_phi,
    v[1] * sin_phi + v[2] * cos_phi
  }
end

math3d.matrix4x4 = {}
math3d.matrix4x4.identity =
{
  { 1, 0, 0, 0 },
  { 0, 1, 0, 0 },
  { 0, 0, 1, 0 },
  { 0, 0, 0, 1 }
}

function math3d.matrix4x4.rotation_x(phi)
  local sin_phi = math.sin(phi)
  local cos_phi = math.cos(phi)
  return
  {
     {       1,        0,        0,     0 },
     {       0,  cos_phi, -sin_phi,     0 },
     {       0,  sin_phi,  cos_phi,     0 },
     {       0,        0,        0,     1 }
  }
end

function math3d.matrix4x4.rotation_y(phi)
  local sin_phi = math.sin(phi)
  local cos_phi = math.cos(phi)
  return
  {
     { cos_phi,        0,  sin_phi,     0 },
     {       0,        1,        0,     0 },
     {-sin_phi,        0,  cos_phi,     0 },
     {       0,        0,        0,     1 }
  }
end

function math3d.matrix4x4.rotation_z(phi)
  local sin_phi = math.sin(phi)
  local cos_phi = math.cos(phi)
  return
  {
     { cos_phi, -sin_phi,        0,     0 },
     { sin_phi,  cos_phi,        0,     0 },
     {       0,        0,        1,     0 },
     {       0,        0,        0,     1 }
  }
end

function math3d.matrix4x4.translation(x, y, z)
  return
  {
     {       1,        0,        0,     x },
     {       0,        1,        0,     y },
     {       0,        0,        1,     z },
     {       0,        0,        0,     1 }
  }
end

function math3d.matrix4x4.translation_vec3(vec3)
  return math3d.matrix4x4.translation(vec3[1], vec3[2], vec3[3])
end

function math3d.matrix4x4.scale(x, y, z)
  return
  {
     {       x,        0,        0,     0 },
     {       0,        y,        0,     0 },
     {       0,        0,        z,     0 },
     {       0,        0,        0,     1 }
  }
end

function math3d.matrix4x4.column(mat, index)
   return { mat[1][index], mat[2][index], mat[3][index], mat[4][index] }
end

function math3d.matrix4x4.transpose(mat)
   return
   {
     math3d.matrix4x4.column(mat, 1),
     math3d.matrix4x4.column(mat, 2),
     math3d.matrix4x4.column(mat, 3),
     math3d.matrix4x4.column(mat, 4)
   }
end

function math3d.matrix4x4.mul_mat(m1, m2)
  local dot = math3d.vector4.dot_product
  local t = math3d.matrix4x4.transpose(m2)
  return
  {
     { dot(m1[1], t[1]), dot(m1[1], t[2]), dot(m1[1], t[3]), dot(m1[1], t[4]) },
     { dot(m1[2], t[1]), dot(m1[2], t[2]), dot(m1[2], t[3]), dot(m1[2], t[4]) },
     { dot(m1[3], t[1]), dot(m1[3], t[2]), dot(m1[3], t[3]), dot(m1[3], t[4]) },
     { dot(m1[4], t[1]), dot(m1[4], t[2]), dot(m1[4], t[3]), dot(m1[4], t[4]) }
  }
end

function math3d.matrix4x4.mul_vec3(mat, vec3)
  return
  {
    math3d.vector3.dot_product(vec3, mat[1]) + mat[1][4],
    math3d.vector3.dot_product(vec3, mat[2]) + mat[2][4],
    math3d.vector3.dot_product(vec3, mat[3]) + mat[3][4]
  }
end

function math3d.matrix4x4.compose(list)
  local retval = math3d.matrix4x4.identity
  for i,m in ipairs(list) do
    retval = math3d.matrix4x4.mul_mat(m, retval)
  end
  return retval
end

return math3d
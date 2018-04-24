local camera = {}

camera.init = function(param)
  local self = {}
  self.position = {x = param.position[1], y = param.position[2]}
  self.zoom = param.zoom
  self.set_zoom = param.set_zoom
  self.players = {}
  return self
end

camera.hold = function(self, param)
  if param.position then
    self.position = {x = param.position[1], y = param.position[2]}
  end
  if param.zoom then
    self.zoom = param.zoom
  end
  self.hold_time = game.tick + (param.time*60)
end

camera.move = function (self, param)
  local d_t = param.time * 60
  local start_tick = game.tick + 1
  local tick_to_finish = start_tick + d_t
  local o_x = self.position.x
  local o_y = self.position.y
  local o_z = self.zoom
  local v_x = o_x
  local v_y = o_y
  if param.position then
    v_x = param.position[1]
    v_y = param.position[2]
  elseif param.entity then
    v_x = param.entity.position.x
    v_y = param.entity.position.y
  end
  local d_x = (v_x-o_x)/d_t
  local d_y = (v_y-o_y)/d_t
  local d_z = (param.zoom - self.zoom)/d_t or 0
  self.position_on_tick = {}
  local d = 1
  for k = start_tick, tick_to_finish do
    self.position_on_tick[k] = {position = {x = (o_x + (d_x*d)), y = (o_y + (d_y*d))}, zoom = (o_z + d_z*d)}
    d = d + 1
  end
  self.position_on_tick[tick_to_finish].last = true
end

camera.update = function(self)
  if not self then return end
  local tick = game.tick
  if self.position_on_tick then
    local new_position = self.position_on_tick[tick]
    if new_position then
      self.position = new_position.position
      self.zoom = new_position.zoom
      if new_position.last then
        self.position_on_tick = nil
      end
    end
  end
  if self.hold_time then
    if tick >= self.hold_time then
      self.hold_time = nil
    end
  end
  if self.following then
    if self.following.valid then
      self.position = self.following.position
    else
      self.following = nil
    end
  end
  for k, player in pairs (self.players) do
    player.teleport(self.position)
    if self.set_zoom then
      player.zoom = self.zoom
    end
  end
end

camera.follow = function(self, entity)
  self.following = entity
end

camera.idle = function(self)
  if self.position_on_tick then return false end
  if self.hold_time then return false end
  if self.following then return false end
  return true
end

return camera

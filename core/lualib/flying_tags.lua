local flying_tags = {}

flying_tags.update = function(tags)
  local tags = tags or global.flying_tags
  if not tags then return end
  if type(tags) ~= "table" then
    error("Tags must be a list of following tags not: "..type(tags))
  end

  local update_tag = function(tag)
    if not tag.flying_text.valid then
      return
    end
    if not tag.entity.valid then
      tag.flying_text.destroy()
      return
    end
    tag.flying_text.teleport({x = tag.entity.position.x + tag.offset.x, y = tag.entity.position.y + tag.offset.y})
    return true
  end

  for k, tag in pairs(tags) do
    if not update_tag(tag) then
      tags[k] = nil
    end
  end

end

flying_tags.create = function(tag)
  if not tag then error("You shouldn't be creating a tag without any parameters") end
  if not tag.entity then error("No entity to follow for tag") end
  if not tag.entity.valid then error("Well the entity wasn't valid to create a tag") end
  if not tag.offset then
    tag.offset = {x = 0, y = 0}
  else
    if not tag.offset.x then tag.offset.x = tag.offset[1] or 0 end
    if not tag.offset.y then tag.offset.y = tag.offset[2] or 0 end
  end
  tag.flying_text = tag.entity.surface.create_entity
  {
    name = "tutorial-flying-text",
    text = tag.text or tag.entity.localised_name,
    color = tag.color,
    position = {x = tag.entity.position.x + tag.offset.x, y = tag.entity.position.y + tag.offset.y}
  }
  tag.flying_text.active = false
  local tags = tag.tags
  if not tags then
    if not global.flying_tags then global.flying_tags = {} end
    tags = global.flying_tags
  end
  table.insert(tags, tag)
  return tag.flying_text
end

return flying_tags

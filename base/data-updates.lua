function shouldhavebuildeffect(entity)
  if entity.flags == nil then
    return false
  end
  if entity.collision_box == nil then
    return false
  end
  for _,flag in pairs(entity.flags) do
    if flag == "player-creation" then
      return true
    end
  end
  return false
end


function getbuildeffect(entity)
  local repeatcount = 4
  local repeatcountbasedoncollisionmask = math.floor((entity.collision_box[2][1] - entity.collision_box[1][1]) *
                                                     (entity.collision_box[2][2] - entity.collision_box[1][2]) * 15)
  if repeatcountbasedoncollisionmask > repeatcount then
    repeatcount = repeatcountbasedoncollisionmask
  end
  return
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        {
          type = "create-smoke",
          repeat_count = repeatcount,
          entity_name = "smoke-building",
          initial_height = 0,
          speed_from_center = 0.05,
          offset_deviation = entity.collision_box
        }
      }
    }
  }
end

function addbuildeffects()
  for _,entitytype in pairs(data.raw) do
    for _,entity in pairs(entitytype) do
      if shouldhavebuildeffect(entity) then
        entity.created_effect = getbuildeffect(entity)
      end
    end
  end
end

addbuildeffects()
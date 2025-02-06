function sound_variations(filename_string, variations, volume_parameter, modifiers_parameter)
  local result = {}
  for i = 1,variations do
    result[i] = { filename = filename_string .. "-" .. i .. ".ogg", volume = volume_parameter or 0.5 }
    if modifiers_parameter then
      result[i].modifiers = modifiers_parameter
    end
  end
  return result
end

function sound_variations_with_volume_variations(filename_string, variations, min_volume, max_volume, modifiers_parameter)
  local result = {}
  for i = 1,variations do
    result[i] =
    {
      filename = filename_string .. "-" .. i .. ".ogg",
      min_volume = min_volume or 0.5,
      max_volume = max_volume or 0.5
    }
    if modifiers_parameter then
      result[i].modifiers = modifiers_parameter
    end
  end
  return result
end

function make_sound_variations(parameters)
  local result = {}
  for i = 1, parameters.number_of_variations do
    result[i] =
    {
      filename = parameters.filename .. "-" .. i .. ".ogg",
      modifiers = parameters.modifiers,
    }

    if (parameters.volume) then
      result[i].volume = parameters.volume
    else
      result[i].min_volume = parameters.min_volume or 0.5
      result[i].max_volume = parameters.max_volume or 0.5
    end

    if (parameters.speed) then
      result[i].speed = parameters.speed
    else
      result[i].min_speed = parameters.min_speed or 1.0
      result[i].max_speed = parameters.max_speed or 1.0
    end
  end
  return result
end

function volume_multiplier(type_parameter, volume_multiplier_parameter)
  return { type = type_parameter, volume_multiplier = volume_multiplier_parameter }
end

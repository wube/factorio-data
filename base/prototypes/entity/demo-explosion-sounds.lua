local explosion_sounds = {}

explosion_sounds.small = function(volume)
  return
  {
    aggregation =
    {
      max_count = 1,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/fight/small-explosion-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/fight/small-explosion-2.ogg",
        volume = volume
      }
    }
  }
end

explosion_sounds.large = function(volume)
  return
  {
    aggregation =
    {
      max_count = 1,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/fight/large-explosion-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/fight/large-explosion-2.ogg",
        volume = volume
      }
    }
  }
end

return explosion_sounds

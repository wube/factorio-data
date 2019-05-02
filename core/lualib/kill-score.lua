local production_score = require("production-score")

local default_prices = function()
  return
  {
    ["character"] = 2500,

    ["small-biter"] = 250,
    ["medium-biter"] = 1250,
    ["big-biter"] = 3500,
    ["behemoth-biter"] = 8000,

    ["small-spitter"] = 350,
    ["medium-spitter"] = 1400,
    ["big-spitter"] = 4000,
    ["behemoth-spitter"] = 10000,

    ["small-worm-turret"] = 500,
    ["medium-worm-turret"] = 1500,
    ["big-worm-turret"] = 4500,

    ["biter-spawner"] = 1000,
    ["spitter-spawner"] = 1500
  }
end

local get_total_kill_counts = function(kill_statistics)
  local produced = kill_statistics.input_counts
  local consumed = kill_statistics.output_counts
  for name, value in pairs (consumed) do
    if produced[name] then
      produced[name] = produced[name] - value
    else
      produced[name] = -value
    end
  end
  return produced
end

local get_entity_price = function(entity, item_prices)
  local price = math.huge
  local items_to_place_this = entity.items_to_place_this
  if not items_to_place_this then return end
  for name, item in pairs (items_to_place_this) do
    local item_price = item_prices[item.name]
    if item_price then
      item_price = item_price * item.count
      if item_price < price then
        price = item_price
      end
    end
  end
  if price == math.huge then return end
  return price
end

local kill_score = {}

kill_score.generate_entity_prices = function(param)
  local param = param or {}
  local prices = param.prices or default_prices()
  local item_prices = param.item_prices or production_score.generate_price_list()
  local entities = game.entity_prototypes
  for name, entity in pairs (entities) do
    prices[name] = prices[name] or get_entity_price(entity, item_prices)
  end
  return prices
end

kill_score.get_kill_scores = function(price_list)
  local price_list = price_list or kill_score.generate_entity_prices()
  local scores = {}
  for k, force in pairs (game.forces) do
    local score = 0
    for name, value in pairs (get_total_kill_counts(force.kill_count_statistics)) do
      local price = price_list[name]
      if price then
        score = score + (price * value)
      end
    end
    scores[force.name] = math.floor(score)
  end
  return scores
end

kill_score.get_default_prices = function()
  return default_prices()
end

return kill_score
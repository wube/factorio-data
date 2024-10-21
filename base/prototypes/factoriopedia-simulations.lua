require("__base__/prototypes/factoriopedia-util");
local simulations = {}

-----------////////////////////////////////////////////////////////////// LOGISTICS

simulations.factoriopedia_underground_belt =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_zoom = 1.8
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVkEkKwzAMRe+itRuawSH1VUopGUQQJHLwUBqC7147WXRRSulK6Fv/P1kbdJPHxRA7UBtQr9mCum5gaeR2Shq3M4ICzwOa0ehYTx1ODoIAitoTVB5uApAdOcLDvTfrnf3coYkD4muKgEXbaNScWDHslGdSwArqnMmIGMhgfzxXAty6pBTixacFPkDFH6DyN0d7t4Pi98jhHJX3tQQ80NjdUDR51ZSyrutK1vISwgsE2HFh",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_fast_underground_belt =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_zoom = 1.8
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVkMsKg0AMRf8l61HQOmL9lVKKj1QCmpF5lIrMvzfqootCS1chd3LvyWSFdgw4W2IP9QrUGXZQX1ZwNHAzbho3E0IN98b5JHCPdrBGatLi6CEqINGeUGfxqgDZkyc8IvZmuXGYWrQyoL5HKZiNE7fhjSqJSZ5qBYs4Uy2cnix2x3OhwC/zFkU8h22LD1r+L634DTPB7zT5KHmcRHkfT8EDrdsNeZUV1UmXZVnoUp9jfAFtuXb2",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_express_underground_belt =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_zoom = 1.8
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqdkMsKgzAQRf9l1lHQGrH5lVKKj0EGdBLyKIr470100UUXQldD7kzOSWaDbgpoLLEHtQH1mh2oxwaORm6nlHE7IyjAxVh0Lgs8oB2tjjXrcPKwC6CYLaCK/SkA2ZMnPCnHYX1xmDu0cUBc0gQY7SJAc3JHaHbLpYAVVJnLqBrIYn+2KwF+NYlGbEJ6yI+w/EMor306+EMYv0se55h8tyjgjdYdF8qmqJqbrOu6krW87/sHtAN7Dg==",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_pipe_to_ground =
{
  init =
  [[
    game.simulation.camera_position = {0.5, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqNkM0KgzAQhN9lz1HwJ8HmVUop/iyyoJuQxFKRvHujHnooQo+7O/PNsBt004LWEQfQG1Bv2IO+b+Bp5Hbad9zOCBosWcyCyUZnFh4gCiAe8A26iA8ByIEC4ek9hvXJy9yhSwJxwRBgjU82w3tOQmVVLgWsoGUuU8BADvvzXJRR/IDLv8Hqilvv5SngnCDfTwh4ofOHoGyKuqmkUqqWSt5i/ADn0mRJ",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_train_stop =
{
  init =
  [[
    game.simulation.camera_zoom = 1.6
    game.simulation.camera_position = {1, -0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN0+FqhDAMB/B3yecKq9qqfZUxhncXbgGN0vbGDvHdF5VtjNsgH9vm/0tL2wVOww3nSJwhLEDniROE5wUSXbkftjnuR4QAsacBVgPEF/yAYNcXA8iZMuGR2Af3V76NJ4xSYL6SWaJcpDzNYGCekkQm3mRhCim7Q2gEvlDE87FkSwMp98cApOuDXn7raeOvb7nYN/jYoNsbdL8b1H+QlZpstGStJp2WdGqy0pJeTVot2WhJtdhqRfWxO62ovhv7pCX/eUHypSjjKPmfX2ngHWPaC8rW1m3lvPe1865b109MPz1t",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_rail_signal =
{
  init =
  [[
    game.simulation.camera_position = {0.5, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN0tsKwjAMBuB3yXUn7NBu7lVEZGqYga2Ttooy+u7GTVQYYu56+POR0oyw7y54dmQD1CPQYbAe6s0InlrbdM8z2/QINbiGOogKyB7xBnUatwrQBgqEc8W0ue/spd+j44D6rkxenoLz4LlmsE+anSRdaQV3zvOC+SM5PMz3RVQLNXurPrDbnkIyNbZ0y1nN/5u52NRisxCbudjUYjMVm0ZqyslSSspfXknJXx/Es0oBewY+467gis5PgaxKiyrXxphCG72O8QESkgSF",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_rail_chain_signal =
{
  init =
  [[
    game.simulation.camera_position = {0.5, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN0uEKgjAQB/B3uc9TMN00XyUi1I460DO2FYXs3VsaFUR0H7fd/3cbuwna/ownS+yhnoC6kR3UmwkcHbjpH3vcDAg12IZ6CAqI93iFOgtbBciePOGSmBe3HZ+HFm0sUJ/JpDs2xMlTVXAaXUyO/GgQtSRLtYJbTOlUxyZ7stgt50VQX/bqZTsf9cPRJ/P1vt1yUcv/Zi42tdgsxGYuNrXYzMSmkZpyspSS8pdXUvLXB8WJJY9DBN5Dr+CC1s0FqyorqlwbYwpt9DqEO/uUBtU=",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_locomotive =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqNk91uwjAMhd/F1wGt9AfWV5lQFYIpFmmCkrQbQnn3uYQNJDYpUm/snvMl9amvsNMjnh2ZAO0VSFnjof24gqfeSD33jBwQWnCSNEQBZPb4BW0RtwLQBAqEyXErLp0Zhx06Fogfpw/s7Y9hcUMIOFvPLmtmOJMWawEX1q8ZvieHKr2ronhhrrKZdTazzGaW2czql6mtsoMNNOEfwGJZrJ4uikbuNHba9uQDKd99HonrwU5kemgPUnsUYB3xaTJx3pYzgAIOKQPaPyVmRqVRusVhxJRckrHKdGQmplh3SbZHxbH5INWJ2XEb+Xn9ujp7YkX2xJpcZj5ynYvMz3WTi/zv99vO07Xq1PGemdS+r9vcvSvmnPiIx2IKmND5G2K1KapNWTdNU9VN/R7jNyerQaI=",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_cargo_wagon =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN021vgyAQAOD/cp+xqS+o9a8si0HL6GUIDaBdY/zvO7V7SbolfOS4ezgCN0OnR3l1aAI0M2BvjYfmZQaPygi9xowYJDTgBGpYGKA5yw9o0uWVgTQBA8q9YlvcWzMOnXSUwL4qfaBadQnJRjC4Wk9V1qw4SUnF4A5Nxgk/o5P9vlcs7MnMok0ebebRZh5tFt9mL5yyyU0oSn0Wj4dTXv1qVRrRadlqq9AH7H17uyCtBzuhUdC8Ce0lA+uQzhM7dDxkfH2UiULWEWRGrf9oiUdfM42+ZhlrxpNVLBn/GHUs+d+foY/ug+3fWxoOs4cfM7JGHxkY5EBH/EwTg0k6vxFZnRZ1zsuyLHjJT8vyCe5KJ7g=",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_fluid_wagon =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN09uOgyAQANB/mWds6gVUfqXZGFRqJ4vQALbbGP99UbuXpLsJjwwzh4EwM7RqkleL2gOfATujHfDTDA4HLdQa02KUwMEKVLAQQN3LD+Dp8kZAao8e5V6xLR6NnsZW2pBAviqdD7XDxScbQeBqXKgyesWDlJQEHsCzOuA9Wtnte8VCXsws2qTRZh5t5tFm8W2e1YR9chdDSH0Vj4eaVeWvXqUWrZKNMgM6j51r7hcM69HcUA/Az0I5ScBYDAeKXToeMvpHCzT6Wmn0tVisGU+WsWT841ex5H9/JHxs50333oRh0Hv4ORNr9JmBXo7hiJ/pIXCT1m1EVqVFlVPGWEEZrZflE5RmIcg=",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_artillery_wagon =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN09tuwyAMANB/8TOtmgsk5VemKSKpl1ojUAFtF0X595Gku0jdJB4x9sEIPEGrr3hxZALICaizxoN8mcBTb5ReYkYNCBKcIg0zAzIn/ACZza8M0AQKhFvFuhgbcx1adDGBfVX6EGv7c9itBIOL9bHKmgWP0q5iMILMs4ifyGG37ZUzezLzZJMnm0WyWSSb5bepXCCt0Y27u+pj+rN62B9FXf3qF41qNTba9uQDdb65nymuB3sj04N8U9ojA+soHqo26bDP+R9t8OSrZclXE6lmOlmlkukPUKeS//2T+Ll9sN17EwfCbOHHXCzRRwYFHOIRPxPE4IbOr0ReZ2VdcCFEyQU/zvMnmIUjTA==",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_spidertron =
{
  init =
  [[
    game.simulation.camera_zoom = 1.3
    game.simulation.camera_position = {0, -1}
    game.surfaces[1].create_entity{name = "spidertron", position = {0, 0}}
  ]]
}

simulations.factoriopedia_logistic_robot =
{
  init =
  [[
    game.simulation.camera_position = {0, -1}
    game.surfaces[1].create_entity{name = "logistic-robot", position = {0, 0}}
  ]]
}

simulations.factoriopedia_construction_robot =
{
  init =
  [[
    game.simulation.camera_position = {0, -1}
    game.surfaces[1].create_entity{name = "construction-robot", position = {0, 0}}
  ]]
}

simulations.factoriopedia_display_panel =
{
  init =
  [[
    game.simulation.camera_zoom = 3
    game.simulation.camera_position = {1.5, 3.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlVttuozAQ/Rc/4yokTZpG2i+pKmRggNli445NurTKv+8YGkiTVL2QvAC2z5kzntubSOsWLKHxYvcmMGuME7uHN+GwNKoO34zSIHYCasg8YSbBAJWd5BNAhcpAHCKBJod/YhcfoisnXZs6rzw2RkTiuVU1+o4/11CCyRV1JwDLw2MkwHj0CIMd/UuXmFanQMwQHVGDpV4ZL7NGp2iUb4jhbeOwZ2J6xtvcrCPBZHK5vFkzDR/y1NRJCpXaI5/gbY51YS/79Jmpj6IiUWDNYs+/vhuStvUTe8MB8Z4PCk1Dmj0RaLVV1Ju4E3/6D21weO+vo/QR0FnMGYzO/PUjtNWIRlCggVxW6lVRzt4yGYGH30PfjtCWmpKU1iqtQToL6mmOA9YnJluFJK3Knn4Pt4kuIrdoyYSA/TXm3SS91fbvLPu2IxbyTcsSFMmXCqD+PeT9R8iGZkiNF1OAK8+R3c3AmpKF1Iss0FUzwDhRfGeHOMnQBo3Hi9bWd7ICte9kg7VMFdEcf8ZTFlkEytCUknhb7qRWpXrlvJoBPuWRwbLyco+OS4+E5xat5rI3A3o9uqioW8wnD72oWTUq3ozAeyTf9gePVasv+zKrYE5WxHcjw1D5JwKu2aAbX8kU54nYfkqRVXw4m4c+JWFJAEa+4Jw0XC4+NXZ4l2XVuB/HyiP/D4HmrL2eNKG+ajb0zfbKNouclWbD6vazVjuAJryY49h1Gws0zAehQJi80Uw17E20Yh5PLbzPCMmx74sdu2bYnbQ258BO+pFkH2aPeH1V3pTPH2aSM1XbE03Xx5UL4Nvo6zHpgieU2JEobYsCKHH4CmFl/F0hmxpljs7WquNOafo6d0Zwf7yeePPp9BMCRMM43YwXE9YKJOeTaZ77IvWV6XzFNVIMVO+3FF/EYRj3soHh24gcr9OpK2PCIQyOIdWCjIc4iqNlFD9GD8toFa35iVe5auhQRsZ5NxJ7lt1rXW7j2+1qvblbLRabVXw4/AdSM7DC",
      position = {0, 0}
    }
  ]]
}

-----------////////////////////////////////////////////////////////////// INTERMEDIATE PRODUCTS

simulations.factoriopedia_coal = { init = make_resource("coal") }
simulations.factoriopedia_stone = { init = make_resource("stone") }
simulations.factoriopedia_iron_ore = { init = make_resource("iron-ore") }
simulations.factoriopedia_copper_ore = { init = make_resource("copper-ore") }
simulations.factoriopedia_uranium_ore = { init = make_resource("uranium-ore") }

-----------////////////////////////////////////////////////////////////// COMBAT

simulations.factoriopedia_distractor =
{
  init =
  [[
    game.simulation.camera_position = {0, -1}
    game.surfaces[1].create_entity{name = "distractor", position = {0, 0}}
  ]]
}

local make_armor = function(name)
  return
  [[
    game.simulation.camera_zoom = 4
    game.simulation.camera_position = {0.5, -0.25}
    local character = game.surfaces[1].create_entity{name = "character", position = {0.5, 0.5}, force = "player", direction = defines.direction.south}
    character.insert{name = "]]..name..[["}
  ]]
end

simulations.factoriopedia_light_armor = { init = make_armor("light-armor") }
simulations.factoriopedia_heavy_armor = { init = make_armor("heavy-armor") }
simulations.factoriopedia_modular_armor = { init = make_armor("modular-armor") }
simulations.factoriopedia_power_armor = { init = make_armor("power-armor") }
simulations.factoriopedia_power_armor_mk2 = { init = make_armor("power-armor-mk2") }

simulations.factoriopedia_gate =
{
  init =
  [[
    game.simulation.camera_position = {0.5, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqNkM0Kg0AMhN8l51Tqzy7qq5RSVg2yoFHcta3IvntXPVSLhx4TZr6ZZIaiGakfNFvIZ9Blxwby2wxG16yaZceqJcjB2I7p8lJNAw5Bc0VvyEOHJ9JaWdqJIndHILbaatrg6zA9eGwLGjwFT0IQ+s54S8cL2WMucRgIhMnrZSDckvzDifDQ4IRw3RMQKj1QuQmSE178X68oO/Tyx2pLrXd9X4vwpMGsnigNkzQWUspESJE59wEUC3yd",
      position = {0, 0}
    }
  ]]
}

-----------////////////////////////////////////////////////////////////// ENEMIES


local make_enemy = function(name)
  return
    [[
    game.simulation.camera_zoom = 1.8
    game.simulation.camera_position = {0, 0}
    game.surfaces[1].build_checkerboard{{-40, -40}, {40, 40}}
    enemy = game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}

    step_0 = function()
      game.simulation.camera_position = {enemy.position.x, enemy.position.y - 0.5}
      script.on_nth_tick(1, function()
          step_0()
      end)
    end

    step_0()
  ]]
end

simulations.factoriopedia_small_biter = { init = make_enemy("small-biter") }
simulations.factoriopedia_medium_biter = { init = make_enemy("medium-biter") }
simulations.factoriopedia_big_biter = { init = make_enemy("big-biter") }
simulations.factoriopedia_behemoth_biter = { init = make_enemy("behemoth-biter") }
simulations.factoriopedia_small_spitter = { init = make_enemy("small-spitter") }
simulations.factoriopedia_medium_spitter = { init = make_enemy("medium-spitter") }
simulations.factoriopedia_big_spitter = { init = make_enemy("big-spitter") }
simulations.factoriopedia_behemoth_spitter = { init = make_enemy("behemoth-spitter") }

-----------////////////////////////////////////////////////////////////// ENVIRONMENT

simulations.factoriopedia_cliff =
{
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "red-desert-1"}}
      end
    end
    for x = -8, 8, 1 do
      for y = 3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "red-desert-0"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "cliff", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

simulations.factoriopedia_fish =
{
  init =
  [[
    for x = -8, 8, 1 do
      for y = -3, 3 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "water"}}
      end
    end
    game.surfaces[1].create_entity{name = "fish", position = {0, 0}}
  ]]
}

simulations.factoriopedia_tree =
{
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "grass-1"}}
      end
    end

    game.surfaces[1].create_entity{name = "tree-01", position = {-5.5, 2}}
    game.surfaces[1].create_entity{name = "tree-09-brown", position = {-4, 0}}
    game.surfaces[1].create_entity{name = "tree-02", position = {-2.5, 1}}
    game.surfaces[1].create_entity{name = "tree-03", position = {-3, 2.5}}
    game.surfaces[1].create_entity{name = "tree-04", position = {0, 0.5}}
    game.surfaces[1].create_entity{name = "tree-05", position = {-0.5, 3}}
    game.surfaces[1].create_entity{name = "tree-09", position = {2.5, 1}}
    game.surfaces[1].create_entity{name = "tree-02-red", position = {2, 3}}
    game.surfaces[1].create_entity{name = "tree-02", position = {4.5, 0.5}}
    game.surfaces[1].create_entity{name = "tree-07", position = {4.5, 2.5}}
  ]]
}

simulations.factoriopedia_dead_tree =
{
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, -1}
    for x = -10, 9, 1 do
      for y = -5, 3 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "dirt-1"}}
      end
    end

    game.surfaces[1].create_entity{name = "dead-grey-trunk", position = {-0.14, -2.4}}
    game.surfaces[1].create_entity{name = "dead-tree-desert", position = {-4.17, -1.53}}
    game.surfaces[1].create_entity{name = "dead-grey-trunk", position = {-1.54, -0.62}}
    game.surfaces[1].create_entity{name = "dead-dry-hairy-tree", position = {3.77, -1.81}}
    game.surfaces[1].create_entity{name = "dead-dry-hairy-tree", position = {-4.98, 0.41}}
    game.surfaces[1].create_entity{name = "dead-grey-trunk", position = {-0.26, 1.1}}
    game.surfaces[1].create_entity{name = "dead-tree-desert", position = {1.21, 0.29}}
    game.surfaces[1].create_entity{name = "dead-tree-desert", position = {3.18, 0.91}}
  ]]
}

-----------////////////////////////////////////////////////////////////// UNSORTED

simulations.factoriopedia_entity_ghost =
{
  init =
  [[
    game.surfaces[1].create_entity{name = 'entity-ghost', inner_name = 'stone-furnace', position = {0, 0}}
  ]]
}

simulations.factoriopedia_item_on_ground =
{
  init =
  [[
    game.surfaces[1].create_entity{name="item-on-ground", stack={name="blueprint-book", count=1}, position={0.8, 1.2} }
    game.surfaces[1].create_entity{name="item-on-ground", stack={name="blueprint", count=1}, position={1.9, 1.6} }
    game.surfaces[1].create_entity{name="item-on-ground", stack={name="repair-pack", count=1}, position={0, -1.5} }
    game.surfaces[1].create_entity{name="item-on-ground", stack={name="deconstruction-planner", count=1}, position={1.2, -0.1} }
    game.surfaces[1].create_entity{name="item-on-ground", stack={name="upgrade-planner", count=1}, position={-0.9, 0.7} }
    game.surfaces[1].create_entity{name="item-on-ground", stack={name="submachine-gun", count=1}, position={-2, 1.3} }
    game.surfaces[1].create_entity{name="item-on-ground", stack={name="exoskeleton-equipment", count=1}, position={0, -0.5} }
  ]]
}

simulations.factoriopedia_item_request_proxy =
{
  init =
  [[
    game.simulation.camera_position = {0.5, 0.5}
    game.simulation.camera_alt_info = true
    local assembler = game.surfaces[1].create_entity{name = "assembling-machine-3", position = {0, 0}}
    assembler.set_recipe("iron-gear-wheel")
    game.surfaces[1].create_entity { name = "item-request-proxy", position = assembler.position, target = assembler, modules = {{id={name = "speed-module"}, items = {in_inventory={{inventory = 4, stack = 0}}}}}}
    game.surfaces[1].create_entity { name = "item-request-proxy", position = assembler.position, target = assembler, modules = {{id={name = "efficiency-module"}, items = {in_inventory={{inventory = 4, stack = 1}}}}}}
    game.surfaces[1].create_entity { name = "item-request-proxy", position = assembler.position, target = assembler, modules = {{id={name = "productivity-module"}, items = {in_inventory={{inventory = 4, stack = 2}}}}}}
  ]]
}

simulations.factoriopedia_tile_ghost =
{
  init =
  [[
    game.simulation.camera_position = {0.5, 0}
    for x = -2, 2, 1 do
      for y = -2, 1 do
        game.surfaces[1].create_entity{name = "tile-ghost", inner_name = "concrete", position = {x, y}}
      end
    end
  ]]
}

return simulations

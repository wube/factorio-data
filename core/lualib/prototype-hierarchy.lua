local hierarchy =
{
  ["achievement"] =
  {
    ["achievement-with-condition"] =
    {
      _abstract = true,
      ["complete-objective-achievement"] = {},
      ["dont-build-entity-achievement"] = {},
      ["dont-craft-manually-achievement"] = {},
      ["dont-kill-manually-achievement"] = {},
      ["dont-research-before-researching-achievement"] = {},
      ["dont-use-entity-in-energy-production-achievement"] = {},
    },
    ["build-entity-achievement"] = {},
    ["change-surface-achievement"] = {},
    ["combat-robot-count-achievement"] = {},
    ["construct-with-robots-achievement"] = {},
    ["create-platform-achievement"] = {},
    ["deconstruct-with-robots-achievement"] = {},
    ["deliver-by-robots-achievement"] = {},
    ["deplete-resource-achievement"] = {},
    ["destroy-cliff-achievement"] = {},
    ["equip-armor-achievement"] = {},
    ["group-attack-achievement"] = {},
    ["kill-achievement"] = {},
    ["module-transfer-achievement"] = {},
    ["place-equipment-achievement"] = {},
    ["player-damaged-achievement"] = {},
    ["produce-achievement"] = {},
    ["produce-per-hour-achievement"] = {},
    ["research-achievement"] = {},
    ["research-with-science-pack-achievement"] = {},
    ["shoot-achievement"] = {},
    ["space-connection-distance-traveled-achievement"] = {},
    ["train-path-achievement"] = {},
    ["use-entity-in-energy-production-achievement"] = {},
    ["use-item-achievement"] = {},
  },
  ["active-trigger"] =
  {
    _abstract = true,
    ["chain-active-trigger"] = {},
    ["delayed-active-trigger"] = {},
  },
  ["airborne-pollutant"] = {},
  ["ambient-sound"] = {},
  ["ammo-category"] = {},
  ["animation"] = {},
  ["asteroid-chunk"] = {},
  ["autoplace-control"] = {},
  ["burner-usage"] = {},
  ["collision-layer"] = {},
  ["custom-event"] = {},
  ["custom-input"] = {},
  ["damage-type"] = {},
  ["decorative"] =
  {
    _abstract = true,
    ["optimized-decorative"] = {},
  },
  ["deliver-category"] = {},
  ["deliver-impact-combination"] = {},
  ["editor-controller"] = {},
  ["entity"] =
  {
    _abstract = true,
    ["arrow"] = {},
    ["artillery-flare"] = {},
    ["artillery-projectile"] = {},
    ["beam"] = {},
    ["character-corpse"] = {},
    ["cliff"] = {},
    ["corpse"] =
    {
      ["rail-remnants"] = {},
    },
    ["deconstructible-tile-proxy"] = {},
    ["entity-ghost"] = {},
    ["entity-with-health"] =
    {
      _abstract = true,
      ["entity-with-owner"] =
      {
        _abstract = true,
        ["accumulator"] = {},
        ["agricultural-tower"] = {},
        ["artillery-turret"] = {},
        ["asteroid-collector"] = {},
        ["asteroid"] = {},
        ["beacon"] = {},
        ["boiler"] = {},
        ["burner-generator"] = {},
        ["cargo-bay"] = {},
        ["cargo-landing-pad"] = {},
        ["cargo-pod"] = {},
        ["character"] = {},
        ["combinator"] =
        {
          _abstract = true,
          ["arithmetic-combinator"] = {},
          ["decider-combinator"] = {},
          ["selector-combinator"] = {},
        },
        ["constant-combinator"] = {},
        ["container"] =
        {
          ["logistic-container"] =
          {
            ["infinity-container"] = {},
          },
          ["temporary-container"] = {},
        },
        ["crafting-machine"] =
        {
          _abstract = true,
          ["assembling-machine"] =
          {
            ["rocket-silo"] = {},
          },
          ["furnace"] = {},
        },
        ["display-panel"] = {},
        ["electric-energy-interface"] = {},
        ["electric-pole"] = {},
        ["unit-spawner"] = {},
        ["flying-robot"] =
        {
          _abstract = true,
          ["capture-robot"] = {},
          ["combat-robot"] = {},
          ["robot-with-logistic-interface"] =
          {
            _abstract = true,
            ["construction-robot"] = {},
            ["logistic-robot"] = {},
          },
        },
        ["fusion-generator"] = {},
        ["fusion-reactor"] = {},
        ["gate"] = {},
        ["generator"] = {},
        ["heat-interface"] = {},
        ["heat-pipe"] = {},
        ["inserter"] = {},
        ["lab"] = {},
        ["lamp"] = {},
        ["land-mine"] = {},
        ["lightning-attractor"] = {},
        ["linked-container"] = {},
        ["market"] = {},
        ["mining-drill"] = {},
        ["offshore-pump"] = {},
        ["pipe"] =
        {
          ["infinity-pipe"] = {},
        },
        ["pipe-to-ground"] = {},
        ["player-port"] = {},
        ["power-switch"] = {},
        ["programmable-speaker"] = {},
        ["proxy-container"] = {},
        ["pump"] = {},
        ["radar"] = {},
        ["rail"] =
        {
          _abstract = true,
          ["curved-rail-a"] =
          {
            ["elevated-curved-rail-a"] = {},
          },
          ["curved-rail-b"] =
          {
            ["elevated-curved-rail-b"] = {},
          },
          ["half-diagonal-rail"] =
          {
            ["elevated-half-diagonal-rail"] = {},
          },
          ["legacy-curved-rail"] = {},
          ["legacy-straight-rail"] = {},
          ["rail-ramp"] = {},
          ["straight-rail"] =
          {
            ["elevated-straight-rail"] = {},
          },
        },
        ["rail-signal-base"] =
        {
          _abstract = true,
          ["rail-chain-signal"] = {},
          ["rail-signal"] = {},
        },
        ["rail-support"] = {},
        ["reactor"] = {},
        ["roboport"] = {},
        ["segment"] =
        {
          ["segmented-unit"] = {},
        },
        ["simple-entity-with-owner"] =
        {
          ["simple-entity-with-force"] = {},
        },
        ["solar-panel"] = {},
        ["space-platform-hub"] = {},
        ["spider-leg"] = {},
        ["spider-unit"] = {},
        ["storage-tank"] = {},
        ["thruster"] = {},
        ["train-stop"] = {},
        ["transport-belt-connectable"] =
        {
          _abstract = true,
          ["lane-splitter"] = {},
          ["linked-belt"] = {},
          ["loader-base"] =
          {
            _abstract = true,
            ["loader-1x1"] = {},
            ["loader"] = {},
          },
          ["splitter"] = {},
          ["transport-belt"] = {},
          ["underground-belt"] = {},
        },
        ["turret"] =
        {
          ["ammo-turret"] = {},
          ["electric-turret"] = {},
          ["fluid-turret"] = {},
        },
        ["unit"] = {},
        ["valve"] = {},
        ["vehicle"] =
        {
          _abstract = true,
          ["car"] = {},
          ["rolling-stock"] =
          {
            _abstract = true,
            ["artillery-wagon"] = {},
            ["cargo-wagon"] =
            {
              ["infinity-cargo-wagon"] = {},
            },
            ["fluid-wagon"] = {},
            ["locomotive"] = {},
          },
          ["spider-vehicle"] = {},
        },
        ["wall"] = {},
      },
      ["fish"] = {},
      ["simple-entity"] = {},
      ["tree"] =
      {
        ["plant"] = {},
      },
    },
    ["explosion"] = {},
    ["fire"] = {},
    ["stream"] = {},
    ["highlight-box"] = {},
    ["item-entity"] = {},
    ["item-request-proxy"] = {},
    ["lightning"] = {},
    ["particle-source"] = {},
    ["projectile"] = {},
    ["resource"] = {},
    ["rocket-silo-rocket"] = {},
    ["rocket-silo-rocket-shadow"] = {},
    ["smoke"] =
    {
      _abstract = true,
      ["smoke-with-trigger"] = {},
    },
    ["speech-bubble"] = {},
    ["sticker"] = {},
    ["tile-ghost"] = {},
  },
  ["equipment-category"] = {},
  ["equipment-grid"] = {},
  ["equipment"] =
  {
    _abstract = true,
    ["active-defense-equipment"] = {},
    ["battery-equipment"] = {},
    ["belt-immunity-equipment"] = {},
    ["electric-energy-interface-equipment"] = {},
    ["energy-shield-equipment"] = {},
    ["equipment-ghost"] = {},
    ["generator-equipment"] = {},
    ["inventory-bonus-equipment"] = {},
    ["movement-bonus-equipment"] = {},
    ["night-vision-equipment"] = {},
    ["roboport-equipment"] = {},
    ["solar-panel-equipment"] = {},
  },
  ["fluid"] = {},
  ["font"] = {},
  ["fuel-category"] = {},
  ["god-controller"] = {},
  ["gui-style"] = {},
  ["impact-category"] = {},
  ["item-group"] = {},
  ["item-subgroup"] = {},
  ["item"] =
  {
    ["ammo"] = {},
    ["capsule"] = {},
    ["gun"] = {},
    ["item-with-entity-data"] = {},
    ["item-with-label"] =
    {
      ["item-with-inventory"] =
      {
        ["blueprint-book"] = {},
      },
      ["item-with-tags"] = {},
      ["selection-tool"] =
      {
        ["blueprint"] = {},
        ["copy-paste-tool"] = {},
        ["deconstruction-item"] = {},
        ["spidertron-remote"] = {},
        ["upgrade-item"] = {},
      },
    },
    ["module"] = {},
    ["rail-planner"] = {},
    ["space-platform-starter-pack"] = {},
    ["tool"] =
    {
      ["armor"] = {},
      ["repair-tool"] = {},
    },
  },
  ["map-gen-presets"] = {},
  ["map-settings"] = {},
  ["mod-data"] = {},
  ["module-category"] = {},
  ["mouse-cursor"] = {},
  ["noise-expression"] = {},
  ["noise-function"] = {},
  ["particle"] =
  {
    _abstract = true,
    ["optimized-particle"] = {},
  },
  ["procession-layer-inheritance-group"] = {},
  ["procession"] = {},
  ["quality"] = {},
  ["recipe-category"] = {},
  ["recipe"] = {},
  ["remote-controller"] = {},
  ["resource-category"] = {},
  ["shortcut"] = {},
  ["sound"] = {},
  ["space-connection"] = {},
  ["space-location"] =
  {
    ["planet"] = {},
  },
  ["spectator-controller"] = {},
  ["sprite"] = {},
  ["surface-property"] = {},
  ["surface"] = {},
  ["technology"] = {},
  ["tile-effect"] = {},
  ["tile"] = {},
  ["tips-and-tricks-item-category"] = {},
  ["tips-and-tricks-item"] = {},
  ["trigger-target-type"] = {},
  ["trivial-smoke"] = {},
  ["tutorial"] = {},
  ["utility-constants"] = {},
  ["utility-sounds"] = {},
  ["utility-sprites"] = {},
  ["virtual-signal"] = {},
}
return hierarchy

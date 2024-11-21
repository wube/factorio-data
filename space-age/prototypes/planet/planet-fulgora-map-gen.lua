--[[
Objectives:
Fairly narrow channels of dark sand between regions that require elevated rail to not be uniformly stright.
Wide channels of sand between plateaus that are too far for big power poles.
Plateaus sizes that are big enough for a few train stops + ramps and either a mining outpost or a production line, but not much more.
Natural areas have more space but no resources.
Sparse city areas have wide low richness resource patches.
Vault islands have a small island with a moat so are difficult to build on, but have an extreme richness resource patch

chebyshev ◇ diamond, max(abs(x), abs(y))
manhattan □ square, abs(x) + abs(y)
euclidean ○ circle, (x^2 + y^2)^0.5
minkowski3  ▢ rounded square, (x^3 + y^3)^(1/3)

The starting island is a natural island. It can merge with a vault island, but to prevent a vault bridge to mainland,
the starting island also needs to have a moat.
The natural area of the starting island should override the vault content if the overlap too much.
]]

data:extend
{
  { -- The grid sze for the voronoi. As most other noise is scaled based on this it acts like terrain segmentation, but the value has a specific meaning.
    -- 200 is ideal. 180-ish is the minimim viable size.
    type = "noise-expression",
    name = "fulgora_grid",
    expression = "175 - slider_to_linear(control:fulgora_islands:frequency, -50, 50)",
  },
  { -- the starting area cone, slightly larger diameter than a grid cell.
    type = "noise-expression",
    name = "fulgora_starting_cone",
    expression = "max(0, starting_spot_at_angle{angle = map_seed / 360,\z
                                                distance = fulgora_grid / 30,\z
                                                radius = fulgora_grid / 1.8,\z
                                                x_distortion = 1 * fulgora_wobble_x,\z
                                                y_distortion = 1 * fulgora_wobble_y},\z
                         starting_spot_at_angle{angle = map_seed / 360,\z
                                                distance = 1,\z
                                                radius = fulgora_grid / 4,\z
                                                x_distortion = 0.25 * fulgora_wobble_x,\z
                                                y_distortion = 0.25 * fulgora_wobble_y})",
  },
  { -- the starting area cone, slightly larger diameter than a grid cell.
    type = "noise-expression",
    name = "fulgora_starting_vault_cone",
    expression = "max(0, starting_spot_at_angle{angle = map_seed / 360 + 180,\z
                                                distance = fulgora_grid / 1.8,\z
                                                radius = fulgora_grid / 1.8,\z
                                                x_distortion = 1 * fulgora_wobble_x,\z
                                                y_distortion = 1 * fulgora_wobble_y})",
  },
  {
    type = "noise-expression",
    name = "fulgora_starting_mask",
    expression = "(fulgora_starting_cone - fulgora_starting_vault_cone) > 0",
  },
  {
    type = "noise-expression",
    name = "fulgora_starting_vault_mask",
    expression = "(fulgora_starting_vault_cone - fulgora_starting_cone) > 0",
  },
  { -- Controls the X Y input wobble effect.
    type = "noise-expression",
    name = "fulgora_wobble_influence",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.5,\z
                                    seed0 = map_seed,\z
                                    seed1 = 1,\z
                                    octaves = 3,\z
                                    input_scale = 128 / fulgora_grid / 20 ,\z
                                    output_scale = 3}",
  },
  { -- We usually want a lot of wobble or none at all, so influence has a high outpus scale and then we clamp it.
    type = "noise-expression",
    name = "fulgora_wobble_mask",
    expression = "clamp(fulgora_wobble_influence + 0.6, 0, 1)",
  },

  { -- generate X input distortion
    type = "noise-expression",
    name = "fulgora_wobble_x", -- only add to input X or Y
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'fulgora_wobble_x',\z
                                    octaves = 4,\z
                                    input_scale = 5 / fulgora_grid,\z
                                    output_scale = fulgora_grid * 0.07}"
  },
  { -- generate y input distortion
    type = "noise-expression",
    name = "fulgora_wobble_y", -- only add to input X or Y
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'fulgora_wobble_y',\z
                                    octaves = 4,\z
                                    input_scale = 5 / fulgora_grid,\z
                                    output_scale = fulgora_grid * 0.07}"
  },

  { -- offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "fulgora_ox",
    expression = "x + fulgora_grid / 2"
  },
  { -- offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "fulgora_oy",
    expression = "y + fulgora_grid / 2"
  },

  { -- distorted x. Also offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "fulgora_wx",
    expression = "fulgora_ox + fulgora_wobble_x * fulgora_wobble_mask"
  },
  { -- distorted y. Also offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "fulgora_wy",
    expression = "fulgora_oy + fulgora_wobble_y * fulgora_wobble_mask"
  },

  { -- The main basis noise for natural areas
    type = "noise-expression",
    name = "fulgora_basis",
    expression = "multioctave_noise{x = fulgora_wx,\z
                                    y = fulgora_wy,\z
                                    persistence = 0.5,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'fulgora_basis',\z
                                    octaves = 6,\z
                                    input_scale = 128 / fulgora_grid / 7.5,\z
                                    output_scale = 0.5}",
  },
  { -- How much voronoi points are offset in their grid square.
    type = "noise-expression",
    name = "fulgora_jitter",
    expression = "0.6",
  },
  { -- Cell ids for the main voronoi islands
    type = "noise-expression",
    name = "fulgora_cells",
    expression = "voronoi_cell_id{x = fulgora_wx,\z
                                  y = fulgora_wy,\z
                                  seed0 = map_seed,\z
                                  seed1 = 'fulgora_cells',\z
                                  grid_size = fulgora_grid,\z
                                  distance_type = 'manhattan',\z
                                  jitter = fulgora_jitter}",
  },
  { -- Pyramids for the main voronoi islands
    type = "noise-expression",
    name = "fulgora_pyramids",
    expression = "voronoi_pyramid_noise{x = fulgora_wx,\z
                                        y = fulgora_wy,\z
                                        seed0 = map_seed,\z
                                        seed1 = 'fulgora_cells',\z
                                        grid_size = fulgora_grid,\z
                                        distance_type = 'manhattan',\z
                                        jitter = fulgora_jitter}",
  },
  { -- Spots for the main voronoi islands (vaults only). Spots are inverted cones
    type = "noise-expression",
    name = "fulgora_spots",
    expression = "voronoi_spot_noise{x = fulgora_ox + fulgora_wobble_x / 2,\z
                                     y = fulgora_oy + fulgora_wobble_y / 2,\z
                                     seed0 = map_seed,\z
                                     seed1 = 'fulgora_cells',\z
                                     grid_size = fulgora_grid,\z
                                     distance_type = 'euclidean',\z
                                     jitter = fulgora_jitter}",
  },
  { -- Spots for the main voronoi islands (vaults only). Spots are cones
    type = "noise-expression",
    name = "fulgora_spots_inv",
    expression = "1 - fulgora_spots",
  },
  { -- Cells that are blank and will become oil ocean
    type = "noise-expression",
    name = "fulgora_blanks",
    expression = "fulgora_cells < 0.33",
  },
  { -- Treat some islands as natural
    type = "noise-expression",
    name = "fulgora_mesa",
    expression = "fulgora_cells > 0.75",
  },
  { -- Cells that have sprawling settlement islands
    type = "noise-expression",
    name = "fulgora_sprawl",
    expression = "(fulgora_cells > 0.5) - fulgora_mesa",
  },
  { -- Cells that have vault islands with moats
    type = "noise-expression",
    name = "fulgora_vaults",
    expression = "1 - fulgora_blanks - fulgora_sprawl - fulgora_mesa",
  },
  { -- Cells that have vault islands with moats
    type = "noise-expression",
    name = "fulgora_vaults_and_starting_vault",
    expression = "max(fulgora_vaults, fulgora_starting_vault_mask)",
  },
  { -- The natural landscape distribution
    type = "noise-expression",
    name = "fulgora_natural",
    expression = "fulgora_basis * 2 * slider_rescale(control:fulgora_islands:size,  2) - 0.85",
  },
  { -- Pyramids restricted to sprawl cells plus mesas altered by oil basis
    type = "noise-expression",
    name = "fulgora_sprawl_pyramids",
    expression = "fulgora_pyramids\z
                  * (fulgora_sprawl\z
                     + fulgora_mesa * min(1, abs(0.9 - 0.2 * fulgora_basis_oil + 0.05 * fulgora_rock)))",
  },
  { -- Pyramids restricted to vault cells
    type = "noise-expression",
    name = "fulgora_vault_pyramids",
    expression = "max(fulgora_vaults * fulgora_pyramids, 0.5 * fulgora_starting_vault_cone)",
  },
  {
    type = "noise-expression",
    name = "fulgora_vault_pyramids_and_start",
    expression = "max(fulgora_vault_pyramids, 0.5 * fulgora_starting_cone)",
  },
  { -- The moats of vault cells. These take chunks out of other terrain. The depths is to ensure that there's some oil ocean in the oil sand.
    type = "noise-expression",
    name = "fulgora_moats",
    expression = "min(fulgora_artificial_cap, 1.5 * max(-0.05 -fulgora_vault_pyramids_and_start * 2, (fulgora_vault_pyramids_and_start - 0.35) * 2))",
  },
  { -- The upper limit of pyramids, making them plateaus instead.
    type = "noise-expression",
    name = "fulgora_artificial_cap",
    expression = "0.25",
  },
  { -- Get sprawl pyramids to the correct level to mix with the natural landscape
    type = "noise-expression",
    name = "fulgora_mix_pyramids",
    expression = "min(fulgora_artificial_cap, (fulgora_sprawl_pyramids - 0.185) * 4)",
  },
  { -- Mix the sprawl and natural landscape together
    type = "noise-expression",
    name = "fulgora_mix_natural",
    expression = "max(fulgora_natural, fulgora_mix_pyramids)",
  },
  { -- Compare the sprawl and natural landscape heights to make a mask for what is natural and what is not. Vault cells are also removed.
    type = "noise-expression",
    name = "fulgora_natural_mask",
    expression = "max(min(fulgora_natural > fulgora_mix_pyramids, 1 - fulgora_vaults_and_starting_vault), fulgora_starting_mask)",
  },
  { -- Compare the sprawl and natural landscape heights to make a mask for what is natural and what is not. Vault cells are also removed.
    type = "noise-expression",
    name = "fulgora_natural_and_mesa_mask",
    expression = "max(fulgora_natural_mask, fulgora_mesa)",
  },
  { -- Make a mask for sprawl area, essentially just sprawl cells minus the natural mask.
    type = "noise-expression",
    name = "fulgora_sprawl_mask",
    expression = "max(0, fulgora_sprawl - fulgora_natural_mask)",
  },
  { -- Cut vault moats out of the landscape
    type = "noise-expression",
    name = "fulgora_mix_moats",
    expression = "lerp(fulgora_mix_natural, fulgora_moats, max(fulgora_vaults_and_starting_vault, fulgora_starting_mask))",
  },
  { -- Make vault spots into small roundish plateaus with a consistent size for consistent resources.
    -- normal spot inverse is roughly 0.5 to 1, but the lower bound can be a bit less in corners.
    -- blending in the starting spot properly required a 0.5 bump.
    type = "noise-expression",
    name = "fulgora_vault_spots",
    expression = "min(fulgora_artificial_cap,\z
                      -10 + 11.5 * max(fulgora_vaults * fulgora_spots_inv,\z
                                       fulgora_starting_vault_mask * (0.5 + 0.5 * fulgora_starting_vault_cone),\z
                                       fulgora_starting_mask * (0.5 + 0.5 * fulgora_starting_cone)))",
  },
  { -- Apply vault spots to the landscape
    type = "noise-expression",
    name = "fulgora_mix_spots",
    expression = "max(fulgora_mix_moats, fulgora_vault_spots) + max(0, fulgora_starting_cone - 0.8)",
  },
  { -- A mask for low oil areas, i.e. oil sand and oil ocean. Later sand basins will be also be below 0 (to have inner cliffs), but will not be in the oil mask
    type = "noise-expression",
    name = "fulgora_oil_mask",
    expression = "fulgora_mix_spots < 0",
  },
  { -- not oil, not natural
    type = "noise-expression",
    name = "fulgora_artificial_mask",
    expression = "1 - max(fulgora_oil_mask, fulgora_natural_and_mesa_mask)",
  },
  { -- Noise to break up the oil areas. This gets heavily distorted.
    type = "noise-expression",
    name = "fulgora_basis_oil",
    expression = "multioctave_noise{x = x + 1.5 * fulgora_wobble_x,\z
                                    y = y + 1.5 * fulgora_wobble_y,\z
                                    persistence = 0.65,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'fulgora_basis_oil',\z
                                    octaves = 4,\z
                                    input_scale = 1 / 10}",
  },
  {  -- Apply oil noise to the oil mask areas, but make sure it doens't make oil areas positive
    type = "noise-expression",
    name = "fulgora_mix_oil",
    expression = "lerp(fulgora_mix_spots, min(-0.01, fulgora_mix_spots - 0.4 + 0.6 * fulgora_basis_oil), fulgora_oil_mask)",
  },
  { -- We want cliffs right on the coast edge but to do that we need to move the coastline elevation above 0
    type = "noise-expression",
    name = "fulgora_coastline",
    expression = 80,
  },
  { -- Make a large elevation change at the coast so that that the janky cliff smothing does mot mess up
    type = "noise-expression",
    name = "fulgora_coastline_drop",
    expression = 20,
  },
  { -- Invert the heightfield above a certain elevation so that natural inland sand areas form bowls with cliffs facing inwards instead of outwards.
    -- This does make inland areas negative elevation, so we will need to use the oil mask so that liquids don't go here.
    type = "noise-expression",
    name = "fulgora_sand_basins",
    expression = "min(fulgora_mix_oil, 0.6 - fulgora_mix_oil)",
  },
  { -- Make the initial elevation. The elevation rate should be such that the 2nd level of cliffs are where the inner sand basin cliffs are now.
    type = "noise-expression",
    name = "fulgora_pre_elevation",
    expression = "fulgora_sand_basins * 60 + fulgora_coastline"
  },
  { -- Make the final elevation by applying the coastal cliff drop
    type = "noise-expression",
    name = "fulgora_elevation",
    --intended_property = "elevation",
    expression = "fulgora_pre_elevation + ((fulgora_sand_basins > 0) - 0.5) * fulgora_coastline_drop"
  }
} -- End elevation

--[[
  Scrap and machinery tiles share a tech pattern.
  walls and paving can be more wide spread, even appearing on the natural island is small areas.
  Rock is mainly on island edges
  Dust is mainly as deserts in the middle of natural islands.
  Dunes and flat sand are the default and have their own mix.
]]
data:extend
{
  { -- Make the final elevation by applying the coastal cliff drop
    type = "noise-expression",
    name = "fulgora_cliffiness",
    --intended_property = "cliffiness",
    expression = "8 * slider_rescale(cliff_richness, 20)\z
                  * (fulgora_road_pyramids - 0.1 + max(0, 1 - 10 * fulgora_wobble_mask))\z
                  - 1000 * safe_start_excluder_h",
    local_expressions =
    {
      safe_start_excluder_h = "min(x_from_start < fulgora_grid, x_from_start > -fulgora_grid, y_from_start < 5, y_from_start > -5)"
    }
  },
  { -- used for tiles and resources
    type = "noise-expression",
    name = "fulgora_scrap_small",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'fulgora_scrap_small',\z
                                    octaves = 3,\z
                                    input_scale = 1/9}"
  },
  { -- used for tiles and resources
    type = "noise-expression",
    name = "fulgora_scrap_medium",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'fulgora_scrap_medium',\z
                                    octaves = 3,\z
                                    input_scale = 1/18}"
  },
  { -- Ridged noise for walls
    type = "noise-expression",
    name = "fulgora_ruins_walls",
    expression = "0.66 - abs(multioctave_noise{x = x,\z
                                               y = y,\z
                                               persistence = 0.7,\z
                                               seed0 = map_seed,\z
                                               seed1 = 'fulgora_ruins_walls',\z
                                               octaves = 3,\z
                                               input_scale = 1/6})"
  },
  { -- Billows noise for paving
    type = "noise-expression",
    name = "fulgora_ruins_paving",
    expression = "abs(multioctave_noise{x = x,\z
                                        y = y,\z
                                        persistence = 0.7,\z
                                        seed0 = map_seed,\z
                                        seed1 = 'fulgora_ruins_paving',\z
                                        octaves = 3,\z
                                        input_scale = 1/16})"
  },
  {
    type = "noise-expression",
    name = "fulgora_road_jitter",
    expression = 1
  },
  { -- The medium scale road grid cells. Swaps internal small road patterns.
    type = "noise-expression",
    name = "fulgora_road_cells",
    expression = "voronoi_cell_id{x = x,\z
                                  y = y,\z
                                  seed0 = map_seed,\z
                                  seed1 = 'fulgora_road_cells',\z
                                  grid_size = fulgora_grid / 3,\z
                                  distance_type = 'chebyshev',\z
                                  jitter = fulgora_road_jitter}",
  },
  { -- The medium scale road grid pyramids. Required for the main roads.
    type = "noise-expression",
    name = "fulgora_road_pyramids",
    expression = "voronoi_pyramid_noise{x = x,\z
                                        y = y,\z
                                        seed0 = map_seed,\z
                                        seed1 = 'fulgora_road_cells',\z
                                        grid_size = fulgora_grid / 3,\z
                                        distance_type = 'chebyshev',\z
                                        jitter = fulgora_road_jitter}",
  },
  { -- Banding the main pyramids for road pattern B
    type = "noise-expression",
    name = "fulgora_pyramids_banding",
    expression = "(fulgora_pyramids * 8) % 1"
  },
  { -- The multiplier for road pattern C. Needed for the road pattern but also the district center cutout.
    type = "noise-expression",
    name = "fulgora_spots_prebanding",
    expression = "min(fulgora_spots, (1 - fulgora_starting_vault_cone) / 2) * 9 + 0.5"
  },
  { -- Banding the main spots for road pattern C
    type = "noise-expression",
    name = "fulgora_spots_banding",
    expression = "fulgora_spots_prebanding % 1"
  },
  {
    type = "noise-expression",
    name = "fulgora_structure_jitter",
    expression = 0.8
  },
  { -- Cells for the smallest scale voronoi for individual structure blocks.
    type = "noise-expression",
    name = "fulgora_structure_cells",
    expression = "voronoi_cell_id{x = x,\z
                                  y = y * 0.8,\z
                                  seed0 = map_seed,\z
                                  seed1 = 'fulgora_structure_cells',\z
                                  grid_size = fulgora_grid / 8,\z
                                  distance_type = 'minkowski3',\z
                                  jitter = fulgora_structure_jitter}",
  },
  {
    type = "noise-expression",
    name = "fulgora_structure_subnoise",
    expression = "multioctave_noise{x = x + 10000 * fulgora_structure_cells,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'fulgora_structure_subnoise',\z
                                    octaves = 3,\z
                                    input_scale = 1/12}"
  },
  { -- Facets for the smallest scale voronoi for individual structure blocks. This is mainly for the small road pattern A.
    type = "noise-expression",
    name = "fulgora_structure_facets",
    expression = "voronoi_facet_noise{x = x,\z
                                      y = y * 0.8,\z
                                      seed0 = map_seed,\z
                                      seed1 = 'fulgora_structure_cells',\z
                                      grid_size = fulgora_grid / 8,\z
                                      distance_type = 'minkowski3',\z
                                      jitter = fulgora_structure_jitter}",
  },
  {  -- A simple version or large roads and small roads
    type = "noise-expression",
    name = "fulgora_road_paving_thin",
    expression = "max((fulgora_road_pyramids < 0.03) * 0.9, (fulgora_structure_facets < 0.06) * 0.5)",
  },
  { -- Part 1 of complicated paving. Large roads, and small roads split into the 3 patterns based on fulgora_road_cells ID
    type = "noise-expression",
    name = "fulgora_road_paving_2",
    expression = "max((fulgora_road_pyramids < 0.05) * 0.9,\z
                      (fulgora_pyramids_banding < 0.1) * 0.85 * (fulgora_road_cells < 0.6) * (fulgora_road_cells > 0.25),\z
                      (fulgora_spots_banding < 0.1) * 0.85 * (fulgora_road_cells < 0.25),\z
                      (fulgora_structure_facets < 0.1) * 0.85 * (fulgora_road_cells > 0.6))",
  },
  { -- Part 2 of complicated paving. Cut out some structure blocks.
    type = "noise-expression",
    name = "fulgora_road_paving_2b",
    expression = "lerp(fulgora_road_paving_2, (fulgora_structure_facets < 0.2) * 0.9, fulgora_structure_cells > 0.8)",
  },
  { -- Part 3 of complicated paving. Cut out district centers.
    type = "noise-expression",
    name = "fulgora_road_paving_2c",
    expression = "lerp(fulgora_road_paving_2b, (fulgora_spots_prebanding > 1) * 0.9, fulgora_spots_prebanding < 1.3)",
  },
  { -- Dust at the edge of large roads
    type = "noise-expression",
    name = "fulgora_road_dust",
    expression = "(fulgora_road_pyramids < 0.08) * 0.9 - fulgora_road_paving_2c",
  },
  { -- Dunes ridge noise.
    type = "noise-expression",
    name = "fulgora_dunes",
    expression = "0.66 - abs(multioctave_noise{x = x,\z
                                               y = y,\z
                                               persistence = 0.7,\z
                                               seed0 = map_seed,\z
                                               seed1 = 'fulgora_dunes',\z
                                               octaves = 3,\z
                                               input_scale = 1/6 })"
  },
  { -- Rock billows noise.
    type = "noise-expression",
    name = "fulgora_rock",
    expression = "0.33 + abs(multioctave_noise{x = x,\z
                                               y = y,\z
                                               persistence = 0.7,\z
                                               seed0 = map_seed,\z
                                               seed1 = 'fulgora_rock',\z
                                               octaves = 4,\z
                                               input_scale = 1/3 })"
  },
}

data:extend
{
  {
    type = "noise-expression",
    name = "fulgora_tile_ruin_paving",
    expression = "max(fulgora_natural_and_mesa_mask * (3 * fulgora_ruins_paving * fulgora_road_paving_thin - 0.5),\z
                      fulgora_artificial_mask * (4 * fulgora_road_paving_2c + fulgora_ruins_paving - 1))"
  },
  {
    type = "noise-expression",
    name = "fulgora_tile_ruin_walls",
    expression = "max(fulgora_natural_and_mesa_mask * (2 * fulgora_ruins_walls + fulgora_ruins_paving - 0.5),\z
                      fulgora_artificial_mask * (0.25 * fulgora_ruins_walls\z
                                                 + 0.25 * fulgora_structure_subnoise\z
                                                 - 4 * fulgora_structure_facets\z
                                                 - fulgora_road_paving_2c\z
                                                 + 2.5))"
  },
  {
    type = "noise-expression",
    name = "fulgora_tile_ruin_conduit",
    expression = "fulgora_artificial_mask * (fulgora_ruins_walls\z
                                             + fulgora_structure_subnoise \z
                                             + 2 * fulgora_structure_facets\z
                                             - fulgora_road_paving_2c\z
                                             + 0.2\z
                                             + 0.3 * fulgora_vaults_and_starting_vault) - fulgora_road_paving_2c"
  },
  {
    type = "noise-expression",
    name = "fulgora_tile_ruin_machinery",
    expression = "fulgora_artificial_mask * (-fulgora_ruins_walls\z
                                             + 1.25 * fulgora_structure_subnoise\z
                                             + 2.5 * fulgora_structure_facets\z
                                             - fulgora_road_paving_2c\z
                                             - 0.2\z
                                             + 0.3 * fulgora_vaults_and_starting_vault\z
                                             + 2 * (fulgora_spots_prebanding < 1)) - fulgora_road_paving_2c"
  },
  {
    type = "noise-expression",
    name = "fulgora_decorative_machine_density",
    expression = "max(fulgora_tile_ruin_walls, fulgora_tile_ruin_conduit * 2, fulgora_tile_ruin_machinery * 3)"
  }
}

-- scrap should be dense on the smallest islands (++), sparse on the mid islands, (+- and -+)
data.raw.resource.scrap.autoplace =
{
  control = "scrap",
  order = "b",
  probability_expression = "(control:scrap:size > 0)\z
                            * (1 - fulgora_starting_mask)\z
                            * (min((fulgora_structure_cells < min(0.1 * frequency, 0.05 + 0.05 * frequency))\z
                               * (1 + fulgora_structure_subnoise) * abs_mult_height_over * fulgora_artificial_mask\z
                               + (fulgora_spots_prebanding < (1.2 + 0.4 * linear_size)) * fulgora_vaults_and_starting_vault * 10,\z
                               0.5) * (1 - fulgora_road_paving_2c))",
  richness_expression = "(1 + fulgora_structure_subnoise) * 1000 * (7 / (6 + frequency) + 100 * fulgora_vaults_and_starting_vault) * richness",
  local_expressions =
  {
    abs_mult_height_over = "fulgora_elevation > (fulgora_coastline + 10)", -- Resources prevent cliffs from spawning. This gets resources away from cliffs.
    frequency = "control:scrap:frequency", -- limited application
    size = "control:scrap:size", -- Size also affects noise peak height so impacts richness as a sideeffect...
    linear_size = "slider_to_linear(size, -1, 1)", -- the intetion is to increase coverage (access & mining speed) without significantly affecting richness.
    richness = "control:scrap:richness"
  }
}

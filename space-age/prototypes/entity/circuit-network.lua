
circuit_connector_definitions["foundry"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 27, main_offset = util.by_pixel(15, -50.5), shadow_offset = util.by_pixel(115, 32), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(15, -50.5), shadow_offset = util.by_pixel(115, 32), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(15, -50.5), shadow_offset = util.by_pixel(115, 32), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(15, -50.5), shadow_offset = util.by_pixel(115, 32), show_shadow = false }
  }
)

circuit_connector_definitions["biochamber"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
    { variation = 17, main_offset = util.by_pixel( -37, 24), shadow_offset = util.by_pixel( -29, 28), show_shadow = false },
  }
)

circuit_connector_definitions["electromagnetic-plant"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false },
    { variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false },
    { variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false },
    { variation = 7, main_offset = util.by_pixel(-27, 53), shadow_offset = util.by_pixel(-18, 55), show_shadow = false }
  }
)

circuit_connector_definitions["biolab"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 27, main_offset = util.by_pixel(68, -37), shadow_offset = util.by_pixel(100, -5), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(68, -37), shadow_offset = util.by_pixel(100, -5), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(68, -37), shadow_offset = util.by_pixel(100, -5), show_shadow = false },
    { variation = 27, main_offset = util.by_pixel(68, -37), shadow_offset = util.by_pixel(100, -5), show_shadow = false }
  }
)

circuit_connector_definitions["cryogenic-plant"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 33, main_offset = util.by_pixel(20, 5), shadow_offset = util.by_pixel(66, 45), show_shadow = false },
    { variation = 33, main_offset = util.by_pixel(20, 5), shadow_offset = util.by_pixel(66, 45), show_shadow = false },
    { variation = 33, main_offset = util.by_pixel(20, 5), shadow_offset = util.by_pixel(66, 45), show_shadow = false },
    { variation = 33, main_offset = util.by_pixel(20, 5), shadow_offset = util.by_pixel(66, 45), show_shadow = false }
  }
)

circuit_connector_definitions["asteroid-collector"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 0, main_offset = util.by_pixel(  4.0, -36.5), shadow_offset = util.by_pixel(27,-10), show_shadow = false },
    { variation = 6, main_offset = util.by_pixel( 18.5, -19.0), shadow_offset = util.by_pixel(49,  4), show_shadow = false },
    { variation = 4, main_offset = util.by_pixel( -4.0, -10.0), shadow_offset = util.by_pixel(20, 13), show_shadow = false },
    { variation = 2, main_offset = util.by_pixel(-19.0, -25.5), shadow_offset = util.by_pixel( 4,  0), show_shadow = false }
  }
)

circuit_connector_definitions["big-mining-drill"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 0, main_offset = util.by_pixel( 73, -58), shadow_offset = util.by_pixel(112, -23), show_shadow = true },
    { variation = 6, main_offset = util.by_pixel( 50.5, 19.5), shadow_offset = util.by_pixel( 77.5, 52.5), show_shadow = false },
    { variation = 4, main_offset = util.by_pixel(-72, 8), shadow_offset = util.by_pixel(-33, 52), show_shadow = false },
    { variation = 2, main_offset = util.by_pixel(-50.5, 12), shadow_offset = util.by_pixel(-33.5, 42), show_shadow = false }
  }
)

circuit_connector_definitions["crusher"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 18, main_offset = util.by_pixel( 14, 23), shadow_offset = util.by_pixel( 14, 28), show_shadow = true },
    { variation = 16, main_offset = util.by_pixel(-36,  5), shadow_offset = util.by_pixel(-33,  7), show_shadow = false },
    { variation = 18, main_offset = util.by_pixel( 14, 23), shadow_offset = util.by_pixel( 14, 28), show_shadow = true },
    { variation = 16, main_offset = util.by_pixel(-36,  5), shadow_offset = util.by_pixel(-33,  7), show_shadow = false }
  }
)

circuit_connector_definitions["heating-tower"] = circuit_connector_definitions.create_single
(
  universal_connector_template,
  { variation = 30, main_offset = util.by_pixel(-12, 17), shadow_offset = util.by_pixel(10, 30), show_shadow = false }
)

circuit_connector_definitions["rocket-turret"] = circuit_connector_definitions.create_vector -- TurretPrototype takes vector
(
  universal_connector_template,
  {
    { variation = 17, main_offset = util.by_pixel( -18, 13), shadow_offset = util.by_pixel( -12, 25), show_shadow = false }
  }
)

circuit_connector_definitions["tesla-turret"] = circuit_connector_definitions["rocket-turret"] -- TODO: add proper definition for tesla-turret

circuit_connector_definitions["railgun-turret"] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 0, main_offset = util.by_pixel(  1.5,  -5.5), shadow_offset = util.by_pixel( 51.5,  44.5), show_shadow = false },
    { variation = 7, main_offset = util.by_pixel(  -30,   -22), shadow_offset = util.by_pixel(   20,    28), show_shadow = false },
    { variation = 6, main_offset = util.by_pixel(  -43,   -43), shadow_offset = util.by_pixel(  -13,     7), show_shadow = false },
    { variation = 5, main_offset = util.by_pixel(  -32, -68.5), shadow_offset = util.by_pixel(   18, -17.5), show_shadow = false },
    { variation = 4, main_offset = util.by_pixel(   -1,   -69), shadow_offset = util.by_pixel(   49,   -19), show_shadow = false },
    { variation = 3, main_offset = util.by_pixel(   27,   -65), shadow_offset = util.by_pixel(   66,   -15), show_shadow = false },
    { variation = 2, main_offset = util.by_pixel(   46, -40.5), shadow_offset = util.by_pixel(   94,   9.5), show_shadow =  true },
    { variation = 1, main_offset = util.by_pixel(   32,   -17), shadow_offset = util.by_pixel(   85,    28), show_shadow = false }
  }
)

circuit_connector_definitions["space-platform-hub"] =
{
  points =
  {
    wire = { red = {2.566, 0.863}, green = {2.332, 1.027} },
    shadow = { red = {2.566 + 1.5, 0.863 + 1.5}, green = {2.332 + 1.5, 1.027 + 1.5} } -- TODO: to be adjusted
  }
}

circuit_connector_definitions["agricultural-tower"] = circuit_connector_definitions.create_single
(
  universal_connector_template,
  { variation = 30, main_offset = util.by_pixel(-7, 12), shadow_offset = util.by_pixel(-7, 12), show_shadow = true }
)

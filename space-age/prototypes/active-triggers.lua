local function make_tesla_chain_lightning_chain(name, beam_name, max_jumps, jump_range, fork_chance, fork_chance_per_quality, beam_duration)
  return {
    name = name,
    type = "chain-active-trigger",
    max_jumps = max_jumps,
    max_range_per_jump = jump_range,
    jump_delay_ticks = 6,
    fork_chance = fork_chance,
    fork_chance_increase_per_quality_level = fork_chance_per_quality,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "beam",
        beam = beam_name,
        max_length = jump_range + 0.5,
        duration = beam_duration,
        add_to_shooter = false,
        destroy_with_source_or_target = false,
        source_offset = {0, 0}, -- should match beam's target_offset
      },
    },
  }
end

data:extend(
{
  make_tesla_chain_lightning_chain("chain-tesla-turret-chain", "chain-tesla-turret-beam-bounce", 10, 12, 0.05, 0.05, 30),
  make_tesla_chain_lightning_chain("chain-tesla-gun-chain", "chain-tesla-gun-beam-bounce", 12, 12, 0.3, 0.05, 30),
})

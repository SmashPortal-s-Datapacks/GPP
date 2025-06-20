## gpp:player/advancement/sleep_exp
# Pattern matching for GPP sleep triggers
# Rewards GPP users who slept through the night
# @s -- This player

# say gpp:player/advancement/sleep_exp

# Add asleep tag to all players who are asleep
execute as @s[advancements={gpp:sleep={asleep=true}}] run tag @s add asleep

# Reward exp orbs to all players who slept through the night
execute as @s[advancements={gpp:sleep={awake=true}}] if predicate gpp:player_slept run function gpp:player/gpp/sleep_exp with entity @s {}

# Remove asleep tag from all players who have it
execute as @s[advancements={gpp:sleep={awake=true}}] run tag @s remove asleep

# Revoke all sleep-related advancements from this player
advancement revoke @s only gpp:sleep
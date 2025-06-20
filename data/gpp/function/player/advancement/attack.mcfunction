## gpp:player/advancement/attack
# Function for the attack advancement
# @s -- This player

# say gpp:player/advancement/attack

# Load this GPP
function gpp:player/gpp/get with entity @s {}

# Disable this GPP for this player if this GPP is invalid
function gpp:player/gpp/clear_if_invalid with storage gpp:storage this_gpp

# Reduce this player's GPP attack cooldown
execute as @s[advancements={gpp:attack=true},scores={gpp.attack.cooldown=1..}] run scoreboard players remove @s gpp.attack.cooldown 1

# Attempt to attack if this player's GPP attack cooldown reaches 0
execute as @s[scores={gpp.attack.cooldown=0}] run function gpp:player/gpp/target/attack

# Reset advancement
advancement revoke @s only gpp:attack
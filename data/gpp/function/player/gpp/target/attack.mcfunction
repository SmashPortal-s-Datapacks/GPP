## gpp:player/gpp/target/attack
# Damages attack target if there is one
# Seeks attack target if there isn't
# @s -- This player

# say gpp:player/gpp/target/attack

# Reset the attack cooldown to its base value
execute store result score @s gpp.attack.cooldown run data get storage gpp:storage this_gpp.attack.cooldown

# Damage the target if there is one
execute if data storage gpp:storage this_gpp.attack.target run function gpp:player/gpp/target/attack/damage with storage gpp:storage this_gpp.attack

# Seek an attack target if there is none
execute unless data storage gpp:storage this_gpp.attack.target run function gpp:player/gpp/target/set with entity @s {}

# Remove attack target if it no longer exists
function gpp:player/gpp/target/exists with storage gpp:storage this_gpp.attack

# Remove attack target after 10 attacks
execute as @s[scores={gpp.attack.count=10..}] run function gpp:player/gpp/target/remove with entity @s {}
## gpp:player/gpp/target/set
# Sets the attack target for this player's GPP
# @s -- This player

# say gpp:player/gpp/target/set

# Add target_mob tag to all unnamed mobs that are currently targeting a player and aren't on the blacklist
$execute as @e[type=!#gpp:target_blacklist,predicate=gpp:targeting_player] unless data entity @s CustomName run function gpp:mob/tag_if_aggro {UUID:$(UUID)}

# Set the nearest mob aggro'd on this player as the attack target for this player's GPP
$execute as @n[tag=gpp.aggro_mob] run function gpp:mob/target {UUID:$(UUID)}

# Remove aggro_mob tag from all entities that have it
tag @e[type=!#gpp:target_blacklist,tag=gpp.aggro_mob] remove gpp.aggro_mob
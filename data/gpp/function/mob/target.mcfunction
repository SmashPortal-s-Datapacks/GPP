## gpp:mob/target
# Sets this mob as the attack target of a player's GPP
# @s -- This mob
# $UUID -- The UUID of the player

# say gpp:mob/target

# Set the current player's GPP attack target to this mob
$data modify storage gpp:storage players[{UUID:$(UUID)}].gpp.attack.target set from entity @s UUID

# Add visible marker to this mob based on targeting player's GPP tier
$function gpp:mob/add_marker with storage gpp:storage players[{UUID:$(UUID)}].gpp
## gpp:player/gpp/target/remove
# Removes the marker from the target, then removes the target from this player's active GPP and zeroes its attack count
# @s -- This player

# say gpp:player/gpp/target/remove

# Remove the highlight from attack target
function gpp:player/gpp/target/remove_marker with storage gpp:storage this_gpp.attack

# Remove attack target from the scoreboard
$data remove storage gpp:storage players[{UUID:$(UUID)}].gpp.attack.target

# Reset attack count to 0/10
scoreboard players reset @s gpp.attack.count
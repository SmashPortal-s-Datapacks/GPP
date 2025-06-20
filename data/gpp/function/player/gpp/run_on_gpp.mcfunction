## gpp:player/gpp/run_on_gpp
# Run a function on this player's active GPP
# @s -- This player
# $fn -- The function to run

# say gpp:player/gpp/run_on_gpp

# Store this player's GPP data
function gpp:player/gpp/get with entity @s {}

# Run function with data from GPP
$function $(fn) with storage gpp:storage this_gpp
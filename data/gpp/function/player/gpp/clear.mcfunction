## gpp:player/gpp/clear
# Deactivates all GPPs in relation to this player and removes this player's GPP statuses
# @s -- This player

# say gpp:player/gpp/clear

# Remove this player from the list of players with an active GPP
$execute unless entity @n[type=minecraft:item,tag=gpp.item.toggle.target,tag=temp.gpp.activate] run data remove storage gpp:storage players[{gpp:{UUID:$(UUID)}}]

# Deactivate all ground GPP items
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gpp:{active:true}}}}}] run function gpp:entity/disable

# Deactivate all GPP items in this player's inventory
function gpp:player/inv/run {cmd:"function gpp:entity/disable",item:{components:{"minecraft:custom_data":{gpp:{active:true}}}}}

# Remove current target from this player
function gpp:player/gpp/target/remove with entity @s {}

# Untag this player from having an active GPP
tag @s remove gpp.active

# Reset GPP attack cooldown for this player
scoreboard players reset @s gpp.attack.cooldown
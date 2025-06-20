## gpp:player/gpp/item/reduce_durability
# Reduces the durability of this player's active GPP item
# @s -- This player
# $UUID -- The UUID of this player's active GPP

# say gpp:player/gpp/item/reduce_durability

# Store this GPP's current marked damage
$execute store result score *damage gpp.durability run data get entity @s Inventory[{components:{"minecraft:custom_data":{gpp:{UUID:$(UUID)}}}}].components."minecraft:damage"

# Increase the damage score on this player's active GPP, wherever it is in their inventory
$function gpp:player/inv/run {cmd:"execute store result entity @s Item.components.'minecraft:damage' int 1 run scoreboard players add *damage gpp.durability 1",item:{components:{"minecraft:custom_data":{gpp:{UUID:$(UUID)}}}}}

# Clear this player's active GPP if it's not in their inventory or has no durability remaining
function gpp:player/gpp/clear_if_invalid with storage gpp:storage this_gpp
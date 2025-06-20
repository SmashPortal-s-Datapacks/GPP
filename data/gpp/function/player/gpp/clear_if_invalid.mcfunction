## gpp:player/gpp/clear_if_invalid
# Clears this player's active GPP if it's not in their inventory or has no durability remaining
# @s -- This player
# $UUID -- The UUID of this player's active GPP

# say gpp:player/gpp/clear_if_gpp_invalid

# Run the GPP clear function on this player if their active GPP isn't in their inventory
$execute unless data entity @s Inventory[{components:{"minecraft:custom_data":{gpp:{UUID:$(UUID)}}}}] run function gpp:player/gpp/clear {UUID:$(UUID)}

# Store this GPP's max_damage attribute (then replace it with the vanilla attribute if it exists)
$execute store result score *max_damage gpp.durability run data get entity @s Inventory[{components:{"minecraft:custom_data":{gpp:{UUID:$(UUID)}}}}].components."minecraft:custom_data".max_damage
$execute if data entity @s Inventory[{components:{"minecraft:custom_data":{gpp:{UUID:$(UUID)}}}}].components."minecraft:max_damage" store result score *max_damage gpp.durability run data get entity @s Inventory[{components:{"minecraft:custom_data":{gpp:{UUID:$(UUID)}}}}].components."minecraft:max_damage"

# Store this GPP's current marked damage
$execute store result score *damage gpp.durability run data get entity @s Inventory[{components:{"minecraft:custom_data":{gpp:{UUID:$(UUID)}}}}].components."minecraft:damage"

# Run the GPP clear function on this player if their active GPP has damage marked on it greater than or equal to its durability
$execute if score *damage gpp.durability >= *max_damage gpp.durability run function gpp:player/gpp/clear {UUID:$(UUID)}
# gpp:player/gpp/toggle
# Copies the GPP item to a temporary entity, toggles its active state, then copies it back to the player's inventory slot
# @s -- This player
# $slot -- The inventory slot to run this command on

# say gpp:player/gpp/toggle

# Summon a temporary entity to copy the GPP item to
summon minecraft:item ~ -100 ~ {Item:{id:"minecraft:barrier",components:{"minecraft:custom_data":{item_ping:1b}}},Tags:["gpp.item.toggle.target","gpp.item.copy"]}

# Copy the GPP item data to the temporary entity
$item replace entity @n[type=minecraft:item,tag=gpp.item.toggle.target] contents from entity @s $(slot)

# Kill the temporary entity if the GPP item's data isn't copied over
execute if data entity @n[type=minecraft:item,tag=gpp.item.toggle.target] Item.components."minecraft:custom_data"{item_ping:1b} run kill @n[type=minecraft:item,tag=gpp.item.toggle.target]

# Add temp.gpp.activate tag to the temporary entity unless this player's GPP item is already active
execute as @n[type=minecraft:item,tag=gpp.item.toggle.target] unless data entity @s Item.components.minecraft:custom_data{gpp:{active:true}} run tag @s add temp.gpp.activate

# Set this player's GPP data to the temporary entity's data
function gpp:player/gpp/set with entity @s {}

# Run the clear function on this player, providing their current GPP to exclude
function gpp:player/gpp/clear with storage gpp:storage this_gpp

# Set the active state of the temporary entity relative to its current state
execute as @n[type=minecraft:item,tag=gpp.item.toggle.target,tag=temp.gpp.activate] run function gpp:entity/enable
execute as @n[type=minecraft:item,tag=gpp.item.toggle.target,tag=!temp.gpp.activate] run function gpp:entity/disable

# If the temporary entity has the temp.gpp.activate tag, tag this player with gpp.active, then store the GPP item's cooldown value to the player
execute if entity @n[type=minecraft:item,tag=gpp.item.toggle.target,tag=temp.gpp.activate] run tag @s add gpp.active
execute if entity @n[type=minecraft:item,tag=gpp.item.toggle.target,tag=temp.gpp.activate] run execute store result score @s gpp.attack.cooldown run data get storage gpp:storage this_gpp.attack.cooldown

# Remove the GPP item from $slot
$item replace entity @s $(slot) with minecraft:air

# Copy the temporary entity as a GPP item to $slot
$item replace entity @s $(slot) from entity @n[type=minecraft:item,tag=gpp.item.toggle.target,tag=gpp.item.copy] contents

# Kill the temporary entity
kill @e[type=minecraft:item,tag=gpp.item.toggle.target]
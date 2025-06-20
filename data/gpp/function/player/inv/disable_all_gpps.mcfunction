## gpp:player/inv/disable_all_gpps
# Disables all GPP items in this player's inventory, excluding this player's active GPP
# @s -- This player

# say gpp:player/inv/disable_all_gpps

# Reset storage for this_gpp and inventory
data remove storage gpp:storage this_gpp
data remove storage gpp:storage gpp.inventory

# Load storage for this_gpp
function gpp:player/gpp/get with entity @s {}

# Store the data of each active GPP item in this player's inventory to disable
data modify storage gpp:storage gpp.inventory.list append from entity @s Inventory[{components:{"minecraft:custom_data":{gpp:{active:true}}}}]

# Remove this player's current GPP item from the list of active GPPs to disable
function gpp:player/inv/disable_all_gpps/exclude with storage gpp:storage this_gpp

# Disable offhand GPP item if on the list, then remove it from the list
execute if data storage gpp:storage gpp.inventory.list[{Slot:-106b}] run function gpp:player/gpp/modify_item {cmd:"function gpp:entity/disable",slot:"weapon.offhand"}
data remove storage gpp:storage gpp.inventory.list[{Slot:-106b}]

# Set variables and run recur function if there are active GPP items in the list
execute if data storage gpp:storage gpp.inventory.list[0] run data modify storage gpp:storage gpp.inventory.data.slot set from storage gpp:storage gpp.inventory.list[0].Slot
execute if data storage gpp:storage gpp.inventory.list[0] run data modify storage gpp:storage gpp.inventory.data.cmd set value 'function gpp:entity/disable'
execute if data storage gpp:storage gpp.inventory.list[0] run function gpp:player/inv/run/recur with storage gpp:storage gpp.inventory.data
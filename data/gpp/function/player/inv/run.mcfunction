## gpp:player/inv/run
# Run a command on all slots in this player's inventory
# @s -- This player
# $item -- Item to match for running a command on
# $cmd -- Command to run on matching item

# say gpp:player/inv/run

# Clear inventory memory
data remove storage gpp:storage inventory

# Store all matching item slots
$data modify storage gpp:storage inventory.list append from entity @s Inventory[$(item)]

# Run command separately on offhand if it's in the list, then remove offhand slot from list
$execute if data storage gpp:storage inventory.list[{Slot:-106b}] run function gpp:player/gpp/modify_item {cmd:"$(cmd)",slot:"weapon.offhand"}
data remove storage gpp:storage inventory.list[{Slot:-106b}]

# If list isn't empty, save list to memory, save command to memory, then map command across list
execute if data storage gpp:storage inventory.list[0] run data modify storage gpp:storage inventory.data.slot set from storage gpp:storage inventory.list[0].Slot
$execute if data storage gpp:storage inventory.list[0] run data modify storage gpp:storage inventory.data.cmd set value "$(cmd)"
execute if data storage gpp:storage inventory.list[0] run function gpp:player/inv/run/recur with storage gpp:storage inventory.data
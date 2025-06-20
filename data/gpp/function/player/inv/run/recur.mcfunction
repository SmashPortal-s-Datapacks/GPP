## gpp:player/inv/run/recur
# Recursively maps a command over a list of inventory slots
# @s -- This player
# $cmd -- Command to run on a GPP
# $slot -- The current slot to run on

# $say gpp:player/inv/run/recur ($(slot)b)

# Runs command on the current slot
$function gpp:player/gpp/modify_item {cmd:"$(cmd)",slot:"container.$(slot)"}

# Remove the current slot from the list
data remove storage gpp:storage inventory.list[0]

# Store next slot into memory
data modify storage gpp:storage inventory.data.slot set from storage gpp:storage inventory.list[0].Slot

# Recur
execute if data storage gpp:storage inventory.list[0] run function gpp:player/inv/run/recur with storage gpp:storage inventory.data
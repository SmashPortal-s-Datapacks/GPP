## gpp:player/gpp/modify_item
# Copies this player's GPP to a temp entity, runs a command on it, then copies it back to this player's inventory
# @s -- This player
# $slot -- The slot that the GPP to run the command on is in
# $cmd -- Command to run on the GPP

# $say gpp:player/gpp/modify_item ($(slot))

# Tag this player
tag @s add gpp.item.user

# Summon temp entity
summon minecraft:item ~ -100 ~ {Item:{id:"minecraft:barrier",components:{"minecraft:custom_data":{item_ping: 1b}}},Tags:["gpp.item.modify.target","gpp.item.copy"]}

# Copy this player's GPP to a temp entity
$item replace entity @n[type=minecraft:item,tag=gpp.item.modify.target] contents from entity @s $(slot)

# Delete item if invalid
execute if data entity @n[type=minecraft:item,tag=gpp.item.modify.target] Item.components."minecraft:custom_data"{item_ping: 1b} run kill @n[type=minecraft:item,tag=gpp.item.modify.target]

# Run $cmd on temp entity
$execute as @n[type=minecraft:item,tag=gpp.item.modify.target] run $(cmd)

# Copy GPP from temp entity to $slot
$item replace entity @s $(slot) from entity @n[type=minecraft:item,tag=gpp.item.modify.target,tag=gpp.item.copy] contents

# Fill $slot with air if there is no temp entity
$execute unless entity @n[type=minecraft:item,tag=gpp.item.modify.target] run item replace entity @s $(slot) with minecraft:air

# Remove temp entity
kill @e[type=minecraft:item,tag=gpp.item.modify.target]

# Untag this player
tag @s remove gpp.item.user
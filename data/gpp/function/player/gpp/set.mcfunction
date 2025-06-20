# say gpp:player/gpp/set

$execute as @n[type=minecraft:item,tag=gpp.item.toggle.target,tag=temp.gpp.activate] run data modify storage gpp:storage players[{UUID:$(UUID)}].gpp set from entity @s Item.components."minecraft:custom_data".gpp
## gpp:player/advancement/gpp_item
# Pattern matching for GPP item triggers
# @s -- This player

# say gpp:player/advancement/gpp_item

execute as @s[advancements={gpp:gpp_item={initialize=true}}] run function gpp:player/inv/run {cmd:"execute store result entity @s Item.components.minecraft:custom_data.gpp.UUID int 1 run scoreboard players add *prev_id gpp 1",item:{components:{"minecraft:custom_data":{gpp:{UUID:false}}}}}

execute as @s[advancements={gpp:gpp_item={use_item=true}}] unless score @s gpp.use.cooldown matches 1.. run function gpp:player/gpp/item/use

execute as @s[advancements={gpp:gpp_item={cooldown=true}}] run scoreboard players remove @s gpp.use.cooldown 1

execute as @s[advancements={gpp:gpp_item={all_off=true}}] run function gpp:player/inv/disable_all_gpps

advancement revoke @s only gpp:gpp_item
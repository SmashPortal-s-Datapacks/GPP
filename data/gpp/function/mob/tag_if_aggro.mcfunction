## gpp:mob/tag_if_aggro
# Adds a tag to this mob if it's targeting a player
# @s -- This mob
# $UUID -- The UUID of the player

# say gpp:mob/tag_if_aggro

# Add aggro_target tag to targeted player if this mob matches the 
$execute on target if data entity @s {UUID:$(UUID)} run tag @s add gpp.aggro_target

# Add aggro_mob tag to this mob if a player has the aggro_target tag
execute if entity @p[tag=gpp.aggro_target] run tag @s add gpp.aggro_mob

# Remove aggro_target tag from all players
tag @a[tag=gpp.aggro_target] remove gpp.aggro_target
# say gpp:player/gpp/target/exists

$execute unless entity @n[nbt={UUID:$(target)},predicate=gpp:targeting_player] run function gpp:player/gpp/target/remove with entity @s {}
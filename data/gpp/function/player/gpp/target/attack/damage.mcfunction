## gpp:player/gpp/target/attack/damage
# Damages the attack target, ticking up the attack count
# Reduces durability of the GPP
# @s -- This player
# $target -- The attack target
# $damage -- The attack damage to be dealt

# say gpp:player/gpp/target/attack/damage

# Damage the targeted mob
$damage @n[nbt={UUID:$(target)}] $(damage)

# Increase this player's attack count
scoreboard players add @s gpp.attack.count 1

# Reduce the durability of this player's GPP item
function gpp:player/gpp/item/reduce_durability with storage gpp:storage this_gpp
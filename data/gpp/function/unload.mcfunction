## gpp:unload
# Cleans up GPP scoreboards and storage, then disables the pack.

# Remove all targeted mobs
execute as @a run function gpp:player/gpp/target/remove

# Disable all GPPs
execute as @a run function gpp:player/inv/disable_all_gpps

# Remove all storage data for the pack
data remove storage gpp:storage players
data remove storage gpp:storage this_gpp
data remove storage gpp:storage inventory

# Remove all scoreboard data for the pack
scoreboard objectives remove gpp
scoreboard objectives remove gpp.use.cooldown
scoreboard objectives remove gpp.attack.cooldown
scoreboard objectives remove gpp.attack.count
scoreboard objectives remove gpp.durability

# Print message
tellraw @a {"translate":"Pack %s unloaded!","color":"gold","with":[{"text":"GPP","italic":true}]}

# Disable pack
datapack disable "file/gpp"
datapack disable "file/gpp.zip"
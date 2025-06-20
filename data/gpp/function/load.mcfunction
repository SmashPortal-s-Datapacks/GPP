## gpp:load
# Initializes scoreboard objectives used by the pack

# Initialize all scoreboard objectives for the pack
scoreboard objectives add gpp dummy "GPP"
scoreboard objectives add gpp.use.cooldown dummy "GPP Cooldown"
scoreboard objectives add gpp.attack.cooldown dummy "GPP Attack Cooldown"
scoreboard objectives add gpp.attack.count dummy "GPP Attack Count"
scoreboard objectives add gpp.durability dummy "GPP Durability"

# Print message, then save load state
execute if score *load gpp matches 1 run tellraw @a {"translate":"Pack %s reloaded!","color":"green","with":[{"text":"GPP","italic":true}]}
execute unless score *load gpp matches 1 run tellraw @a {"translate":"Pack %s loaded!","color":"green","with":[{"text":"GPP","italic":true}]}
scoreboard players set *load gpp 1
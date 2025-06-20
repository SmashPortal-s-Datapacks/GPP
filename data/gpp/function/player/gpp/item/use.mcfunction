## gpp:player/gpp/item/use
# Toggles the GPP that this player used
# Sets a cooldown so they can't use it again immediately
# @s -- This player

# say gpp:player/gpp/item/use

# Run the toggle function on this player's hand slot that's holding a GPP item
execute if data entity @s SelectedItem.components.minecraft:custom_data{gpp:{}} run function gpp:player/gpp/toggle {slot:"weapon.mainhand"}
execute unless data entity @s SelectedItem.components.minecraft:custom_data{gpp:{}} run function gpp:player/gpp/toggle {slot:"weapon.offhand"}

# Set this player's GPP cooldown to 10 so they can't spam the item
scoreboard players set @s gpp.use.cooldown 10
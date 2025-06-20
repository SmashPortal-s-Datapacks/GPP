# say gpp:player/gpp/sleep_exp

# Notify the player of why they're receiving exp
$title @s actionbar {translate: "You've received %s experience from your GPP", with: [{text: "$(sleep_exp)", color: "$(color)"}], color: "#55FF55"}

# Spawn exp relative to the GPP's tier
$summon minecraft:experience_orb ~ ~ ~ {Value:$(sleep_exp)}
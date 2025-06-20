# GPP

This is a data pack that adds an item called a GPP.

![icon](https://github.com/SmashPortal-s-Datapacks/GPP/blob/main/pack.png?raw=true)

The GPP interacts with the world on behalf of the player. While active, it attacks mobs that are targeting the player and grants experience orbs for sleeping. Only one GPP can be active for each player at a time.

## Using

To activate or deactivate a GPP, hold it in your hand and press the `use` key (right-click by default). The GPP item will appear enchanted while it is active.

## Crafting

![crafting recipes](https://i.imgur.com/lOEoSdz.gif)

(Netherite is crafted instead of smithed due to current smithing limitations.)

## Durability

Each GPP has a different durability, relative to its material. Durability will reduce by 1 per successful mob hit. All tiers become unusable when they reach 0 durability. They must be repaired in an anvil using the associated material.

![repair recipes](https://i.imgur.com/2PeDNgE.gif)

## Targeting

A GPP can target only one mob at a time. The target is the nearest mob that is targeting the player, excluding certain mobs that you may not want to damage (certain neutral mobs, and mobs that are nametagged).

The GPP uses a 0.6s (12t) attack speed cooldown, as vanilla swords have. After a GPP has damaged a mob 10 times, it forgets its target and seeks a new one. It can rediscover the same target.

## Sleep Experience

Whenever a player helps skip nighttime by sleeping, that player receives experience orbs upon waking. The experience received is relative to the player's active GPP tier (exp = tier<sup>2</sup>).

## Stats

GPPs use the following values. They can't be enchanted and ignore any effects the player has.

|**Stat**|**Golden**|**Wooden**|**Stone**|**Iron**|**Diamond**|**Netherite**|
|:-|:-:|:-:|:-:|:-:|:-:|:-:|
|Attack Damage|♥♥|♥♥|♥♥½|♥♥♥|♥♥♥½|♥♥♥♥|
|Durability|32|59|131|250|1561|2031|
|Sleep Exp|36|1|4|9|16|25|

Gold has been given the highest tier for experience drop calculation, due to its lacking power and toughness. Values are subject to change with additional functionality.

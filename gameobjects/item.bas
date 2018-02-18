'An item is something that could go in the player's inventory, among a wide
' variety of other places, such as treasure chests and actor starting equips.

' There are four main types of items:
'  * Tools: They don't do anything in battle and can't be equipped. Some can
'            be used outside of battle to trigger an event, but some are just
'            plot items used in certain scenes.
'  * Medicines: They can be used in battle and are usually consumed. They
'                can't be equipped.
'  * Armor: They can be equipped to give you extra defense and resistances.
'            There are four main slots armor can be equipped in: Head, Body,
'            Arms, and "off hand". Which goes in which slot is controlled by
'            ranges.
'  * Weapons: They can be equipped in your "main hand" to give attack bonuses
'              and other properties. Ambidextrous characters can use a weapon
'              in their off hand instead of an armor.

' Not all types of items can make use of all the properties; there are some
'  specific to weapons, some specific to armors, etc. Also some properties
'  are used differently by different item types. For example, "elements" for
'  a weapon means the elemental/status properties of the attack, whereas for
'  an armor, it indicates what elements and statuses it resists.

type Item extends Object

 'All items
 name as String
 price_code as UByte
 description as UByte
 
end type

type Tool extends Item
end type

type Consumable extends Item

 delay as UByte
 target as UByte
 power as UByte
 boss as Boolean
 success as UByte
 impact as Boolean
 effect as UByte
 damage as Boolean
 element_code as ElementStatusTable ptr
 reflectable as Boolean
 mp_cost as UByte 'No idea why an item has an MP cost...
 visual as UByte
 
end type


type Equipment extends Item

 magnetic as Boolean
 elements as ElementStatusTable ptr
 races(7) as Boolean
 stat_bonus as StatBonus
 equip_code as EquipTable ptr

end type


type Armor extends Equipment

 defense as UByte
 evade as UByte
 magic_defense as UByte
 magic_evade as UByte

end type


type Weapon extends Equipment

 properties(9) as Boolean
 attack as UByte
 hit as UByte
 sprite as UByte
 colors as UByte
 swing as UByte
 slash as UByte
 casts as UByte
 cast_visual as UByte
 spell_power as UByte

end type

const total_items = &hFF
const total_tools = 34
const total_consumables = 45
const total_equipment = 175
const total_armors = 79
const total_weapons = 95

const no_weapon_item = 0
const fire_claw_item = 1
const ice_claw_item = 2
const thunder_claw_item = 3
const charm_claw_item = 4
const poison_claw_item = 5
const cat_claw_item = 6
const rod_item = 7
const ice_rod_item = 8
const flame_rod_item = 9
const thunder_rod_item = 10
const change_rod_item = 11
const charm_rod_item = 12
const stardust_rod_item = 13
const lilith_rod_item = 14
const staff_item = 15
const cure_staff_item = 16
const silver_staff_item = 17
const power_staff_item = 18
const lunar_staff_item = 19
const life_staff_item = 20
const silence_staff_item = 21
const shadow_sword_item = 22
const darkness_sword_item = 23
const black_sword_item = 24
const legend_sword_item = 25
const light_sword_item = 26
const excalibur_item = 27
const fire_sword_item = 28
const icebrand_item = 29
const defense_item = 30
const drain_sword_item = 31
const ancient_sword_item = 32
const sleep_sword_item = 33
const medusa_sword_item = 34
const spear_item = 35
const wind_spear_item = 36
const flame_spear_item = 37
const blizzard_spear_item = 38
const dragoon_spear_item = 39
const white_spear_item = 40
const drain_spear_item = 41
const gungnir_item = 42
const short_katana_item = 43
const middle_katana_item = 44
const long_katana_item = 45
const ninja_katana_item = 46
const murasame_item = 47
const masamune_item = 48
const assassin_dagger_item = 49
const mute_knife_item = 50
const whip_item = 51
const chain_whip_item = 52
const blitz_whip_item = 53
const flame_whip_item = 54
const dragon_whip_item = 55
const hand_axe_item = 56
const dwarf_axe_item = 57
const ogre_axe_item = 58
const silver_knife_item = 59
const dancing_dagger_item = 60
const silver_sword_item = 61
const spoon_item = 62
const crystal_sword_item = 63
const shuriken_item = 64
const ninja_star_item = 65
const boomerang_item = 66
const fullmoon_item = 67
const dreamer_harp_item = 68
const charm_harp_item = 69
const excalipur_item = 70
const poison_axe_item = 71
const rune_axe_item = 72
const silver_hammer_item = 73
const earth_hammer_item = 74
const wooden_hammer_item = 75
const avenger_item = 76
const bow_item = 77
const crossbow_item = 78
const great_bow_item = 79
const archer_bow_item = 80
const elven_bow_item = 81
const samurai_bow_item = 82
const artemis_bow_item = 83
const iron_arrows_item = 84
const white_arrows_item = 85
const fire_arrows_item = 86
const ice_arrows_item = 87
const lit_arrows_item = 88
const darkness_arrows_item = 89
const poison_arrows_item = 90
const mute_arrows_item = 91
const charm_arrows_item = 92
const samurai_arrows_item = 93
const medusa_arrows_item = 94
const artemis_arrows_item = 95

const no_armor_item = 96
const iron_shield_item = 97
const shadow_shield_item = 98
const black_shield_item = 99
const paladin_shield_item = 100
const silver_shield_item = 101
const fire_shield_item = 102
const ice_shield_item = 103
const diamond_shield_item = 104
const aegis_shield_item = 105
const samurai_shield_item = 106
const dragoon_shield_item = 107
const crystal_shield_item = 108
const iron_helm_item = 109
const shadow_helm_item = 110
const darkness_helm_item = 111
const black_helm_item = 112
const paladin_helm_item = 113
const silver_helm_item = 114
const diamond_helm_item = 115
const samurai_helm_item = 116
const dragoon_helm_item = 117
const crystal_helm_item = 118
const cap_item = 119
const leather_hat_item = 120
const gaea_hat_item = 121
const wizard_hat_item = 122
const tiara_item = 123
const ribbon_item = 124
const headband_item = 125
const bandanna_item = 126
const ninja_hat_item = 127
const glass_item = 128
const iron_armor_item = 129
const shadow_armor_item = 130
const darkness_armor_item = 131
const black_armor_item = 132
const paladin_armor_item = 133
const silver_armor_item = 134
const fire_armor_item = 135
const ice_armor_item = 136
const diamond_armor_item = 137
const samurai_armor_item = 138
const dragoon_armor_item = 139
const crystal_armor_item = 140
const cloth_item = 141
const leather_vest_item = 142
const gaea_gear_item = 143
const wizard_robe_item = 144
const black_robe_item = 145
const sorcerer_robe_item = 146
const white_robe_item = 147
const power_vest_item = 148
const heroine_robe_item = 149
const prisoner_item = 150
const bard_robe_item = 151
const karate_gi_item = 152
const black_belt_item = 153
const adamant_armor_item = 154
const ninja_gear_item = 155
const iron_gauntlet_item = 156
const shadow_gauntlet_item = 157
const darkness_gauntlet_item = 158
const black_gauntlet_item = 159
const paladin_gauntlet_item = 160
const silver_gauntlet_item = 161
const diamond_gauntlet_item = 162
const zeus_gauntlet_item = 163
const samurai_gauntlet_item = 164
const dragoon_gauntlet_item = 165
const crystal_gauntlet_item = 166
const iron_ring_item = 167
const ruby_ring_item = 168
const silver_ring_item = 169
const strength_ring_item = 170
const rune_ring_item = 171
const crystal_ring_item = 172
const diamond_ring_item = 173
const protect_ring_item = 174
const cursed_ring_item = 175

const bomb_fragment_item = 176
const bomb_arm_item = 177
const antarctic_wind_item = 178
const arctic_wind_item = 179
const zeus_rage_item = 180
const gods_rage_item = 181
const stardust_item = 182
const lilith_kiss_item = 183
const vampire_fang_item = 184
const baccus_wine_item = 185
const hermes_shoes_item = 186
const bronze_hourglass_item = 187
const silver_hourglass_item = 188
const golden_hourglass_item = 189
const silk_web_item = 190
const scape_doll_item = 191
const red_fang_item = 192
const white_fang_item = 193
const blue_fang_item = 194
const light_curtain_item = 195
const kamikaze_item = 196
const lunar_curtain_item = 197
const silence_bell_item = 198
const earth_drum_item = 199
const crystal_item = 200
const coeurl_whisker_item = 201
const grimoire_item = 202
const bestiary_item = 203
const alarm_clock_item = 204
const unicorn_horn_item = 205
const cure1_item = 206
const cure2_item = 207
const cure3_item = 208
const ether1_item = 209
const ether2_item = 210
const elixir_item = 211
const life_item = 212
const gold_pin_item = 213
const maidens_kiss_item = 214
const mallet_item = 215
const diet_food_item = 216
const echo_herb_item = 217
const eyedrop_item = 218
const antidote_item = 219
const cross_item = 220
const heal_item = 221

const alert_item = 222
const golden_apple_item = 223
const silver_apple_item = 224
const soma_drop_item = 225
const tent_item = 226
const cabin_item = 227
const magazine_item = 228
const emergency_exit_item = 229
const dwarf_bread_item = 230
const imp_summon_item = 231
const bomb_summon_item = 232
const cockatrice_summon_item = 233
const mindflayer_summon_item = 234
const carrot_item = 235
const pass_item = 236
const whistle_item = 237

const package_item = 238
const baron_key_item = 239
const sand_ruby_item = 240
const earth_crystal_item = 241
const magma_key_item = 242
const luca_key_item = 243
const twin_harp_item = 244
const darkness_crystal_item = 245
const rat_tail_item = 246
const adamant_item = 247
const pan_item = 248
const pink_tail_item = 249
const tower_key_item = 250
const darkmatter_item = 251
const unused1_item = 252
const unused2_item = 253
const sort_item = 254
const trashcan_item = 255

'An event is a series of game instructions that are executed when it is
' called. An event can be called by an NPC or by stepping on certain
' trigger tiles.

type Event

 script as List
 branch as List

end type


const total_events = 253
const total_prices = 8

const get_pan_event = 9
const opening_event = 16
const prologue_event = 21
const kainazzo_event = 27
const yang_inn_event = 33
const mist_event = 48
const antlion_battle_event = 69
const fabul_inn_event = 82
const crystal_sword_event = 88
const masamune_event = 89
const meanwhile_event = 95
const get_twin_harp_event = 113
const get_earth_crystal_event = 116
const valvalis_battle_event = 124
const fabul_ship_event = 131
const murasame_event = 163
const white_spear_event = 164
const get_luca_key_event = 166
const get_darkness_crystal_event = 175
const excalibur_event = 225
const trade_for_adamant_event = 226
const adamant_armor_event = 227
const ending_event = 231
const grimoire_event = 248
const spoon_event = 249


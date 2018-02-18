'This is the information for a magic spell (White, Black, Call, Ninja, or Twin)
'or a "special technique", usually some kind of action done by a monster.

'Some of these have special effects important for monster battle scripts such
'as making a monster invincible or causing other monsters to trigger a
'reaction (e.g. the captain telling his soldiers to attack).

'The "player" spells have six letter names and will appear correctly when put
'into spell sets. If you put a spell/technique outside this range into a
'spell set, it will not display correctly.

type Spell

 name as String
 delay as UByte
 target as UByte
 power as UByte
 hit as UByte
 boss as Boolean
 effect as UByte
 damage as Boolean
 element_status as ElementStatusTable ptr
 impact as Boolean
 mp_cost as UByte
 reflectable as Boolean
 colors as UByte
 sprites as UByte
 visual1 as UByte
 visual2 as UByte
 sound as UByte

end type

const total_spells = &hBF

const hold_spell = 1
const mute_spell = 2
const charm_spell = 3
const blink_spell = 4
const armor_spell = 5
const shell_spell = 6
const slow_spell = 7
const fast_spell = 8
const bersk_spell = 9
const wall_spell = 10
const white_spell = 11
const dispel_spell = 12
const peep_spell = 13
const cure1_spell = 14
const cure2_spell = 15
const cure3_spell = 16
const cure4_spell = 17
const heal_spell = 18
const life1_spell = 19
const life2_spell = 20
const size_spell = 21
const exit_spell = 22
const sight_spell = 23
const float_spell = 24

const toad_spell = 25
const piggy_spell = 26
const warp_spell = 27
const venom_spell = 28
const fire1_spell = 29
const fire2_spell = 30
const fire3_spell = 31
const ice1_spell = 32
const ice2_spell = 33
const ice3_spell = 34
const lit1_spell = 35
const lit2_spell = 36
const lit3_spell = 37
const virus_spell = 38
const weak_spell = 39
const quake_spell = 40
const sleep_spell = 41
const stone_spell = 42
const fatal_spell = 43
const stop_spell = 44
const drain_spell = 45
const psych_spell = 46
const meteo_spell = 47
const nuke_spell = 48

const imp_spell = 49
const bomb_spell = 50
const cockatrice_spell = 51
const mage_spell = 52
const choco_spell = 53
const shiva_spell = 54
const indra_spell = 55
const jinn_spell = 56
const titan_spell = 57
const mist_spell = 58
const sylph_spell = 59
const odin_spell = 60
const levia_spell = 61
const asura_spell = 62
const baham_spell = 63

const comet_spell = 64
const flare_spell = 65
const flame_spell = 66
const flood_spell = 67
const blitz_spell = 68
const smoke_spell = 69
const pin_spell = 70
const image_spell = 71

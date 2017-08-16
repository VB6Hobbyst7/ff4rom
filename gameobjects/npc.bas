'This is a type of object the player can interact with when walking around a
' map. You can have several placements of the same NPC; for example, several
' different towns may have an placement of an NPC that's a lady that shows
' message 1 from bank 2 when spoken to.

type NPC

 sprite as UByte
 visible as Boolean
 speech as EventCall

end type

const total_npcs = &h1FF

const dark_knight_sprite = 0
const kain_sprite = 1
const child_rydia_sprite = 2
const tellah_sprite = 3
const edward_sprite = 4
const rosa_sprite = 5
const yang_sprite = 6
const palom_sprite = 7
const porom_sprite = 8
const paladin_sprite = 9
const cid_sprite = 10
const adult_rydia_sprite = 11
const edge_sprite = 12
const fusoya_sprite = 13
const mini_sprite = 14
const frog_sprite = 15
const pig_sprite = 16
const man_sprite = 17
const woman_sprite = 18
const dancer_sprite = 19
const old_man_sprite = 20
const old_woman_sprite = 21
const boy_sprite = 22
const girl_sprite = 23
const soldier_sprite = 24
const bearded_man_sprite = 25
const scholar_sprite = 26
const black_mage_sprite = 27
const white_mage_sprite = 28
const engineer_sprite = 29
const chocobo_sprite = 30
const karate_sprite = 31
const captian_sprite = 32
const bomb_sprite = 33
const hooded_sprite = 34
const namingway_sprite = 35
const golbez_sprite = 36
const king_sprite = 37
const elder_sprite = 38
const cleric_sprite = 39
const dwarf_sprite = 40
const doll_sprite = 41
const giott_sprite = 42
const lugae_sprite = 43
const luca_sprite = 44
const hand_sprite = 45
const kissing_sprite = 46
const crystal_sprite = 47
const heart_bubble_sprite = 48
const fire_sprite = 49
const sleeping_bubble_sprite = 50
const sheila_waving_sprite = 51
const sheila_downcast_sprite = 52
const edward_playing_harp_sprite = 53
const water_splash_sprite = 54
const katana_sprite = 55
const dancer_dress_sprite = 56
const legend_sword_sprite = 57
const rosa_captured_sprite = 58
const rubicante_sprite = 59
const rubicant_sprite = 59
const sparkle_sprite = 60
const elder_praying_sprite = 61
const black_mage_praying_sprite = 62
const zemus_fallen_sprite = 63
const white_mage_praying_sprite = 64
const sylph_sprite = 65
const zeromus_flame_sprite = 66
const kain_hair_sprite = 67
const lightning_sprite = 68
const teleportation_sprite = 69
const fat_chocobo_top_left_sprite = 70
const fat_chocobo_top_right_sprite = 71
const fat_chocobo_bottom_left = 72
const fat_chocobo_bottom_right = 73
const namingway_top_left = 74
const namingway_top_right = 75
const namingway_bottom_left = 76
const namingway_bottom_right = 77
const barbariccia_sprite = 78
const valvalis_sprite = 78
const dancer_leg_sprite = 79
const queen_sprite = 80
const zemus_sprite = 81
const octomammoth_sprite = 82
const octomamm_sprite = 82
const tentacle_sprite = 82
const magus_sister_sprite = 83
const dark_elf_sprite = 84
const bahamut_sprite = 85
const cagnazzo_sprite = 86
const kainazzo_sprite = 86
const dress_sprite = 87
const ice_wall_sprite = 88
const white_spear_sprite = 89
const holy_lance_sprite = 89
const woman_lying_down_sprite = 90
const death_ball_sprite = 91
const mist_sprite = 92
const double_door_sprite = 93
const fallen_soldier_sprite = 94
const antlion_claw_left_sprite = 95
const antlion_claw_right_sprite = 96
const anna_sprite = 97
const golbez_fallen_sprite = 98
const crystal_sword_sprite = 99
const ragnarok_sprite = 99
const anna_fallen_sprite = 100
const transparent_sprite = 101
const ice_magic_sprite = 102
const flame_top_sprite = 103
const flame_bottom_sprite = 104
const palom_statue_sprite = 105
const porom_statue_sprite = 106

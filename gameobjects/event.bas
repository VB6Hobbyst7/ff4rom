'An event is a series of game instructions that are executed when it is
' called. An event can be called by an NPC or by stepping on certain
' trigger tiles.

type Instruction

 code as UByte
 parameters(4) as UByte

end type


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

const placement_0 = &h00
const placement_1 = &h10
const placement_2 = &h20
const placement_3 = &h30
const placement_4 = &h40
const placement_5 = &h50
const placement_6 = &h60
const placement_7 = &h70
const placement_8 = &h80
const placement_9 = &h90
const placement_10 = &hA0
const placement_11 = &hB0

const move_up_instruction = &h00
const move_right_instruction = &h01
const move_down_instruction = &h02
const move_left_instruction = &h03
const face_up_instruction = &h04
const face_right_instruction = &h05
const face_down_instruction = &h06
const face_left_instruction = &h07
const visibility_instruction = &h08
const jump_instruction = &h09
const spin_instruction = &h0A
const hop_instruction = &h0B
const wave_in_instruction = &h0C
const wave_out_instruction = &h0D
const bow_head_instruction = &h0E
const lie_down_instruction = &h0F

const you_move_up_instruction = &hC0
const you_move_right_instruction = &hC1
const you_move_down_instruction = &hC2
const you_move_left_instruction = &hC3
const you_face_up_instruction = &hC4
const you_face_right_instruction = &hC5
const you_face_down_instruction = &hC6
const you_face_left_instruction = &hC7
const you_disappear_instruction = &hC8
const you_appear_instruction = &hC9
const you_wave_in_instruction = &hCA
const you_wave_out_instruction = &hCB
const you_bow_head_instruction = &hCC
const you_lie_down_instruction = &hCD
const you_freeze_instruction = &hCE
const you_spin_instruction = &hCF

const rumble_instruction = &hD0
const flash_instruction = &hD1
const blur_instruction = &hD2
const moon_instruction = &hD3
const fat_chocobo_instruction = &hD4
const door_instruction = &hD5
const shake_instruction = &hD6
const run_instruction = &hD7
const music_fade_instruction = &hD8
const namingway_instruction = &hD9
const screen_fade_instruction = &hDA
const toggle_status_instruction = &hDB
const pay_instruction = &hDC
const set_leader_instruction = &hDD
const restore_hp_instruction = &hDE
const restore_mp_instruction = &hDF
const gain_item_instruction = &hE0
const lose_item_instruction = &hE1
const learn_instruction = &hE2
const lose_status_instruction = &hE3
const gain_status_instruction = &hE4
const gain_gil_instruction = &hE5
const lose_gil_instruction = &hE6
const gain_actor_instruction = &hE7
const lose_actor_instruction = &hE8
const pause_instruction = &hE9
const fade_song_instruction = &hEA
const repeat_instruction = &hEB
const battle_instruction = &hEC
const shop_instruction = &hED
const bank2_call_instruction = &hEE
const bank2_map_instruction = &hEF
const bank1_low_instruction = &hF0
const bank1_high_instruction = &hF1
const set_flag_instruction = &hF2
const clear_flag_instruction = &hF3
const activate_instruction = &hF4
const deactivate_instruction = &hF5
const bank3_instruction = &hF6
const pick_item_instruction = &hF7
const yesno_instruction = &hF8
const tint_instruction = &hF9
const play_song_instruction = &hFA
const sfx_instruction = &hFB
const crash_instruction = &hFC
const vfx_instruction = &hFD
const teleport_instruction = &hFE
const end_instruction = &hFF


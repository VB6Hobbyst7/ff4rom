'A message is a section of text from when the dialogue window opens to when it
' closes. It can span multiple boxes worth of text an can contain certain
' control codes such as "new line", "play song", or references to character
' names.

' The text in the ROM is stored in a compressed manner. When reading the
'  messages, they are automatically decompressed to make them easier to work
'  with. When writing the messages back to the ROM, they are re-compressed;
'  however, the compression may not be exactly the same as the original, even
'  if the actual text it represents is the same. This means you may not notice
'  any difference when actually playing the game, but there will be differences
'  in the messages sections of the ROM, even if you didn't change any of them.

type Message

 text as String

end type


const total_bank1_messages = 511
const total_bank3_messages = 255
const total_battle_messages = 185
const total_alert_messages = 58

const message_end_code = 0
const line_break_code = 1
const song_code = 3
const name_code = 4
const pause_code = 5
const advance_code = 6
const item_code = 7
const gp_code = 8
const blank_line_code = 9

const space_symbol = chr(&hFF)

const petrify_symbol = chr(&h21)
const frog_symbol = chr(&h22)
const mini_symbol = chr(&h23)
const pig_symbol = chr(&h24)
const mute_symbol = chr(&h25)
const blind_symbol = chr(&h26)
const poison_symbol = chr(&h27)
const float_symbol = chr(&h28)
const claw_symbol = chr(&h29)
const rod_symbol = chr(&h2A)
const staff_symbol = chr(&h2B)
const darksword_symbol = chr(&h2C)
const sword_symbol = chr(&h2D)
const holysword_symbol = chr(&h2E)
const spear_symbol = chr(&h2F)
const knife_symbol = chr(&h30)
const katana_symbol = chr(&h31)
const shuriken_symbol = chr(&h32)
const boomerang_symbol = chr(&h33)
const axe_symbol = chr(&h34)
const wrench_symbol = chr(&h35)
const harp_symbol = chr(&h36)
const bow_symbol = chr(&h37)
const arrow_symbol = chr(&h38)
const hammer_symbol = chr(&h39)
const whip_symbol = chr(&h3A)
const shield_symbol = chr(&h3B)
const helm_symbol = chr(&h3C)
const mail_symbol = chr(&h3D)
const gauntlet_symbol = chr(&h3E)
const black_symbol = chr(&h3F)
const white_symbol = chr(&h40)
const summon_symbol = chr(&h41)
const flat_m_symbol = chr(&h76)
const flat_h_symbol = chr(&h77)
const flat_p_symbol = chr(&h78)
const tent_symbol = chr(&h79)
const potion_symbol = chr(&h7A)
const robe_symbol = chr(&h7B)
const ring_symbol = chr(&h7C)
const crystal_symbol = chr(&h7D)
const key_symbol = chr(&h7E)
const tail_symbol = chr(&h7F)

const legend_message = 362
const prologue_message = 464

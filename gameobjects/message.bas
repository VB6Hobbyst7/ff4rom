type Message
 text as String
end type

const total_bank1_messages = 511
const total_bank3_messages = 255
const total_battle_messages = 185
const total_alert_messages = 58
const total_descriptions = 100

enum Symbols
 end_message = 0
 line_break
 song = 3
 actor_name
 pause
 advance
 item
 gil
 blank_line
 blank = &h15
 petrify = &h21
 frog
 mini
 pig
 mute
 blind
 poison
 float
 claw
 rod
 staff
 darksword
 sword
 holysword
 spear
 knife
 katana
 shuriken
 boomerang
 axe
 wrench
 harp
 bow
 arrow
 hammer
 whip
 shield
 helm
 mail
 gauntlet
 black
 white
 summon
 flat_m = &h76
 flat_h
 flat_p
 tent
 potion
 robe
 ring
 crystal
 key
 tail
 apostrophe = &hC0
 period
 hyphen
 elipsis
 exclamation
 question
 percent
 slash
 colon
 comma
 spacebar = &hFF
end enum

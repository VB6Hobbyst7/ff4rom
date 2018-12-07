type Instruction
 code as UByte
 parameters as List
 declare static function ParameterCount(c as UByte) as Byte
end type

enum InstructionCodes
 move_placement = 0
 move_self = &hC0
 screen_shake = &hD0
 screen_flash
 screen_blur
 space_travel
 fat_chocobo
 open_door
 screen_jolt
 running
 fade_out
 namingway
 screen_fade
 toggle_status
 pay_gil
 change_leader
 heal_hp
 heal_mp
 get_item = &hE0
 lose_item
 learn_spell
 heal_status
 add_status
 get_gil
 lose_gil
 get_actor
 lose_actor
 pause
 fade_in
 repeat
 battle
 shop
 message_parameter
 message_map
 message_bank1_low = &hF0
 message_bank1_high
 set_flag
 clear_flag
 activate_npc
 deactivate_npc
 message_bank3
 select_item
 choice
 screen_tint
 song
 sfx
 conditional
 vfx
 teleport
 end_event
end enum

enum PlacementCodes
 placement0 = 0
 placement1 = &h10
 placement2 = &h20
 placement3 = &h30
 placement4 = &h40
 placement5 = &h50
 placement6 = &h60
 placement7 = &h70
 placement8 = &h80
 placement9 = &h90
 placement10 = &hA0
 placement11 = &hB0
end enum

enum MovementCodes
 move_up = 0
 move_right
 move_down
 move_left
 face_up
 face_right
 face_down
 face_left
 visibility
 leap
 spin
 hop
 wave_in
 wave_out
 bow_head
 lie_down
end enum

enum MoveSelfCodes
 move_up = 0
 move_right
 move_down
 move_left
 face_up
 face_right
 face_down
 face_left
 invisible
 visible
 wave_in
 wave_out
 bow_head
 lie_down
 turning
 spinning
end enum

function Instruction.ParameterCount(c as UByte) as Byte
 dim result as Byte
 select case c
  case InstructionCodes.move_placement to InstructionCodes.screen_fade
   result = 0
  case InstructionCodes.learn_spell, InstructionCodes.repeat
   result = 2
  case InstructionCodes.conditional
   result = 2 'Assumes you have the "if patch" applied (this instruction is useless otherwise).
  case InstructionCodes.teleport
   result = 4
  case else
   result = 1
 end select
 return result
end function

'Returns the number of parameters the given event instruction code takes.

function FF4Rom.InstructionParameters(code as UByte) as Integer

 dim result as Integer
 
 select case code
  case is < rumble_instruction
   result = 0
  case rumble_instruction to screen_fade_instruction, end_instruction
   result = 0
  case repeat_instruction, learn_instruction
   result = 2
  case teleport_instruction
   result = 4
  case crash_instruction
   result = iif(if_patch, 2, 1)
  case else
   result = 1
 end select
 
 return result
 
end function

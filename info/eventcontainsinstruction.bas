function FF4Rom.EventContainsInstruction(event_index as UByte, code_index as UByte, parameter as Integer = -1) as Boolean

 dim result as Boolean
 dim entry as Instruction ptr
 
 for i as Integer = 1 to events(event_index).script.Length()
  entry = events(event_index).script.PointerAt(i)
  if entry->code = code_index then
   'if parameter < 0 or entry->parameters(1) = parameter then
    result = true
    exit for
   'end if
  end if
 next
 
 if not result then
  for i as Integer = 1 to events(event_index).branch.Length()
   entry = events(event_index).branch.PointerAt(i)
   if entry->code = code_index then
    'if parameter < 0 or entry->parameters(1) = parameter then
     result = true
     exit for
    'end if
   end if
  next
 end if
 
 return result

end function

function FF4Rom.ActorHasCommand(actor_index as UByte, command_index as UByte) as Boolean

 dim result as Boolean
 
 for i as Integer = 1 to 5
  if actors(actor_index).menu_command(i) = command_index then
   result = true
   exit for
  end if
 next
 
 return result

end function

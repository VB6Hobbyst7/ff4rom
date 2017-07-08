function FF4Rom.CommandCount(actor_index as UByte) as Integer

 dim result as Integer
 
 for i as Integer = 1 to 5
  if actors(actor_index).menu_command(i) <> &hFF then result += 1
 next
 
 return result

end function

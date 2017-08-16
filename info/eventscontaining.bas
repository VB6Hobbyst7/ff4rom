'This returns a list of the indexes of the events which include at least one
' entry of the given instruction.

function FF4Rom.EventsContaining(code_index as UByte, parameter as Integer = -1) as List

 dim result as List
 
 for i as Integer = 0 to total_events
  if EventContainsInstruction(i, code_index, parameter) then result.AddValue(i)
 next
 
 return result

end function

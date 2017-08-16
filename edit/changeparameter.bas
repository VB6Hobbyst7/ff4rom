sub FF4Rom.ChangeParameter(event_index as UByte, script_line as Integer, parameter_index as UByte, parameter_value as UByte)

 dim entry as Instruction ptr
 
 if event_index <= total_events then
  if events(event_index).script.Length() >= script_line then
   if parameter_index <= 4 and parameter_index >= 1 then
    entry = events(event_index).script.PointerAt(script_line)
    entry->parameters(parameter_index) = parameter_value
   end if
  end if
 end if

end sub

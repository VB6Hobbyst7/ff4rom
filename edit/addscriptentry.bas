sub FF4Rom.AddScriptEntry(event_index as UByte, new_code as UByte, parameters as List)

 dim entry as Instruction ptr
 
 entry = callocate(sizeof(Instruction))
 entry->code = new_code
 for i as Integer = 1 to Min(parameters.Length(), 4)
  entry->parameters(i) = parameters.ValueAt(i)
 next
 'Insert it at the last position rather than appending it to the end.
 ' That way, the "end event" instruction floats down as you add things.
 events(event_index).script.InsertPointer(events(event_index).script.Length(), entry)

end sub


sub FF4Rom.AddScriptEntry(event_index as UByte, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)

 dim parameters as List
 
 parameters.AddValue(parameter1)
 parameters.AddValue(parameter2)
 parameters.AddValue(parameter3)
 parameters.AddValue(parameter4)
 AddScriptEntry(event_index, new_code, parameters)

end sub


sub FF4Rom.AddScriptEntry(event_index as UByte, new_entry as Instruction)

 dim entry as Instruction ptr
 
 entry = callocate(sizeof(Instruction))
 *entry = new_entry
 AddScriptEntry(event_index, entry)
 
end sub


sub FF4Rom.AddScriptEntry(event_index as UByte, new_entry as Instruction ptr)

 if event_index <= total_events and new_entry <> 0 then
  events(event_index).script.InsertPointer(events(event_index).script.Length(), new_entry)
 end if

end sub

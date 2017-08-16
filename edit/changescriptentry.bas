sub FF4Rom.ChangeScriptEntry(event_index as UByte, script_line as Integer, new_code as UByte, parameters as List)

 dim entry as Instruction ptr

 if event_index <= total_events then
  if script_line <= events(event_index).script.Length() then
   entry = events(event_index).script.PointerAt(script_line)
   entry->code = new_code
   for i as Integer = 1 to Min(parameters.Length(), 4)
    entry->parameters(i) = parameters.ValueAt(i)
   next
  end if
 end if

end sub


sub FF4Rom.ChangeScriptEntry(event_index as UByte, script_line as Integer, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)

 dim temp as List
 
 temp.AddValue(parameter1)
 temp.AddValue(parameter2)
 temp.AddValue(parameter3)
 temp.AddValue(parameter4)
 ChangeScriptEntry(event_index, script_line, new_code, temp)

end sub


sub FF4Rom.ChangeScriptEntry(event_index as UByte, script_line as Integer, new_entry as Instruction)

 dim entry as Instruction ptr
 
 if event_index <= total_events then
  if script_line <= events(event_index).script.Length() then
   entry = callocate(sizeof(Instruction))
   *entry = new_entry
   ChangeScriptEntry(event_index, script_line, entry)
  end if
 end if

end sub


sub FF4Rom.ChangeScriptEntry(event_index as UByte, script_line as Integer, new_entry as Instruction ptr)

 if event_index <= total_events then
  if script_line <= events(event_index).script.Length() then
   events(event_index).script.AssignPointer(script_line, new_entry)
  end if
 end if

end sub


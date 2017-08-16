sub FF4Rom.ClearEventScript(event_index as UByte)

 dim entry as Instruction ptr
 
 if event_index <= total_events then
  events(event_index).script.Destroy()
  entry = callocate(sizeof(Instruction))
  entry->code = end_instruction
  events(event_index).script.AddPointer(entry)
 end if

end sub

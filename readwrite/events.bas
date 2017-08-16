function FF4Rom.ConstructInstruction(address as Integer) as Instruction ptr

 dim entry as Instruction ptr
 dim temp as UByte
 
 temp = ByteAt(address)
 entry = callocate(SizeOf(Instruction))
 entry->code = temp
 for j as Integer = 1 to InstructionParameters(temp)
  entry->parameters(j) = ByteAt(address + j)
 next
 
 return entry

end function


sub FF4Rom.ReadEvents()

 dim start as Integer
 dim offset as Integer
 dim entry as Instruction ptr
 dim has_branch as Boolean
 
 for i as Integer = 0 to total_events
 
  start = ByteAt(&h90200 + i * 2) + ByteAt(&h90200 + i * 2 + 1) * &h100 + &h90400
  offset = 0
  has_branch = false
  do
   entry = ConstructInstruction(start + offset)
   offset += 1 + InstructionParameters(entry->code)
   if entry->code = yesno_instruction then has_branch = true
   events(i).script.AddPointer(entry)
  loop until entry->code = end_instruction
  if has_branch then
   do
    entry = ConstructInstruction(start + offset)
    offset += 1 + InstructionParameters(entry->code)
    events(i).branch.AddPointer(entry)
   loop until entry->code = end_instruction
  end if
  
 next

end sub


sub FF4Rom.WriteEvents()

 dim start as Integer
 dim offset as Integer
 dim entry as Instruction ptr
 dim has_branch as Boolean
 dim end_of_events as Integer
 
 end_of_events = &h97200
 start = &h90400

 for i as Integer = 0 to total_events
 
  offset = 0
  has_branch = false
  for j as Integer = 1 to events(i).script.Length()
   entry = events(i).script.PointerAt(j)
   WriteByte(start + offset, entry->code)
   for k as Integer = 1 to InstructionParameters(entry->code)
    WriteByte(start + offset + k, entry->parameters(k))
   next
   offset += 1 + InstructionParameters(entry->code)
   if entry->code = yesno_instruction then has_branch = true
  next
  if has_branch then
   for j as Integer = 1 to events(i).branch.Length()
    entry = events(i).branch.PointerAt(j)
    WriteByte(start + offset, entry->code)
    for k as Integer = 1 to InstructionParameters(entry->code)
     WriteByte(start + offset + k, entry->parameters(k))
    next
    offset += 1 + InstructionParameters(entry->code)
   next
  end if
  WriteByte(&h90200 + i * 2, (start - &h90400) mod &h100)
  WriteByte(&h90200 + i * 2 + 1, (start - &h90400) \ &h100)
  start += offset
  
 next
 
 do while start < end_of_events
  WriteByte(start, &hFF)
  start += 1
 loop
 
end sub

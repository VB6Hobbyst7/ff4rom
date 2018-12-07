sub FF4Rom.ReadEvents()
 dim start as Long
 dim p as Event ptr
 dim e as Instruction ptr
 dim has_branch as Boolean
 for index as Integer = 0 to total_events
  p = events[index]
  start = ByteAt(&h90200 + index * 2) + ByteAt(&h90200 + index * 2 + 1) * &h100 + &h90400
  has_branch = false
  do until ByteAt(start) = &hFF
   e = new Instruction
   e->code = ByteAt(start)
   start += 1
   if e->code = InstructionCodes.choice then has_branch = true
   for i as Integer = 1 to Instruction.ParameterCount(e->code)
    e->parameters += ByteAt(start)
    start += 1
   next
   p->script.AddPointer(e)
  loop
  if has_branch then
   start += 1
   do until ByteAt(start) = &hFF
    e = new Instruction
    e->code = ByteAt(start)
    start += 1
    if e->code = InstructionCodes.choice then has_branch = true
    for i as Integer = 1 to Instruction.ParameterCount(e->code)
     e->parameters += ByteAt(start)
     start += 1
    next
    p->branch.AddPointer(e)
   loop
  end if
 next
end sub

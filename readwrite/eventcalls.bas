sub FF4Rom.ReadEventCalls()

 dim start as Integer
 dim finish as Integer
 dim offset as Integer
 dim temp as UByte
 dim c as CallComponent ptr
 dim bytes as List
 
 c = callocate(SizeOf(CallComponent))

 for i as Integer = 0 to total_event_calls
 
  start = ByteAt(&h97460 + i * 2) + ByteAt(&h97460 + i * 2 + 1) * &h100 + &h97660
  finish = ByteAt(&h97460 + i * 2 + 2) + ByteAt(&h97460 + i * 2 + 3) * &h100 + &h97660
  offset = 0
  do while start + offset < finish
   temp = ByteAt(start + offset)
   offset += 1
   select case temp
    case &hFF
     c->event_index = ByteAt(start + offset)
     offset += 1
     c->false_conditions.Join(bytes)
     bytes.Destroy()
     eventcalls(i).components.AddPointer(c)
     c = callocate(SizeOf(CallComponent))
    case &hFE
     c->true_conditions.AddValue(ByteAt(start + offset))
     offset += 1
    case else
     bytes.AddValue(temp)
   end select
  loop
  if bytes.Length() > 0 then
   eventcalls(i).parameters.Join(bytes)
   bytes.Destroy()
   eventcalls(i).components.AddPointer(c)
   c = callocate(SizeOf(CallComponent))
  end if
  
 next
 
 deallocate(c)

end sub


sub FF4Rom.WriteEventCalls()

 dim start as Integer
 dim offset as Integer
 dim c as CallComponent ptr

 start = &h97660
 
 for i as Integer = 0 to total_event_calls
  WriteByte(&h97460 + i * 2, (start - &h97660) mod &h100)
  WriteByte(&h97460 + i * 2 + 1, (start - &h97660) \ &h100)
  for j as Integer = 1 to eventcalls(i).components.Length()
   c = eventcalls(i).components.PointerAt(j)
   for k as Integer = 1 to c->true_conditions.Length()
    WriteByte(start + offset, &hFE)
    WriteByte(start + offset + 1, c->true_conditions.ValueAt(k))
    offset += 2
   next
   for k as Integer = 1 to c->false_conditions.Length()
    WriteByte(start + offset, c->false_conditions.ValueAt(k))
    offset += 1
   next
   WriteByte(start + offset, &hFF)
   WriteByte(start + offset + 1, c->event_index)
   offset += 2
  next
  for j as Integer = 1 to eventcalls(i).parameters.Length()
   WriteByte(start + offset, eventcalls(i).parameters.ValueAt(j))
   offset += 1
  next
  start += offset
  offset = 0
 next
 
 WriteByte(&h97460 + (total_event_calls + 1) * 2, (start - &h97660) mod &h100)
 WriteByte(&h97460 + (total_event_calls + 1) * 2 + 1, (start - &h97660) \ &h100)

 for i as Integer = start to &h97817
  'WriteByte(i, &hFF)
 next
 
end sub

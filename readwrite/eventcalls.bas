sub FF4Rom.ReadEventCalls()
 dim start as Long
 dim finish as Long
 dim p as EventCall ptr
 dim c as CallComponent ptr
 for index as Integer = 0 to total_event_calls
  p = event_calls[index]
  start = ByteAt(&h97460 + index * 2) + ByteAt(&h97460 + index * 2 + 1) * &h100 + &h97660
  finish = ByteAt(&h97460 + index * 2 + 2) + ByteAt(&h97460 + index * 2 + 3) * &h100 + &h97660
  do while start < finish
   c = new CallComponent
   do until ByteAt(start) = &hFF
    if ByteAt(start) = &hFE then
     start += 1
     c->false_conditions.AddValue(ByteAt(start))
    else
     c->true_conditions.AddValue(ByteAt(start))
    end if
    start += 1
   loop
   start += 1
   c->event_link = events[ByteAt(start)]
   p->components.AddPointer(c)
   start += 1
  loop
 next
end sub

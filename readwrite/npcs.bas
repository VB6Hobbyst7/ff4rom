sub FF4Rom.ReadNPCs()
 dim start as Long
 dim finish as Long
 dim p as NPC ptr
 dim c as CallComponent ptr
 dim params as List
 for index as Integer = 0 to total_npcs
  p = npcs[index]
  p->sprite = ByteAt(&h97200 + index)
  p->visible = bit(ByteAt(&h97400 + index \ 8), index mod 8) 
  start = ByteAt(&h99A00 + index * 2) + ByteAt(&h99A00 + index * 2 + 1) * &h100 + &h99E00
  finish = ByteAt(&h99A00 + index * 2 + 2) + ByteAt(&h99A00 + index * 2 + 3) * &h100 + &h99E00
  do while start < finish
   c = new CallComponent
   do until ByteAt(start) = &hFF or start >= finish
    if ByteAt(start) = &hFE then
     start += 1
     c->false_conditions.AddValue(ByteAt(start))
    else
     params.AddValue(ByteAt(start))
    end if
    start += 1
   loop
   if ByteAt(start) = &hFF then
    start += 1
    c->true_conditions += params
    c->event_link = events[ByteAt(start)]
    p->speech.components.AddPointer(c)
    start += 1
   else
    p->speech.parameters += params
   end if
  loop
 next
end sub

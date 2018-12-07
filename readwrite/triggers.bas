sub FF4Rom.ReadTriggers()
 dim start as Long
 dim finish as Long
 dim p as Trigger ptr
 dim m as Map ptr
 for index as Integer = 0 to total_maps
  m = maps[index]
  start = ByteAt(&hA8200 + index * 2) + ByteAt(&hA8200 + index * 2 + 1) * &h100 + &hA8500
  finish = ByteAt(&hA8200 + index * 2 + 2) + ByteAt(&hA8200 + index * 2 + 3) * &h100 + &hA8500
  do while start < finish
   p = new Trigger
   p->x = ByteAt(start)
   p->y = ByteAt(start + 1)
   select case ByteAt(start + 2)
    case &hFF
     p->treasure = false
     p->teleport = false
     p->event_call = event_calls[ByteAt(start + 3)]
    case &hFE
     p->treasure = true
     p->teleport = false
     if bit(ByteAt(start + 3), 7) then
      p->gil = false
      p->contents = items[ByteAt(start + 4)]
     else
      p->gil = true
      p->amount = ByteAt(start + 4)
     end if
     if bit(ByteAt(start + 3), 6) then
      p->trapped = true
      p->trap_formation = formations[ByteAt(start + 3) mod 2^6]
     end if
    case else
     p->treasure = false
     p->teleport = true
     p->destination = maps[ByteAt(start + 2)]
     p->destination_x = ByteAt(start + 3) mod 2^6
     p->facing = ByteAt(start + 3) \ 2^6
     p->destination_y = ByteAt(start + 4)
   end select
   m->triggers.AddPointer(p)
   start += 5
  loop
 next
end sub

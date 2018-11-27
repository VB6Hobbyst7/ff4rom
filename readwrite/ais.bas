sub FF4Rom.ReadAIs()
 dim start as Long
 dim p as AI ptr
 start = &h76230
 for index as Integer = 0 to total_ais
  p = ais[index]
  do until ByteAt(start) = &hFF
   p->condition_sets.AddPointer(condition_sets[ByteAt(start)])
   start += 1
   p->scripts.AddPointer(scripts[ByteAt(start)])
   if ByteAt(start) < &hFF then start += 1
  loop
  start += 1
 next
end sub

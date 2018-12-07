sub FF4Rom.ReadEncounters()
 dim start as Long
 dim p as Encounter ptr
 for index as Integer = 0 to total_encounters
  p = encounters[index]
  start = &h74996 + index * 8
  for i as Integer = 0 to 7
   p->formations(i) = formations[ByteAt(start + i)]
  next 
 next
end sub

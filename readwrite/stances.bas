sub FF4Rom.ReadStances()
 dim start as Long
 dim p as Stance ptr
 for index as Integer = 0 to total_stances
  p = stances[index + 1]
  start = &h9FD85 + index * 4
  for i as Integer = 0 to 3
   p->pose(i) = ByteAt(start + i)
  next
 next
end sub

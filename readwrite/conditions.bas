sub FF4Rom.ReadConditions()
 dim start as Long
 dim p as Condition ptr
 for index as Integer = 0 to total_conditions
  p = conditions[index]
  start = &h76900 + index * 4
  p->mode = ByteAt(start)
  p->xx = ByteAt(start + 1)
  p->yy = ByteAt(start + 2)
  p->zz = ByteAt(start + 3)
 next
 for index as Integer = 0 to total_condition_hps
  start = &h76200 + index * 2
  condition_hps(index) = ByteAt(start) + ByteAt(start + 1)
 next
end sub

sub FF4Rom.ReadConditionSets()
 dim start as Long
 dim p as ConditionSet ptr
 start = &h76800
 for index as Integer = 0 to total_condition_sets
  p = condition_sets[index]
  do until ByteAt(start) = &hFF
   p->conditions.AddPointer(conditions[ByteAt(start)])
   start += 1
  loop
  start += 1
 next
end sub

sub FF4Rom.ReadEquipTables()

 dim start as UInteger = &h7A750
 
 for i as Integer = 0 to total_equip_tables
  for j as Integer = 0 to 7
   if bit(ByteAt(start + i * 2), j) then equip_tables(i)->jobs.AddPointer(jobs(j))
   if bit(ByteAt(start + i * 2 + 1), j) then equip_tables(i)->jobs.AddPointer(jobs(j + 8))
  next
 next

end sub


sub FF4Rom.WriteEquipTables()

 dim start as UInteger = &h7A750
 dim joblist as List
 dim index as Integer
 dim b1 as UByte
 dim b2 as UByte

 for i as Integer = 0 to total_equip_tables
  b1 = 0
  b2 = 0
  joblist = equip_tables(i)->jobs.Contents()
  for j as Integer = 1 to joblist.Length()
   index = IndexOfJob(joblist.PointerAt(j))
   if index > 7 then b2 = bitset(b2, index - 8) else b1 = bitset(b1, index)
  next
  WriteByte(start + i * 2, b1)
  WriteByte(start + i * 2 + 1, b2)
 next

end sub

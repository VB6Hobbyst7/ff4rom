sub FF4Rom.ReadEquipTables()
 dim start as Long
 dim p as EquipTable ptr
 for index as Integer = 0 to total_equip_tables
  p = equip_tables[index]
  start = &h7A750 + index * 2
  for i as Integer = 0 to 7
   if bit(ByteAt(start), i) then p->AddValue(i)
   if bit(ByteAt(start + 1), i) then p->AddValue(i + 8)
  next
 next
end sub

sub FF4Rom.WriteEquipTables()
 dim start as Long
 dim temp as UByte
 dim p as EquipTable ptr
 for index as Integer = 0 to total_equip_tables
  p = equip_tables[index]
  start = &h7A750 + index * 2
  temp = 0
  for i as Integer = 0 to 7
   if p->ContainsValue(i) then temp = bitset(temp, i)
  next
  WriteByte(start, temp)
  temp = 0
  for i as Integer = 0 to 7
   if p->ContainsValue(i + 8) then temp = bitset(temp, i)
  next
  WriteByte(start + 1, temp)
 next
end sub

sub FF4Rom.ReadAttributeTables()
 dim start as Long
 for index as Integer = 0 to total_attribute_tables
  start = &h7A790 + index * 3
  attribute_tables(index)->FromBytes(start, start + 1, start + 2)
 next 
end sub

sub FF4Rom.WriteAttributeTables()
 dim start as Long
 dim bytes as List
 for index as Integer = 0 to total_attribute_tables
  start = &h7A790 + index * 3
  bytes = attribute_tables(index)->ToBytes()
  WriteByte(start, bytes.ValueAt(1))
  WriteByte(start + 1, bytes.ValueAt(2))
  WriteByte(start + 2, bytes.ValueAt(3))
 next
end sub

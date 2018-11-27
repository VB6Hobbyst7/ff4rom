sub FF4Rom.ReadAttributeTables()
 dim start as Long
 dim p as AttributeTable ptr
 for index as Integer = 0 to total_attribute_tables
  p = attribute_tables[index]
  start = &h7A790 + index * 3
  p->FromBytes(ByteAt(start), ByteAt(start + 1), ByteAt(start + 2))
 next 
end sub

sub FF4Rom.WriteAttributeTables()
 dim start as Long
 dim bytes as List
 dim p as AttributeTable ptr
 for index as Integer = 0 to total_attribute_tables
  p = attribute_tables[index]
  start = &h7A790 + index * 3
  bytes = p->ToBytes()
  WriteByte(start, bytes.ValueAt(1))
  WriteByte(start + 1, bytes.ValueAt(2))
  WriteByte(start + 2, bytes.ValueAt(3))
 next
end sub

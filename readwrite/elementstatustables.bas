sub FF4Rom.ReadElementStatusTables()

 for i as Integer = 0 to total_element_status_tables
  element_status_tables(i)->SetFlagsFromBytes(ByteAt(&h7A790 + i * 3), ByteAt(&h7A790 + i * 3 + 1), ByteAt(&h7A790 + i * 3 + 2))
 next

end sub


sub FF4Rom.WriteElementStatusTables()

 dim bytes as List
 
 for i as Integer = 0 to total_element_status_tables
  bytes = element_status_tables(i)->BytesFromFlags()
  for j as Integer = 0 to 2
   WriteByte(&h7A790 + i * 3 + j, bytes.ValueAt(j + 1))
  next
 next

end sub

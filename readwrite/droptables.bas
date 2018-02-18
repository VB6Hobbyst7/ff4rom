sub FF4Rom.ReadDropTables()

 dim start as UInteger
 
 for index as Integer = 0 to total_drop_tables
 
  start = &h72100 + index * 4
  
  drop_tables(index)->common_drop = items(ByteAt(start))
  drop_tables(index)->uncommon_drop = items(ByteAt(start + 1))
  drop_tables(index)->rare_drop = items(ByteAt(start + 2))
  drop_tables(index)->mythic_drop = items(ByteAt(start + 3))

 next

end sub


sub FF4Rom.WriteDropTables()

 dim start as UInteger

 for index as Integer = 0 to total_drop_tables
  
  start = &h72100 + index * 4
  
  WriteByte(start, IndexOfItem(drop_tables(index)->common_drop))
  WriteByte(start + 1, IndexOfItem(drop_tables(index)->uncommon_drop))
  WriteByte(start + 2, IndexOfItem(drop_tables(index)->rare_drop))
  WriteByte(start + 3, IndexOfItem(drop_tables(index)->mythic_drop))

 next

end sub

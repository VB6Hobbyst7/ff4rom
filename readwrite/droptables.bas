sub FF4Rom.ReadDropTables()
 dim start as Long
 dim p as DropTable ptr
 for index as Integer = 0 to total_drop_tables
  p = drop_tables[index]
  start = &h72100 + index * 4
  p->common = items[ByteAt(start)]
  p->uncommon = items[ByteAt(start + 1)]
  p->rare = items[ByteAt(start + 2)]
  p->mythic = items[ByteAt(start + 3)]
 next
end sub

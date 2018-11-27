sub FF4Rom.ReadStatTables()
 dim start as Long
 dim p as StatTable ptr
 for index as Integer = 0 to total_stat_tables
  p = stat_tables[index]
  start = &h72580 + index * 3
  p->multiplier = ByteAt(start)
  p->rate = ByteAt(start + 1)
  p->base = ByteAt(start + 2)
 next
end sub

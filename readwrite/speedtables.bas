sub FF4Rom.ReadSpeedTables()
 dim start as Long
 dim p as SpeedTable ptr
 for index as Integer = 0 to total_speed_tables
  p = speed_tables[index]
  start = &h72820 + index * 2
  p->start = ByteAt(start)
  p->finish = ByteAt(start + 1)
 next
end sub

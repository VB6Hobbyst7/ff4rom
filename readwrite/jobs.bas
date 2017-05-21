sub FF4Rom.ReadJobs()

 dim start as UInteger
 dim temp as String

 for i as Integer = 0 to total_jobs
  if i > usable_jobs then
   jobs(i).name = FF4Text("Extra " + str(i - usable_jobs))
  else
   for j as Integer = 0 to 6
    temp += chr(ByteAt(&h7A964 + i * 7 + j))
   next
   name = temp
  end if

  start = &h9FFDD + i * 3
 
  white = ByteAt(start)
  black = ByteAt(start + 1)
  summon = ByteAt(start + 2)

  if index <= usable_jobs then
   start = &hA81A2 + i * 3
   menu_white = ByteAt(start)
   menu_black = ByteAt(start + 1)
   menu_summon = ByteAt(start + 2) 
  end if
 
 next

end sub


sub FF4Rom.WriteJobs()

 dim start as UInteger
 dim temp as UByte
 
 for i as Integer = 0 to total_jobs
 
  if index <= usable_jobs then
   for j as Integer = 0 to 6
    temp = asc(mid(name, j + 1, 1))
    WriteByte(&h7A964 + i * 7 + j, temp)
   next
  end if
  
  start = &hA81A2 + i * 3
  
  if index <= usable_jobs then 
   WriteByte(start, menu_white)
   WriteByte(start + 1, menu_black)
   WriteByte(start + 2, menu_summon)
  end if
  
  start = &h9FFDD + i * 3
  WriteByte(start, white)
  WriteByte(start + 1, black)
  WriteByte(start + 2, summon)
 
 next

end sub

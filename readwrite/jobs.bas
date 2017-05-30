sub FF4Rom.ReadJobs()

 dim start as UInteger
 dim temp as String

 for i as Integer = 0 to total_jobs
  if i > usable_jobs then
   jobs(i).name = ConvertText("Extra " + str(i - usable_jobs))
  else
   temp = ""
   for j as Integer = 0 to 6
    temp += chr(ByteAt(&h7A964 + i * 7 + j))
   next
   jobs(i).name = temp
  end if

  start = &h9FFDD + i * 3
 
  jobs(i).white = ByteAt(start)
  jobs(i).black = ByteAt(start + 1)
  jobs(i).summon = ByteAt(start + 2)

  if i <= usable_jobs then
   start = &hA81A2 + i * 3
   jobs(i).menu_white = ByteAt(start)
   jobs(i).menu_black = ByteAt(start + 1)
   jobs(i).menu_summon = ByteAt(start + 2) 
  end if
 
 next

end sub


sub FF4Rom.WriteJobs()

 dim start as UInteger
 dim temp as UByte
 
 for i as Integer = 0 to total_jobs
 
  if i <= usable_jobs then
   for j as Integer = 0 to 6
    temp = asc(mid(jobs(i).name, j + 1, 1))
    WriteByte(&h7A964 + i * 7 + j, temp)
   next
  end if
  
  start = &hA81A2 + i * 3
  
  if i <= usable_jobs then 
   WriteByte(start, jobs(i).menu_white)
   WriteByte(start + 1, jobs(i).menu_black)
   WriteByte(start + 2, jobs(i).menu_summon)
  end if
  
  start = &h9FFDD + i * 3
  WriteByte(start, jobs(i).white)
  WriteByte(start + 1, jobs(i).black)
  WriteByte(start + 2, jobs(i).summon)
 
 next

end sub

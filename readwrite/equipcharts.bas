sub FF4Rom.ReadEquipCharts()

 dim start as UInteger = &h7A750
 
 for i as Integer = 0 to total_jobs
  for j as Integer = 0 to 7
   equipcharts(i).flags(j) = iif(ByteAt(start + i * 2) and 2^j, true, false)
  next
  for j as Integer = 0 to 7
   equipcharts(i).flags(8 + j) = iif(ByteAt(start + i * 2 + 1) and 2^j, true, false)
  next
 next

end sub


sub FF4Rom.WriteEquipCharts()

 dim start as UInteger = &h7A750
 dim temp as UByte

 for i as Integer = 0 to total_jobs
  
  temp = 0
  for j as Integer = 0 to 7
   if equipcharts(i).flags(j) then temp += 2^j
  next
  WriteByte(start + i * 2, temp)
  
  temp = 0
  for j as Integer = 0 to 7
   if equipcharts(i).flags(8 + j) then temp += 2^j
  next
  WriteByte(start + i * 2 + 1, temp)
  
 next

end sub

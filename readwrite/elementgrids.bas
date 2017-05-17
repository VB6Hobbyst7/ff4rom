sub FF4Rom.ReadElementGrids()

 for i as Integer = 1 to total_element_grids
  for j as Integer = 0 to 2
   for k as Integer = 0 to 7
    elementgrids(i).flags(j * 8 + k + 1) = iif(ByteAt(&h7A790 + i * 3 + j) and 2^k, true, false)
   next
  next
 next

end sub


sub FF4Rom.WriteElementGrids()

 dim temp as UByte
 
 for i as Integer = 1 to total_element_grids
  for j as Integer = 0 to 2
   temp = 0
   for k as Integer = 0 to 7
    temp += iif(elementgrids(i).flags(j * 8 + k + 1), 2^k, 0)
   next
   WriteByte(&h7A790 + i * 3 + j, temp)
  next
 next

end sub

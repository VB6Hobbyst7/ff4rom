sub FF4Rom.ReadNPCs()

 dim start as UInteger
 dim finish as UInteger
 dim temp as String
 
 for i as Integer = 0 to total_npcs

  npcs(i).sprite = ByteAt(&h97200 + i)
  if ByteAt(&h97400 + i \ 8) and 2 ^ (i mod 8) then
   npcs(i).visible = true
  else
   npcs(i).visible = false
  end if
  
  start = ByteAt(&h99A00 + 2 * i)
  start += ByteAt(&h99A00 + 2 * i + 1) * &h100
  start += &h99E00
  finish = ByteAt(&h99A00 + 2 * (i + 1))
  finish += ByteAt(&h99A00 + 2 * (i + 1) + 1) * &h100
  finish += &h99E00
  for j as UInteger = start to finish - 1
   temp += chr(ByteAt(j))
  next
  'if temp <> "" then speech.Decode(temp)
  
 next

end sub


sub FF4Rom.WriteNPCs()

 dim start as UInteger
 dim temp as UByte
 dim s as String

 for i as Integer = 0 to total_npcs
 
  WriteByte(&h97200 + i, npcs(i).sprite) 
  temp = ByteAt(&h97400 + i \ 8) 
  if npcs(i).visible then
   temp = temp or 2 ^ (i mod 8)
  else
   temp = temp and &hFF - 2 ^ (i mod 8)
  end if
  WriteByte(&h97400 + i \ 8, temp)
  
  'start = ByteAt(&h99A00 + 2 * i)
  'start += ByteAt(&h99A00 + 2 * i + 1) * &h100
  'start += &h99E00
  's = speech.Encode()
  'for j as Integer = 1 to len(s)
   'WriteByte(start, asc(mid(s, j, 1)))
   'start += 1
  'next
  'if index < total_npcs then
   'start -= &h99E00
   'WriteByte(&h99A00 + 2 * (i + 1), start mod &h100)
   'WriteByte(&h99A00 + 2 * (i + 1) + 1, start \ &h100)
  'end if
  
 next

end sub

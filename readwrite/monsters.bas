sub FF4Rom.ReadMonsters()

 dim start as Integer
 
 for index as Integer = 0 to total_monsters
  start = &h71A00 + (index - 1) * 8
  for i as Integer = 0 to 7
   monsters(index).name += chr(ByteAt(start + i))
  next
 next

end sub


sub FF4Rom.WriteMonsters()

 dim start as Integer

 for index as Integer = 0 to total_monsters
  start = &h71A00 + (index - 1) * 8
  for i as Integer = 0 to 7
   if i > len(monsters(index).name) - 1 then
    WriteByte(start + i, asc(space_symbol))
   else
    WriteByte(start + i, asc(mid(monsters(index).name, i + 1, 1)))
   end if
  next
 next

end sub

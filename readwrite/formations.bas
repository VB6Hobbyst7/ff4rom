sub FF4Rom.ReadFormations()

 dim start as UInteger
 dim temp as UByte

 for index as Integer = 0 to total_formations
  
  start = &h70200 + index * 8
  
  temp = ByteAt(start)
  formations(index)->mystery_flag(1) = bit(temp, 0)
  formations(index)->mystery_flag(2) = bit(temp, 1)
  formations(index)->mystery_flag(3) = bit(temp, 2)
  formations(index)->back_attack = bit(temp, 3)
  formations(index)->boss_death = bit(temp, 4)
  formations(index)->egg(3) = bit(temp, 5)
  formations(index)->egg(2) = bit(temp, 6)
  formations(index)->egg(1) = bit(temp, 7)
  
  for i as Integer = 1 to 3
   formations(index)->monster_type(i) = monsters(ByteAt(start + i))
  next
  
  temp = ByteAt(start + 4)
  formations(index)->summons = bit(temp, 0)
  formations(index)->transforms = bit(temp, 1)
  for i as Integer = 1 to 3
   formations(index)->number_appearing(4 - i) = (temp \ 4^i) mod 4
  next
  
  formations(index)->arrangement = ByteAt(start + 5)
  
  temp = ByteAt(start + 6)
  formations(index)->no_flee = bit(temp, 0)
  formations(index)->no_gameover = bit(temp, 1)
  formations(index)->battle_music = iif(bit(temp, 2), 1, 0)
  if bit(temp, 3) then formations(index)->battle_music += 2
  formations(index)->character_battle = bit(temp, 4)
  formations(index)->auto_battle = bit(temp, 5)
  formations(index)->floating = bit(temp, 6)
  formations(index)->transparent = bit(temp, 7)
  
  formations(index)->cursor_style = ByteAt(start + 7)
 
 next

end sub


sub FF4Rom.WriteFormations()

 dim start as UInteger
 dim temp as UByte

 for index as Integer = 0 to total_formations 

  start = &h70200 + index * 8
  
  temp = 0
  if formations(index)->mystery_flag(1) then temp = bitset(temp, 0)
  if formations(index)->mystery_flag(2) then temp = bitset(temp, 1)
  if formations(index)->mystery_flag(3) then temp = bitset(temp, 2)
  if formations(index)->back_attack then temp = bitset(temp, 3)
  if formations(index)->boss_death then temp = bitset(temp, 4)
  if formations(index)->egg(3) then temp = bitset(temp, 5)
  if formations(index)->egg(2) then temp = bitset(temp, 6)
  if formations(index)->egg(1) then temp = bitset(temp, 7)
  WriteByte(start, temp)
  
  for i as Integer = 1 to 3
   WriteByte(start + i, IndexOfMonster(formations(index)->monster_type(i)))
  next
  
  temp = 0
  if formations(index)->summons then temp = bitset(temp, 0)
  if formations(index)->transforms then temp = bitset(temp, 1)
  for i as Integer = 1 to 3
   temp += formations(index)->number_appearing(4 - i) * 4^i
  next
  WriteByte(start + 4, temp)
  
  WriteByte(start + 5, formations(index)->arrangement)
  
  temp = 0
  if formations(index)->no_flee then temp = bitset(temp, 0)
  if formations(index)->no_gameover then temp = bitset(temp, 1)
  temp += formations(index)->battle_music * 4
  if formations(index)->character_battle then temp = bitset(temp, 4)
  if formations(index)->auto_battle then temp = bitset(temp, 5)
  if formations(index)->floating then temp = bitset(temp, 6)
  if formations(index)->transparent then temp = bitset(temp, 7)
  WriteByte(start + 6, temp)
  
  WriteByte(start + 7, formations(index)->cursor_style)
  
 next

end sub

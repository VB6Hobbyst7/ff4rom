sub FF4Rom.ReadMonsters()

 dim start as Integer
 dim address as Integer
 dim temp as UByte
 
 for index as Integer = 0 to total_monsters

  start = &h71A00 + index * 8
  for i as Integer = 0 to 7
   monsters(index)->name += chr(ByteAt(start + i))
  next
 
  start = &h72200 + index * 2
  monsters(index)->gil = ByteAt(start) + ByteAt(start + 1) * &h100
  
  start = &h723C0 + index * 2
  monsters(index)->xp = ByteAt(start) + ByteAt(start + 1) * &h100
  
  start = &h7CC00 + index * 4
  monsters(index)->size = ByteAt(start)
  monsters(index)->pal = ByteAt(start + 1)
  monsters(index)->gfx_ptr1 = ByteAt(start + 2)
  monsters(index)->gfx_ptr2 = ByteAt(start + 3)
  
  address = &h728A0 + index * 2
  start = ByteAt(address) + ByteAt(address + 1) * &h100 - &hA860 + &h72A60
  
  temp = ByteAt(start)
  monsters(index)->boss = bit(temp, 7)
  monsters(index)->level = temp mod &h80
  monsters(index)->hp = ByteAt(start + 1) + ByteAt(start + 2) * &h100
  monsters(index)->physical_attack_index = ByteAt(start + 3)
  monsters(index)->physical_defense_index = ByteAt(start + 4)
  monsters(index)->magical_defense_index = ByteAt(start + 5)
  monsters(index)->speed_index = ByteAt(start + 6)
  monsters(index)->drop_table = drop_tables(ByteAt(start + 7) mod &h40)
  monsters(index)->drop_rate = ByteAt(start + 7) \ &h40
  monsters(index)->attack_sequence_group = ByteAt(start + 8)
  temp = ByteAt(start + 9)
  monsters(index)->has_attack_element = bit(temp, 7)
  monsters(index)->has_resistances = bit(temp, 6)
  monsters(index)->has_weaknesses = bit(temp, 5)
  monsters(index)->has_spell_power = bit(temp, 4)
  monsters(index)->has_race = bit(temp, 3)
  monsters(index)->has_reaction = bit(temp, 2)
  
  start += 10
  
  if monsters(index)->has_attack_element then
   monsters(index)->attack_element.flags.Destroy()
   for i as Integer = 0 to 7
    if bit(ByteAt(start), i) then monsters(index)->attack_element.flags.AddValue(i)
    if bit(ByteAt(start + 1), i) then monsters(index)->attack_element.flags.AddValue(i + 8)
    if bit(ByteAt(start + 2), i) then monsters(index)->attack_element.flags.AddValue(i + 16)
   next
   start += 3
  end if
  
  if monsters(index)->has_resistances then
   monsters(index)->resistances.flags.Destroy()
   for i as Integer = 0 to 7
    if bit(ByteAt(start), i) then monsters(index)->resistances.flags.AddValue(i)
    if bit(ByteAt(start + 1), i) then monsters(index)->resistances.flags.AddValue(i + 8)
    if bit(ByteAt(start + 2), i) then monsters(index)->resistances.flags.AddValue(i + 16)
   next
   start += 3
  end if
  
  if monsters(index)->has_weaknesses then
   monsters(index)->resistances.flags.Destroy()
   for i as Integer = 0 to 7
    if bit(ByteAt(start), i) then monsters(index)->weaknesses.flags.AddValue(i)
   next
   start += 1
  end if
  
  if monsters(index)->has_spell_power then
   monsters(index)->spell_power = ByteAt(start)
   start += 1
  end if
  
  if monsters(index)->has_race then
   for i as Integer = 0 to 7
    monsters(index)->races(i) = bit(start, i)
   next
   start += 1
  end if
  
  if monsters(index)->has_reaction then
   monsters(index)->reaction_index = ByteAt(start)
   start += 1
  end if
  
 next

end sub


sub FF4Rom.WriteMonsters()

 dim start as Integer
 dim address as UInteger
 dim temp as UByte

 for index as Integer = 0 to total_monsters

  start = &h71A00 + index * 8
  for i as Integer = 0 to 7
   if i > len(monsters(index)->name) - 1 then
    WriteByte(start + i, asc(space_symbol))
   else
    WriteByte(start + i, asc(mid(monsters(index)->name, i + 1, 1)))
   end if
  next

  start = &h7CC00 + index * 4
  WriteByte(start, monsters(index)->size)
  WriteByte(start + 1, monsters(index)->pal)
  WriteByte(start + 2, monsters(index)->gfx_ptr1)
  WriteByte(start + 3, monsters(index)->gfx_ptr2)
   
  start = &h72200 + index * 2
  WriteByte(start, monsters(index)->gil mod &h100)
  WriteByte(start + 1, monsters(index)->gil \ &h100)
  
  start = &h723C0 + index * 2
  WriteByte(start, monsters(index)->xp mod &h100)
  WriteByte(start + 1, monsters(index)->xp \ &h100)

  address = &h728A0 + index * 2
  start = ByteAt(address) + ByteAt(address + 1) * &h100 - &hA860 + &h72A60
  
  temp = monsters(index)->level
  if monsters(index)->boss then temp += &h80
  WriteByte(start, temp)
  WriteByte(start + 1, monsters(index)->hp mod &h100)
  WriteByte(start + 2, monsters(index)->hp \ &h100)
  WriteByte(start + 3, monsters(index)->physical_attack_index)
  WriteByte(start + 4, monsters(index)->physical_defense_index)
  WriteByte(start + 5, monsters(index)->magical_defense_index)
  WriteByte(start + 6, monsters(index)->speed_index)
  WriteByte(start + 7, IndexOfDropTable(monsters(index)->drop_table) + monsters(index)->drop_rate * &h40)
  WriteByte(start + 8, monsters(index)->attack_sequence_group)
  temp = 0
  if monsters(index)->has_attack_element then temp = bitset(temp, 7)
  if monsters(index)->has_resistances then temp = bitset(temp, 6)
  if monsters(index)->has_weaknesses then temp = bitset(temp, 5)
  if monsters(index)->has_spell_power then temp = bitset(temp, 4)
  if monsters(index)->has_race then temp = bitset(temp, 3)
  if monsters(index)->has_reaction then temp = bitset(temp, 2)
  WriteByte(start + 9, temp)
  
  start += 10
  
  if monsters(index)->has_attack_element then
   for i as Integer = 0 to 2
    temp = 0
    for j as Integer = 0 to 7
     if monsters(index)->attack_element.flags.ContainsValue(i * 8 + j) then temp = bitset(temp, j)
    next
    WriteByte(start + i, temp)
   next
   start += 3
  end if
  
  if monsters(index)->has_resistances then
   for i as Integer = 0 to 2
    temp = 0
    for j as Integer = 0 to 7
     if monsters(index)->resistances.flags.ContainsValue(i * 8 + j) then temp = bitset(temp, j)
    next
    WriteByte(start + i, temp)
   next
   start += 3
  end if
  
  if monsters(index)->has_weaknesses then
   temp = 0
   for j as Integer = 0 to 7
    if monsters(index)->weaknesses.flags.ContainsValue(j) then temp = bitset(temp, j)
   next
   WriteByte(start, temp)
   start += 1
  end if
  
  if monsters(index)->has_spell_power then
   WriteByte(start, monsters(index)->spell_power)
   start += 1
  end if
  
  if monsters(index)->has_race then
   temp = 0
   for j as Integer = 0 to 7
    if monsters(index)->races(j) then temp = bitset(temp, j)
   next
   WriteByte(start, temp)
   start += 1
  end if
  
  if monsters(index)->has_reaction then
   WriteByte(start, monsters(index)->reaction_index)
   start += 1
  end if

  if index < total_monsters then
   start = start - &h72A60 + &hA860
   address = &h728A0 + (index + 1) * 2
   WriteByte(address, start mod &h100)
   WriteByte(address + 1, start \ &h100)
  end if
  
 next

end sub

sub FF4Rom.ReadMonsters()

 dim start as Integer
 dim address as Integer
 dim temp as UByte
 
 for index as Integer = 0 to total_monsters

  start = &h71A00 + index * 8
  for i as Integer = 0 to 7
   monsters(index).name += chr(ByteAt(start + i))
  next
 
  start = &h72200 + index * 2
  monsters(index).gil = ByteAt(start) + ByteAt(start + 1) * &h100
  
  start = &h723C0 + index * 2
  monsters(index).xp = ByteAt(start) + ByteAt(start + 1) * &h100
  
  start = &h7CC00 + index * 4
  monsters(index).size = ByteAt(start)
  monsters(index).pal = ByteAt(start + 1)
  monsters(index).gfx_ptr1 = ByteAt(start + 2)
  monsters(index).gfx_ptr2 = ByteAt(start + 3)
  
  address = &h728A0 + index * 2
  start = ByteAt(address) + ByteAt(address + 1) * &h100 - &hA860 + &h72A60
  
  temp = ByteAt(start)
  monsters(index).boss = iif(temp and &h80, true, false)
  monsters(index).level = temp mod &h80
  monsters(index).hp = ByteAt(start + 1) + ByteAt(start + 2) * &h100
  monsters(index).physical_attack_index = ByteAt(start + 3)
  monsters(index).physical_defense_index = ByteAt(start + 4)
  monsters(index).magical_defense_index = ByteAt(start + 5)
  monsters(index).speed_index = ByteAt(start + 6)
  monsters(index).drop_index = ByteAt(start + 7) mod &h40
  monsters(index).drop_rate = ByteAt(start + 7) \ &h40
  monsters(index).attack_sequence_group = ByteAt(start + 8)
  temp = ByteAt(start + 9)
  monsters(index).has_attack_element = temp and &h80
  monsters(index).has_resistances = temp and &h40
  monsters(index).has_weaknesses = temp and &h20
  monsters(index).has_spell_power = temp and &h10
  monsters(index).has_race = temp and 8
  monsters(index).has_reaction = temp and 4
  
  start += 10
  
  if monsters(index).has_attack_element then
   for i as Integer = 0 to 7
    monsters(index).attack_element.flags(i) = iif(ByteAt(start) and 2^i, true, false)
    monsters(index).attack_element.flags(8 + i) = iif(ByteAt(start + 1) and 2^i, true, false)
    monsters(index).attack_element.flags(16 + i) = iif(ByteAt(start + 2) and 2^i, true, false)
   next
   start += 3
  end if
  
  if monsters(index).has_resistances then
   for i as Integer = 0 to 7
    monsters(index).resistances.flags(i) = iif(ByteAt(start) and 2^i, true, false)
    monsters(index).resistances.flags(8 + i) = iif(ByteAt(start + 1) and 2^i, true, false)
    monsters(index).resistances.flags(16 + i) = iif(ByteAt(start + 2) and 2^i, true, false)
   next
   start += 3
  end if
  
  if monsters(index).has_weaknesses then
   for i as Integer = 0 to 7
    monsters(index).weaknesses.flags(i) = iif(ByteAt(start) and 2^i, true, false)
   next
   start += 1
  end if
  
  if monsters(index).has_spell_power then
   monsters(index).spell_power = ByteAt(start)
   start += 1
  end if
  
  if monsters(index).has_race then
   for i as Integer = 0 to 7
    monsters(index).races(i) = iif(ByteAt(start) and 2^i, true, false)
   next
   start += 1
  end if
  
  if monsters(index).has_reaction then
   monsters(index).reaction_index = ByteAt(start)
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
   if i > len(monsters(index).name) - 1 then
    WriteByte(start + i, asc(space_symbol))
   else
    WriteByte(start + i, asc(mid(monsters(index).name, i + 1, 1)))
   end if
  next

  start = &h7CC00 + index * 4
  WriteByte(start, monsters(index).size)
  WriteByte(start + 1, monsters(index).pal)
  WriteByte(start + 2, monsters(index).gfx_ptr1)
  WriteByte(start + 3, monsters(index).gfx_ptr2)
   
  start = &h72200 + index * 2
  WriteByte(start, monsters(index).gil mod &h100)
  WriteByte(start + 1, monsters(index).gil \ &h100)
  
  start = &h723C0 + index * 2
  WriteByte(start, monsters(index).xp mod &h100)
  WriteByte(start + 1, monsters(index).xp \ &h100)

  address = &h728A0 + index * 2
  start = ByteAt(address) + ByteAt(address + 1) * &h100 - &hA860 + &h72A60
  
  temp = monsters(index).level
  if monsters(index).boss then temp += &h80
  WriteByte(start, temp)
  WriteByte(start + 1, monsters(index).hp mod &h100)
  WriteByte(start + 2, monsters(index).hp \ &h100)
  WriteByte(start + 3, monsters(index).physical_attack_index)
  WriteByte(start + 4, monsters(index).physical_defense_index)
  WriteByte(start + 5, monsters(index).magical_defense_index)
  WriteByte(start + 6, monsters(index).speed_index)
  WriteByte(start + 7, monsters(index).drop_index + monsters(index).drop_rate * &h40)
  WriteByte(start + 8, monsters(index).attack_sequence_group)
  temp = 0
  if monsters(index).has_attack_element then temp += &h80
  if monsters(index).has_resistances then temp += &h40
  if monsters(index).has_weaknesses then temp += &h20
  if monsters(index).has_spell_power then temp += &h10
  if monsters(index).has_race then temp += 8
  if monsters(index).has_reaction then temp += 4
  WriteByte(start + 9, temp)
  
  start += 10
  
  if monsters(index).has_attack_element then
   for i as Integer = 0 to 2
    temp = 0
    for j as Integer = 0 to 7
     if monsters(index).attack_element.flags(i * 8 + j) then temp += 2 ^ j
    next
    WriteByte(start + i, temp)
   next
   start += 3
  end if
  
  if monsters(index).has_resistances then
   for i as Integer = 0 to 2
    temp = 0
    for j as Integer = 0 to 7
     if monsters(index).resistances.flags(i * 8 + j) then temp += 2^j
    next
    WriteByte(start + i, temp)
   next
   start += 3
  end if
  
  if monsters(index).has_weaknesses then
   temp = 0
   for j as Integer = 0 to 7
    if monsters(index).weaknesses.flags(j) then temp += 2 ^ (j - 1)
   next
   WriteByte(start, temp)
   start += 1
  end if
  
  if monsters(index).has_spell_power then
   WriteByte(start, monsters(index).spell_power)
   start += 1
  end if
  
  if monsters(index).has_race then
   temp = 0
   for j as Integer = 0 to 7
    if monsters(index).races(j) then temp += 2^j
   next
   WriteByte(start, temp)
   start += 1
  end if
  
  if monsters(index).has_reaction then
   WriteByte(start, monsters(index).reaction_index)
   start += 1
  end if

  if index < total_monsters then
   start = start - &h72A60 + &hA860
   address = &h728A0 + index * 2
   WriteByte(address, start mod &h100)
   WriteByte(address + 1, start \ &h100)
  end if
  
 next

end sub

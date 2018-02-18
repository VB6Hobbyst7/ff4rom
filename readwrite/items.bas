sub FF4Rom.ReadItems()

 dim start as Integer
 dim index as Integer

 descriptions_range.SetRange(ByteAt(&hA9BB), ByteAt(&hA9BF))
 weapons_range.SetRange(0, &h5F)
 armors_range.SetRange(&h60, &hAF)
 consumables_range.SetRange(&hB0, &hDD)
 tools_range.SetRange(&hDE, &hFF)
 two_handed_range.SetRange(ByteAt(&hC22B), ByteAt(&hC1BE) - 1)
 bow_range.SetRange(ByteAt(&hC1BE), ByteAt(&hC286) - 1)
 arrow_range.SetRange(ByteAt(&hC286), ByteAt(&hC287))
 shield_range.SetRange(armors_range.start + 1, ByteAt(&hC1DC) - 1)
 head_range.SetRange(ByteAt(&hC1DC), ByteAt(&hC1D2) - 1)
 body_range.SetRange(ByteAt(&hC1D2), ByteAt(&hC1D7) - 1)
 arms_range.SetRange(ByteAt(&hC1D7), ByteAt(&hC1D8))
 key_items_range.SetRange(ByteAt(&hCB30), total_items)
 special_key_item1 = items(ByteAt(&hCB28))
 special_key_item2 = items(ByteAt(&hCB2C))
 
 for i as Integer = weapons_range.start to weapons_range.finish
  items(i) = weapons(i - weapons_range.start)
 next
 
 for i as Integer = armors_range.start to armors_range.finish
  items(i) = armors(i - armors_range.start)
 next

 for i as Integer = consumables_range.start to consumables_range.finish
  items(i) = consumables(i - consumables_range.start)
 next

 for i as Integer = tools_range.start to tools_range.finish
  items(i) = tools(i - tools_range.start)
 next
 
 for i as Integer = 0 to total_items
 
  items(i)->name = ""
  for j as Integer = 0 to 8
   items(i)->name += chr(ByteAt(&h78200 + i * 9 + j))
  next
  
  if descriptions_range.InRange(i) then
   items(i)->description = ByteAt(&h7B000 + i - descriptions_range.start)
  end if
  
  items(i)->price_code = ByteAt(&h7A650 + i)
  
  if consumables_range.InRange(i) then
   index = i - consumables_range.start
   start = &h79880 + index * 6
   consumables(index)->delay = ByteAt(start) mod &h20
   consumables(index)->target = ByteAt(start) \ &h20
   consumables(index)->power = ByteAt(start + 1)
   consumables(index)->boss = bit(ByteAt(start + 2), 7)
   consumables(index)->success = ByteAt(start + 2) mod &h80
   consumables(index)->impact = bit(ByteAt(start + 3), 7)
   consumables(index)->effect = ByteAt(start + 3) mod &h80
   consumables(index)->damage = bit(ByteAt(start + 4), 7)
   consumables(index)->element_code = element_status_tables(ByteAt(start + 4) mod &h80)
   consumables(index)->reflectable = bit(ByteAt(start + 5), 7)
   consumables(index)->mp_cost = ByteAt(start + 5) mod &h80
   consumables(index)->visual = ByteAt(&h7D790 + index)
  end if
  
  if armors_range.InRange(i) then
   index = i - armors_range.start
   start = &h79600
   armors(index)->magnetic = bit(ByteAt(start + index * 8), 7)
   armors(index)->magic_evade = ByteAt(start + index * 8) mod &h80
   armors(index)->defense = ByteAt(start + index * 8 + 1)
   armors(index)->evade = ByteAt(start + index * 8 + 2)
   armors(index)->magic_defense = ByteAt(start + index * 8 + 3)
   armors(index)->elements = element_status_tables(ByteAt(start + index * 8 + 4) mod &h40)
   for j as Integer = 0 to 7
    armors(index)->races(j) = bit(ByteAt(start + index * 8 + 5), j)
   next
   armors(index)->equip_code = equip_tables(ByteAt(start + index * 8 + 6) mod &h20)
   armors(index)->stat_bonus.amount = ByteAt(start + index * 8 + 7) mod 8
   for j as Integer = 0 to 4
    armors(index)->stat_bonus.stats(4 - j) = bit(ByteAt(start + index * 8 + 7), j + 3)
   next
  end if
  
  if weapons_range.InRange(i) then
   index = i - weapons_range.start
   start = &h79300
   for j as Integer = 0 to 7
    weapons(index)->properties(j) = bit(ByteAt(start + i * 8), j)
   next
   weapons(index)->attack = ByteAt(start + i * 8 + 1)
   weapons(index)->hit = ByteAt(start + i * 8 + 2) mod &h80
   weapons(index)->casts = ByteAt(start + i * 8 + 3)
   weapons(index)->elements = element_status_tables(ByteAt(start + i * 8 + 4))
   for j as Integer = 0 to 7
    weapons(index)->races(j) = bit(ByteAt(start + i * 8 + 5), j)
   next
   weapons(index)->equip_code = equip_tables(ByteAt(start + i * 8 + 6) mod &h20)
   weapons(index)->properties(8) = bit(ByteAt(start + i * 8 + 6), 6)
   weapons(index)->properties(9) = bit(ByteAt(start + i * 8 + 6), 7)
   weapons(index)->stat_bonus.amount = ByteAt(start + i * 8 + 7) mod 8
   for j as Integer = 0 to 4
    weapons(index)->stat_bonus.stats(4 - j) = bit(ByteAt(start + i * 8 + 7), j + 3)
   next
   start = &h7A010
   weapons(index)->colors = ByteAt(start + i * 4)
   weapons(index)->sprite = ByteAt(start + i * 4 + 1)
   weapons(index)->slash = ByteAt(start + i * 4 + 2)
   weapons(index)->swing = ByteAt(start + i * 4 + 3)
   weapons(index)->spell_power = ByteAt(&h79270 + i)
   weapons(index)->cast_visual = ByteAt(&h7D6E0 + i)
  end if
 
 next

end sub


sub FF4Rom.WriteItems()

 dim start as Integer
 dim temp as UByte
 dim index as Integer

 WriteByte(&hA9BB, descriptions_range.start)
 WriteByte(&hA9BF, descriptions_range.finish)

 for i as Integer = 0 to total_items
 
  for j as Integer = 0 to 8
   WriteByte(&h78200 + i * 9 + j, iif(j + 1 > len(items(i)->name), &hFF, asc(mid(items(i)->name, j + 1, 1))))
  next
  
  if descriptions_range.InRange(i) then
   WriteByte(&h7B000 + i - descriptions_range.start, items(i)->description)
  end if
  
  WriteByte(&h7A650 + i, items(i)->price_code)
  
  if consumables_range.InRange(i) then
   index = i - consumables_range.start
   start = &h79880 + index * 6
   WriteByte(start, consumables(index)->delay + consumables(index)->target * &h20)
   WriteByte(start + 1, consumables(index)->power)
   temp = consumables(index)->success
   if not consumables(index)->boss then temp += &h80
   WriteByte(start + 2, temp)
   temp = consumables(index)->effect
   if consumables(index)->impact then temp += &h80
   WriteByte(start + 3, temp)
   temp = IndexOfElementStatusTable(consumables(index)->element_code)
   if not consumables(index)->damage then temp += &h80
   WriteByte(start + 4, temp)
   temp = consumables(index)->mp_cost
   if not consumables(index)->reflectable then temp += &h80
   WriteByte(start + 5, temp)
   WriteByte(&h7D790 + index, consumables(index)->visual)
  end if
  
  if armors_range.InRange(i) then
   index = i - armors_range.start
   start = &h79600
   temp = armors(index)->magic_evade
   if armors(index)->magnetic then temp += &h80
   WriteByte(start + index * 8, temp)
   WriteByte(start + index * 8 + 1, armors(index)->defense)
   WriteByte(start + index * 8 + 2, armors(index)->evade)
   WriteByte(start + index * 8 + 3, armors(index)->magic_defense)
   temp = IndexOfElementStatusTable(armors(index)->elements)
   temp += (ByteAt(start + index * 8 + 4) \ &h40) * &h40
   WriteByte(start + index * 8 + 4, temp)
   temp = 0
   for j as Integer = 0 to 7
    if armors(index)->races(j) then temp = bitset(temp, j)
   next
   WriteByte(start + index * 8 + 5, temp)
   temp = IndexOfEquipTable(armors(index)->equip_code)
   temp += (ByteAt(start + index * 8 + 6) \ &h20) * &h20
   WriteByte(start + index * 8 + 6, temp)
   temp = armors(index)->stat_bonus.amount
   for j as Integer = 0 to 4
    if armors(index)->stat_bonus.stats(4 - j) then temp = bitset(temp, j + 3)
   next
   WriteByte(start + index * 8 + 7, temp)
  end if
  
  if weapons_range.InRange(i) then
   index = i - weapons_range.start
   start = &h79300
   temp = 0
   for j as Integer = 0 to 7
    if weapons(index)->properties(j) then temp = bitset(temp, j)
   next
   WriteByte(start + i * 8, temp)
   WriteByte(start + i * 8 + 1, weapons(index)->attack)
   temp = weapons(index)->hit
   if bit(ByteAt(start + i * 8 + 2), 7) then temp = bitset(temp, 7)
   WriteByte(start + i * 8 + 2, temp)
   WriteByte(start + i * 8 + 3, weapons(index)->casts)
   WriteByte(start + i * 8 + 4, IndexOfElementStatusTable(weapons(index)->elements))
   temp = 0
   for j as Integer = 0 to 7
    if weapons(index)->races(j) then temp = bitset(temp, j)
   next
   WriteByte(start + i * 8 + 5, temp)
   temp = IndexOfEquipTable(weapons(index)->equip_code)
   if weapons(index)->properties(8) then temp = bitset(temp, 6)
   if weapons(index)->properties(9) then temp = bitset(temp, 7)
   WriteByte(start + i * 8 + 6, temp)
   temp = weapons(index)->stat_bonus.amount
   for j as Integer = 0 to 4
    if weapons(index)->stat_bonus.stats(4 - j) then temp = bitset(temp, j + 3)
   next
   WriteByte(start + i * 8 + 7, temp)
   start = &h7A010
   WriteByte(start + i * 4, weapons(index)->colors)
   WriteByte(start + i * 4 + 1, weapons(index)->sprite)
   WriteByte(start + i * 4 + 2, weapons(index)->slash)
   WriteByte(start + i * 4 + 3, weapons(index)->swing)
   WriteByte(&h79270 + i, weapons(index)->spell_power)
   WriteByte(&h7D6E0 + i, weapons(index)->cast_visual)
  end if
 
 next

end sub

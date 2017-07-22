sub FF4Rom.ReadItems()

 dim start as Integer
 dim index as Integer

 descriptions_range.SetRange(ByteAt(&hA9BB), ByteAt(&hA9BF))
 weapons_range.SetRange(0, &h5F)
 armors_range.SetRange(&h60, &hAF)
 medicines_range.SetRange(&hB0, &hDD)
 tools_range.SetRange(&hDE, &hFF)
 two_handed_range.SetRange(ByteAt(&hC22B), ByteAt(&hC1BE) - 1)
 bow_range.SetRange(ByteAt(&hC1BE), ByteAt(&hC286) - 1)
 arrow_range.SetRange(ByteAt(&hC286), ByteAt(&hC287))
 shield_range.SetRange(armors_range.start + 1, ByteAt(&hC1DC) - 1)
 head_range.SetRange(ByteAt(&hC1DC), ByteAt(&hC1D2) - 1)
 body_range.SetRange(ByteAt(&hC1D2), ByteAt(&hC1D7) - 1)
 arms_range.SetRange(ByteAt(&hC1D7), ByteAt(&hC1D8))
 key_items_range.SetRange(ByteAt(&hCB30), total_items)
 special_key_item1 = ByteAt(&hCB28)
 special_key_item2 = ByteAt(&hCB2C)

 for i as Integer = 0 to total_items
 
  items(i).name = ""
  for j as Integer = 0 to 8
   items(i).name += chr(ByteAt(&h78200 + i * 9 + j))
  next
  
  if descriptions_range.InRange(i) then
   items(i).description = ByteAt(&h7B000 + i - descriptions_range.start)
  end if
  
  items(i).price_code = ByteAt(&h7A650 + i)
  
  if medicines_range.InRange(i) then
   index = i - medicines_range.start
   start = &h79880 + index * 6
   items(i).delay = ByteAt(start) mod &h20
   items(i).target = ByteAt(start) \ &h20
   items(i).power = ByteAt(start + 1)
   items(i).boss = iif(ByteAt(start + 2) and &h80, false, true)
   items(i).success = ByteAt(start + 2) mod &h80
   items(i).impact = iif(ByteAt(start + 3) and &h80, true, false)
   items(i).effect = ByteAt(start + 3) mod &h80
   items(i).damage = iif(ByteAt(start + 4) and &h80, false, true)
   items(i).element_code = ByteAt(start + 4) mod &h80
   items(i).reflectable = iif(ByteAt(start + 5) and &h80, false, true)
   items(i).mp_cost = ByteAt(start + 5) mod &h80
   items(i).visual = ByteAt(&h7D790 + index)
   'items(i).price_code = ByteAt(&h7A700 + index)
  end if
  
  if armors_range.InRange(i) then
   index = i - armors_range.start
   start = &h79600
   items(i).magnetic = iif(ByteAt(start + index * 8) and &h80, true, false)
   items(i).magic_evade = ByteAt(start + index * 8) mod &h80
   items(i).defense = ByteAt(start + index * 8 + 1)
   items(i).evade = ByteAt(start + index * 8 + 2)
   items(i).magic_defense = ByteAt(start + index * 8 + 3)
   items(i).element_code = ByteAt(start + index * 8 + 4) mod &h40
   for j as Integer = 0 to 7
    items(i).races(j) = iif(ByteAt(start + index * 8 + 5) and 2^j, true, false)
   next
   items(i).equip_code = ByteAt(start + index * 8 + 6) mod &h20
   items(i).stat_bonus.amount = ByteAt(start + index * 8 + 7) mod 8
   for j as Integer = 0 to 4
    items(i).stat_bonus.stats(4 - j) = iif(ByteAt(start + index * 8 + 7) and 2^(j + 3), true, false)
   next
  end if
  
  if weapons_range.InRange(i) then
   start = &h79300
   for j as Integer = 0 to 7
    items(i).properties(j) = iif(ByteAt(start + i * 8) and 2^j, true, false)
   next
   items(i).attack = ByteAt(start + i * 8 + 1)
   items(i).hit = ByteAt(start + i * 8 + 2) mod &h80
   items(i).casts = ByteAt(start + i * 8 + 3)
   items(i).element_code = ByteAt(start + i * 8 + 4)
   for j as Integer = 0 to 7
    items(i).races(j) = iif(ByteAt(start + i * 8 + 5) and 2^j, true, false)
   next
   items(i).equip_code = ByteAt(start + i * 8 + 6) mod &h20
   items(i).properties(8) = iif(ByteAt(start + i * 8 + 6) and &h40, true, false)
   items(i).properties(9) = iif(ByteAt(start + i * 8 + 6) and &h80, true, false)
   items(i).stat_bonus.amount = ByteAt(start + i * 8 + 7) mod 8
   for j as Integer = 0 to 4
    items(i).stat_bonus.stats(4 - j) = iif(ByteAt(start + i * 8 + 7) and 2^(j + 3), true, false)
   next
   start = &h7A010
   items(i).colors = ByteAt(start + i * 4)
   items(i).sprite = ByteAt(start + i * 4 + 1)
   items(i).slash = ByteAt(start + i * 4 + 2)
   items(i).swing = ByteAt(start + i * 4 + 3)
   items(i).spell_power = ByteAt(&h79270 + i)
   items(i).cast_visual = ByteAt(&h7D6E0 + i)
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
   WriteByte(&h78200 + i * 9 + j, iif(j + 1 > len(items(i).name), &hFF, asc(mid(items(i).name, j + 1, 1))))
  next
  
  if descriptions_range.InRange(i) then
   WriteByte(&h7B000 + i - descriptions_range.start, items(i).description)
  end if
  
  WriteByte(&h7A650 + i, items(i).price_code)
  
  if medicines_range.InRange(i) then
   index = i - medicines_range.start
   start = &h79880 + index * 6
   WriteByte(start, items(i).delay + items(i).target * &h20)
   WriteByte(start + 1, items(i).power)
   temp = items(i).success
   if not items(i).boss then temp += &h80
   WriteByte(start + 2, temp)
   temp = items(i).effect
   if items(i).impact then temp += &h80
   WriteByte(start + 3, temp)
   temp = items(i).element_code
   if not items(i).damage then temp += &h80
   WriteByte(start + 4, temp)
   temp = items(i).mp_cost
   if not items(i).reflectable then temp += &h80
   WriteByte(start + 5, temp)
   WriteByte(&h7D790 + index, items(i).visual)
   'WriteByte(&h7A700 + index, items(i).price_code)
  end if
  
  if armors_range.InRange(i) then
   index = i - armors_range.start
   start = &h79600
   temp = items(i).magic_evade
   if items(i).magnetic then temp += &h80
   WriteByte(start + index * 8, temp)
   WriteByte(start + index * 8 + 1, items(i).defense)
   WriteByte(start + index * 8 + 2, items(i).evade)
   WriteByte(start + index * 8 + 3, items(i).magic_defense)
   temp = items(i).element_code
   temp += (ByteAt(start + index * 8 + 4) \ &h40) * &h40
   WriteByte(start + index * 8 + 4, temp)
   temp = 0
   for j as Integer = 0 to 7
    if items(i).races(j) then temp += 2^j
   next
   WriteByte(start + index * 8 + 5, temp)
   temp = items(i).equip_code
   temp += (ByteAt(start + index * 8 + 6) \ &h20) * &h20
   WriteByte(start + index * 8 + 6, temp)
   temp = items(i).stat_bonus.amount
   for j as Integer = 0 to 4
    if items(i).stat_bonus.stats(4 - j) then temp += 2^(j + 3)
   next
   WriteByte(start + index * 8 + 7, temp)
  end if
  
  if weapons_range.InRange(i) then
   start = &h79300
   temp = 0
   for j as Integer = 0 to 7
    if items(i).properties(j) then temp += 2^j
   next
   WriteByte(start + i * 8, temp)
   WriteByte(start + i * 8 + 1, items(i).attack)
   temp = items(i).hit
   temp += iif(ByteAt(start + i * 8 + 2) and &h80, &h80, 0)
   WriteByte(start + i * 8 + 2, temp)
   WriteByte(start + i * 8 + 3, items(i).casts)
   WriteByte(start + i * 8 + 4, items(i).element_code)
   temp = 0
   for j as Integer = 0 to 7
    if items(i).races(j) then temp += 2^j
   next
   WriteByte(start + i * 8 + 5, temp)
   temp = items(i).equip_code
   if items(i).properties(8) then temp += &h40
   if items(i).properties(9) then temp += &h80
   WriteByte(start + i * 8 + 6, temp)
   temp = items(i).stat_bonus.amount
   for j as Integer = 0 to 4
    if items(i).stat_bonus.stats(4 - j) then temp += 2^(j + 3)
   next
   WriteByte(start + i * 8 + 7, temp)
   start = &h7A010
   WriteByte(start + i * 4, items(i).colors)
   WriteByte(start + i * 4 + 1, items(i).sprite)
   WriteByte(start + i * 4 + 2, items(i).slash)
   WriteByte(start + i * 4 + 3, items(i).swing)
   WriteByte(&h79270 + i, items(i).spell_power)
   WriteByte(&h7D6E0 + i, items(i).cast_visual)
  end if
 
 next

end sub

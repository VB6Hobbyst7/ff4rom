sub FF4Rom.ReadSpells()

 dim start as Integer
 
 player_spells.SetRange(0, ByteAt(&h14D9C) - 1)
 menu_spells.SetRange(ByteAt(&hB480), ByteAt(&hB484) - 1)
 white_spells.SetRange(0, ByteAt(&h1CF24) - 1)
 summon_spells.SetRange(ByteAt(&h1CF28), ByteAt(&h1CF2C) - 1)
 black_spells.SetRange(summon_spells.finish + 1, player_spells.finish)

 for i as Integer = 0 to total_spells 
  
  spells(i)->name = ""
  if player_spells.InRange(i) then
   for j as Integer = 0 to 5
    spells(i)->name += chr(ByteAt(&h78B00 + i * 6 + j))
   next
  else
   for j as Integer = 0 to 7
    spells(i)->name += chr(ByteAt(&h78B00 + player_spells.finish * 6 + (i - player_spells.finish) * 8 + j))
   next
  end if
 
  start = &h799A0 + i * 6
  spells(i)->delay = ByteAt(start) mod &h20
  spells(i)->target = ByteAt(start) \ &h20
  spells(i)->power = ByteAt(start + 1)
  spells(i)->boss = iif(ByteAt(start + 2) and &h80, false, true)
  spells(i)->hit = ByteAt(start + 2) mod &h80
  spells(i)->damage = iif(ByteAt(start + 3) and &h80, false, true)
  spells(i)->effect = ByteAt(start + 3) mod &h80
  spells(i)->impact = iif(ByteAt(start + 4) and &h80, true, false)
  spells(i)->element_status = element_status_tables(ByteAt(start + 4) mod &h80)
  spells(i)->reflectable = iif(ByteAt(start + 5) and &h80, false, true)
  spells(i)->mp_cost = ByteAt(start + 5) mod &h80

  start = &h7A250 + i * 4
  spells(i)->colors = ByteAt(start)
  spells(i)->sprites = ByteAt(start + 1)
  spells(i)->visual1 = ByteAt(start + 2)
  spells(i)->visual2 = ByteAt(start + 3)
  
  spells(i)->sound = ByteAt(&h7A550 + i)
  
 next 

end sub


sub FF4Rom.WriteSpells()

 dim start as Integer
 dim temp as UByte

 WriteByte(&h14D9C, player_spells.finish + 1)
 WriteByte(&hB480, menu_spells.start)
 WriteByte(&hB484, menu_spells.finish + 1)
 WriteByte(&h1CF24, white_spells.finish + 1)
 WriteByte(&h1CF28, summon_spells.start)
 WriteByte(&h1CF2C, summon_spells.finish + 1)

 for i as Integer = 0 to total_spells 
  
  if player_spells.InRange(i) then
   for j as Integer = 0 to 5
    WriteByte(&h78B00 + i * 6 + j, asc(mid(spells(i)->name, j + 1, 1)))
   next
  else
   for j as Integer = 0 to 7
    WriteByte(&h78B00 + player_spells.finish * 6 + (i - player_spells.finish) * 8 + j, asc(mid(spells(i)->name, j + 1, 1)))
   next
  end if
  
  start = &h799A0 + i * 6
  temp = spells(i)->delay + spells(i)->target * &h20
  WriteByte(start, temp)
  WriteByte(start + 1, spells(i)->power)
  temp = spells(i)->hit + iif(spells(i)->boss, 0, &h80)
  WriteByte(start + 2, temp)
  temp = spells(i)->effect + iif(spells(i)->damage, 0, &h80)
  WriteByte(start + 3, temp)
  temp = IndexOfElementStatusTable(spells(i)->element_status) + iif(spells(i)->impact, &h80, 0)
  WriteByte(start + 4, temp)
  temp = spells(i)->mp_cost + iif(spells(i)->reflectable, 0, &h80)
  WriteByte(start + 5, temp)

  start = &h7A250 + i * 4
  WriteByte(start, spells(i)->colors)
  WriteByte(start + 1, spells(i)->sprites)
  WriteByte(start + 2, spells(i)->visual1)
  WriteByte(start + 3, spells(i)->visual2)
  
  WriteByte(&h7A550 + i, spells(i)->sound)
  
 next 

end sub

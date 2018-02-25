sub FF4Rom.ReadSpells()
 dim start as Integer
 player_spell_range.SetRange(0, ByteAt(&h14D9C) - 1)
 menu_spell_range.SetRange(ByteAt(&hB480), ByteAt(&hB484) - 1)
 white_range.SetRange(0, ByteAt(&h1CF24) - 1)
 summon_range.SetRange(ByteAt(&h1CF28), ByteAt(&h1CF2C) - 1)
 black_range.SetRange(summon_range.finish + 1, player_spell_range.finish)
 for index as Integer = 0 to total_spells 
  spells(index)->name = ""
  if player_spell_range.InRange(index) then
   for i as Integer = 0 to 5
    spells(index)->name += chr(ByteAt(&h78B00 + index * 6 + i))
   next
  else
   for i as Integer = 0 to 7
    spells(index)->name += chr(ByteAt(&h78B00 + player_spell_range.finish * 6 + (index - player_spell_range.finish) * 8 + i))
   next
  end if
  start = &h799A0 + index * 6
  spells(index)->delay = ByteAt(start) mod &h20
  spells(index)->target = ByteAt(start) \ &h20
  spells(index)->power = ByteAt(start + 1)
  spells(index)->boss = iif(ByteAt(start + 2) and &h80, false, true)
  spells(index)->hit = ByteAt(start + 2) mod &h80
  spells(index)->damage = iif(ByteAt(start + 3) and &h80, false, true)
  spells(index)->effect = ByteAt(start + 3) mod &h80
  spells(index)->impact = iif(ByteAt(start + 4) and &h80, true, false)
  spells(index)->attributes = attribute_tables(ByteAt(start + 4) mod &h80)
  spells(index)->reflectable = iif(ByteAt(start + 5) and &h80, false, true)
  spells(index)->mp_cost = ByteAt(start + 5) mod &h80
  start = &h7A250 + index * 4
  spells(index)->colors = ByteAt(start)
  spells(index)->sprites = ByteAt(start + 1)
  spells(index)->visual1 = ByteAt(start + 2)
  spells(index)->visual2 = ByteAt(start + 3)
  spells(index)->sound = ByteAt(&h7A550 + index)
 next 
end sub

sub FF4Rom.WriteSpells()
 dim start as Integer
 dim temp as UByte
 WriteByte(&h14D9C, player_spell_range.finish + 1)
 WriteByte(&hB480, menu_spell_range.start)
 WriteByte(&hB484, menu_spell_range.finish + 1)
 WriteByte(&h1CF24, white_range.finish + 1)
 WriteByte(&h1CF28, summon_range.start)
 WriteByte(&h1CF2C, summon_range.finish + 1)
 for index as Integer = 0 to total_spells 
  if player_spell_range.InRange(index) then
   for i as Integer = 0 to 5
    WriteByte(&h78B00 + index * 6 + i, asc(mid(spells(index)->name, i + 1, 1)))
   next
  else
   for i as Integer = 0 to 7
    WriteByte(&h78B00 + player_spell_range.finish * 6 + (index - player_spell_range.finish) * 8 + i, asc(mid(spells(index)->name, i + 1, 1)))
   next
  end if
  start = &h799A0 + index * 6
  temp = spells(index)->delay + spells(index)->target * &h20
  WriteByte(start, temp)
  WriteByte(start + 1, spells(index)->power)
  temp = spells(index)->hit + iif(spells(index)->boss, 0, &h80)
  WriteByte(start + 2, temp)
  temp = spells(index)->effect + iif(spells(index)->damage, 0, &h80)
  WriteByte(start + 3, temp)
  temp = AttributeTableIndex(spells(index)->attributes) + iif(spells(index)->impact, &h80, 0)
  WriteByte(start + 4, temp)
  temp = spells(index)->mp_cost + iif(spells(index)->reflectable, 0, &h80)
  WriteByte(start + 5, temp)
  start = &h7A250 + index * 4
  WriteByte(start, spells(index)->colors)
  WriteByte(start + 1, spells(index)->sprites)
  WriteByte(start + 2, spells(index)->visual1)
  WriteByte(start + 3, spells(index)->visual2)
  WriteByte(&h7A550 + index, spells(index)->sound)
 next 
end sub

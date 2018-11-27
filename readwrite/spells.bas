sub FF4Rom.ReadSpells()
 dim start as Integer
 dim p as Spell ptr
 player_spell_range.SetRange(0, ByteAt(&h14D9C) - 1)
 menu_spell_range.SetRange(ByteAt(&hB480), ByteAt(&hB484) - 1)
 white_range.SetRange(0, ByteAt(&h1CF24) - 1)
 summon_range.SetRange(ByteAt(&h1CF28), ByteAt(&h1CF2C) - 1)
 black_range.SetRange(summon_range.finish + 1, player_spell_range.finish)
 for index as Integer = 0 to total_spells 
  p = spells[index]
  p->name = ""
  if player_spell_range.InRange(index) then
   for i as Integer = 0 to 5
    p->name += chr(ByteAt(&h78B00 + index * 6 + i))
   next
  else
   for i as Integer = 0 to 7
    p->name += chr(ByteAt(&h78B00 + player_spell_range.finish * 6 + (index - player_spell_range.finish) * 8 + i))
   next
  end if
  start = &h799A0 + index * 6
  p->delay = ByteAt(start) mod &h20
  p->target = ByteAt(start) \ &h20
  p->power = ByteAt(start + 1)
  p->boss = iif(ByteAt(start + 2) and &h80, false, true)
  p->hit = ByteAt(start + 2) mod &h80
  p->damage = iif(ByteAt(start + 3) and &h80, false, true)
  p->effect = ByteAt(start + 3) mod &h80
  p->impact = iif(ByteAt(start + 4) and &h80, true, false)
  p->attributes = attribute_tables[ByteAt(start + 4) mod &h80]
  p->reflectable = iif(ByteAt(start + 5) and &h80, false, true)
  p->mp_cost = ByteAt(start + 5) mod &h80
  start = &h7A250 + index * 4
  p->colors = ByteAt(start)
  p->sprites = ByteAt(start + 1)
  p->visual1 = ByteAt(start + 2)
  p->visual2 = ByteAt(start + 3)
  p->sound = ByteAt(&h7A550 + index)
 next 
end sub

sub FF4Rom.WriteSpells()
 dim start as Integer
 dim temp as UByte
 dim p as Spell ptr
 WriteByte(&h14D9C, player_spell_range.finish + 1)
 WriteByte(&hB480, menu_spell_range.start)
 WriteByte(&hB484, menu_spell_range.finish + 1)
 WriteByte(&h1CF24, white_range.finish + 1)
 WriteByte(&h1CF28, summon_range.start)
 WriteByte(&h1CF2C, summon_range.finish + 1)
 for index as Integer = 0 to total_spells 
  p = spells[index]
  if player_spell_range.InRange(index) then
   for i as Integer = 0 to 5
    WriteByte(&h78B00 + index * 6 + i, asc(mid(p->name, i + 1, 1)))
   next
  else
   for i as Integer = 0 to 7
    WriteByte(&h78B00 + player_spell_range.finish * 6 + (index - player_spell_range.finish) * 8 + i, asc(mid(p->name, i + 1, 1)))
   next
  end if
  start = &h799A0 + index * 6
  temp = p->delay + p->target * &h20
  WriteByte(start, temp)
  WriteByte(start + 1, p->power)
  temp = p->hit + iif(p->boss, 0, &h80)
  WriteByte(start + 2, temp)
  temp = p->effect + iif(p->damage, 0, &h80)
  WriteByte(start + 3, temp)
  temp = attribute_tables.IndexOf(p->attributes) + iif(p->impact, &h80, 0)
  WriteByte(start + 4, temp)
  temp = p->mp_cost + iif(p->reflectable, 0, &h80)
  WriteByte(start + 5, temp)
  start = &h7A250 + index * 4
  WriteByte(start, p->colors)
  WriteByte(start + 1, p->sprites)
  WriteByte(start + 2, p->visual1)
  WriteByte(start + 3, p->visual2)
  WriteByte(&h7A550 + index, p->sound)
 next 
end sub

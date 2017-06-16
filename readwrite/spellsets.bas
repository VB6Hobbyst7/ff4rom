sub FF4Rom.ReadSpellSets()

 dim start as Integer
 dim temp as UByte
 
 start = &h7CAC0
 for i as Integer = 0 to total_spell_sets
  for j as Integer = 0 to 23
   temp = ByteAt(start)
   start += 1
   if temp = &hFF then exit for
   spellsets(i).starting_spells.Append(chr(temp))
  next
 next
 
 start = &h7C900
 for i as Integer = 0 to total_spell_sets
  temp = ByteAt(start)
  start += 1
  do until temp = &hFF
   spellsets(i).learning_spells.Append(chr(temp))
   spellsets(i).learning_levels.Append(chr(ByteAt(start)))
   start += 1
   temp = ByteAt(start)
   start += 1
  loop
 next

end sub


sub FF4Rom.WriteSpellSets()

 dim start as Integer
 dim temp as UByte
 dim total as Integer
 
 for i as Integer = 0 to total_spell_sets
  total += spellsets(i).starting_spells.Length()
  if spellsets(i).starting_spells.Length() < 24 then total += 1
 next
 if total <= &h320 then
  start = &h7CAC0
  for i as Integer = 0 to total_spell_sets
   for j as Integer = 1 to 24
    if j > spellsets(i).starting_spells.Length() then
     WriteByte(start, &hFF)
     start += 1
     exit for
    else
     WriteByte(start, asc(spellsets(i).starting_spells.ItemAt(j)))
     start += 1
    end if
   next
  next
 end if
 
 total = 0
 for i as Integer = 0 to total_spell_sets
  total += spellsets(i).learning_spells.Length() * 2 + 1
 next
 if total <= &h1C0 then
  start = &h7C900
  for i as Integer = 0 to total_spell_sets
   for j as Integer = 1 to spellsets(i).learning_spells.Length()
    WriteByte(start, asc(spellsets(i).learning_spells.ItemAt(j)))
    WriteByte(start + 1, asc(spellsets(i).learning_levels.ItemAt(j)))
    start += 2
   next
   WriteByte(start, &hFF)
   start += 1
  next
 end if

end sub


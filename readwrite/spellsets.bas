sub FF4Rom.ReadSpellSets()
 dim start as Integer
 dim temp as UByte
 dim p as SpellSet ptr
 start = &h7CAC0
 for index as Integer = 0 to total_spell_sets
  p = spell_sets[index]
  for i as Integer = 0 to 23
   temp = ByteAt(start)
   start += 1
   if temp = &hFF then exit for
   p->AddStartingSpell(spells[temp])
  next
 next
 start = &h7C900
 for index as Integer = 0 to total_spell_sets
  p = spell_sets[index]
  temp = ByteAt(start)
  start += 1
  do until temp = &hFF
   p->AddLearnedSpell(spells[ByteAt(start)], temp)
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
 dim p as SpellSet ptr
 for index as Integer = 0 to total_spell_sets
  p = spell_sets[index]
  total += p->TotalStartingSpells()
  if p->TotalStartingSpells() < 24 then total += 1
 next
 if total <= &h320 then
  start = &h7CAC0
  for index as Integer = 0 to total_spell_sets
   for i as Integer = 1 to 24
    if i > p->TotalStartingSpells() then
     WriteByte(start, &hFF)
     start += 1
     exit for
    else
     WriteByte(start, spells.IndexOf(p->StartingSpell(i)))
     start += 1
    end if
   next
  next
 end if
 total = 0
 for index as Integer = 0 to total_spell_sets
  total += p->TotalLearnedSpells() * 2 + 1
 next
 if total <= &h1C0 then
  start = &h7C900
  for index as Integer = 0 to total_spell_sets
   for i as Integer = 1 to p->TotalLearnedSpells()
    WriteByte(start, p->LevelIndex(i))
    WriteByte(start, spells.IndexOf(p->LearnedSpell(i)))
    start += 2
   next
   WriteByte(start, &hFF)
   start += 1
  next
 end if
end sub

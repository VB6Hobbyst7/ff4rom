sub FF4Rom.ReadSpellSets()
 dim start as Integer
 dim temp as UByte
 start = &h7CAC0
 for index as Integer = 0 to total_spell_sets
  for i as Integer = 0 to 23
   temp = ByteAt(start)
   start += 1
   if temp = &hFF then exit for
   spell_sets(index)->AddStartingSpell(spells(temp))
  next
 next
 start = &h7C900
 for index as Integer = 0 to total_spell_sets
  temp = ByteAt(start)
  start += 1
  do until temp = &hFF
   spell_sets(index)->AddLearnedSpell(spells(ByteAt(start)), temp)
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
 for index as Integer = 0 to total_spell_sets
  total += spell_sets(index)->TotalStartingSpells()
  if spell_sets(index)->TotalStartingSpells() < 24 then total += 1
 next
 if total <= &h320 then
  start = &h7CAC0
  for index as Integer = 0 to total_spell_sets
   for i as Integer = 1 to 24
    if i > spell_sets(index)->TotalStartingSpells() then
     WriteByte(start, &hFF)
     start += 1
     exit for
    else
     WriteByte(start, SpellIndex(spell_sets(index)->StartingSpell(i))) 
     start += 1
    end if
   next
  next
 end if
 total = 0
 for index as Integer = 0 to total_spell_sets
  total += spell_sets(index)->TotalLearnedSpells() * 2 + 1
 next
 if total <= &h1C0 then
  start = &h7C900
  for index as Integer = 0 to total_spell_sets
   for i as Integer = 1 to spell_sets(index)->TotalLearnedSpells()
    WriteByte(start, spell_sets(index)->LevelIndex(i))
    WriteByte(start, SpellIndex(spell_sets(index)->LearnedSpell(i)))
    start += 2
   next
   WriteByte(start, &hFF)
   start += 1
  next
 end if
end sub

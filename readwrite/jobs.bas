sub FF4Rom.ReadJobs()
 dim start as Long
 for index as Integer = 0 to total_jobs
  if index > usable_jobs then
   jobs(index)->name = ConvertText("Extra " + str(index - usable_jobs))
  else
   start = &h7A964 + index * 7
   for i as Integer = 0 to 6
    jobs(index)->name += chr(ByteAt(start + i))
   next
   start = &hA81A2 + index * 3
   jobs(index)->menu_white = spell_sets(ByteAt(start))
   jobs(index)->menu_black = spell_sets(ByteAt(start + 1))
   jobs(index)->menu_summon = spell_sets(ByteAt(start + 2))
  end if
  start = &h9FFDD + index * 3
  jobs(index)->white = spell_sets(ByteAt(start))
  jobs(index)->black = spell_sets(ByteAt(start + 1))
  jobs(index)->summon = spell_sets(ByteAt(start + 2))
 next
end sub

sub FF4Rom.WriteJobs()
 dim start as Long
 for index as Integer = 0 to total_jobs
  if index <= usable_jobs then
   start = &h7A964 + index * 7
   for i as Integer = 0 to 6
    WriteByte(start + i, asc(mid(jobs(index)->name, i + 1, 1)))
   next
   start = &hA81A2 + index * 3
   WriteByte(start, SpellSetIndex(jobs(index)->menu_white))
   WriteByte(start + 1, SpellSetIndex(jobs(index)->menu_black))
   WriteByte(start + 2, SpellSetIndex(jobs(index)->menu_summon))
  end if
  start = &h9FFDD + index * 3
  WriteByte(start, SpellSetIndex(jobs(index)->white))
  WriteByte(start + 1, SpellSetIndex(jobs(index)->black))
  WriteByte(start + 2, SpellSetIndex(jobs(index)->summon))
 next
end sub

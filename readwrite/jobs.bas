sub FF4Rom.ReadJobs()
 dim start as Long
 dim p as Job ptr
 for index as Integer = 0 to total_jobs
  p = jobs[index]
  if index > usable_jobs then
   p->name = ConvertText("Extra " + str(index - usable_jobs))
  else
   start = &h7A964 + index * 7
   for i as Integer = 0 to 6
    p->name += chr(ByteAt(start + i))
   next
   start = &hA81A2 + index * 3
   p->menu_white = spell_sets[ByteAt(start)]
   p->menu_black = spell_sets[ByteAt(start + 1)]
   p->menu_summon = spell_sets[ByteAt(start + 2)]
  end if
  start = &h9FFDD + index * 3
  p->white = spell_sets[ByteAt(start)]
  p->black = spell_sets[ByteAt(start + 1)]
  p->summon = spell_sets[ByteAt(start + 2)]
 next
end sub

sub FF4Rom.WriteJobs()
 dim start as Long
 dim p as Job ptr
 for index as Integer = 0 to total_jobs
  p = jobs[index]
  if index <= usable_jobs then
   start = &h7A964 + index * 7
   for i as Integer = 0 to 6
    WriteByte(start + i, asc(mid(p->name, i + 1, 1)))
   next
   start = &hA81A2 + index * 3
   WriteByte(start, spell_sets.IndexOf(p->menu_white))
   WriteByte(start + 1, spell_sets.IndexOf(p->menu_black))
   WriteByte(start + 2, spell_sets.IndexOf(p->menu_summon))
  end if
  start = &h9FFDD + index * 3
  WriteByte(start, spell_sets.IndexOf(p->white))
  WriteByte(start + 1, spell_sets.IndexOf(p->black))
  WriteByte(start + 2, spell_sets.IndexOf(p->summon))
 next
end sub

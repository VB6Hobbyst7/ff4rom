'This gives the specified job the specified spellset and associates it with
' the specified spell school. It does not give any actors any magic commands on
' its own; you will have to do that manually. If a school is not specified or
' does not correspond to one of the usual spell schools (white, black, or
' summon), it will default to assigning it to black.

sub FF4Rom.AssignSpellset(job_index as UByte, spellset_index as UByte, school as String)

 select case lcase(school)
  case "white"
   jobs(job_index).white = spellset_index
   jobs(job_index).menu_white = spellset_index
  case "summon"
   jobs(job_index).summon = spellset_index
   jobs(job_index).menu_summon = spellset_index
  case else
   jobs(job_index).black = spellset_index
   jobs(job_index).menu_black = spellset_index
 end select

end sub

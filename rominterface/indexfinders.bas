function FF4Rom.AttributeTableIndex(p as AttributeTable ptr) as Integer
 dim result as Integer = -1
 for i as Integer = 0 to total_attribute_tables
  if attribute_tables(i) = p then
   result = i
   exit for
  end if
 next
 return result
end function

function FF4Rom.SpellIndex(p as Spell ptr) as Integer
 dim result as Integer = -1
 for i as Integer = 0 to total_spells
  if spells(i) = p then
   result = i
   exit for
  end if
 next
 return result
end function

function FF4Rom.SpellSetIndex(p as SpellSet ptr) as Integer
 dim result as Integer = -1
 for i as Integer = 0 to total_spell_sets
  if spell_sets(i) = p then
   result = i
   exit for
  end if
 next
 return result
end function

function FF4Rom.JobIndex(p as Job ptr) as Integer
 dim result as Integer = -1
 for i as Integer = 0 to total_jobs
  if jobs(i) = p then
   result = i
   exit for
  end if
 next
 return result
end function

function FF4Rom.CharacterIndex(p as Character ptr) as Integer
 dim result as Integer = -1
 for i as Integer = 0 to total_characters
  if characters(i) = p then
   result = i
   exit for
  end if
 next
 return result
end function

function FF4Rom.ActorIndex(p as Actor ptr) as Integer
 dim result as Integer = -1
 for i as Integer = 0 to total_actors
  if actors(i) = p then
   result = i
   exit for
  end if
 next
 return result
end function

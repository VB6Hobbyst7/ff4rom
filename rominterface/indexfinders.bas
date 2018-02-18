function FF4Rom.IndexOfActor(p as Actor ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_actors
  if actors(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfAlertMessage(p as Message ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_alert_messages
  if alert_messages(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfDropTable(p as DropTable ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_drop_tables
  if drop_tables(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfElementStatusTable(p as ElementStatusTable ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_element_status_tables
  if element_status_tables(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfEquipTable(p as EquipTable ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_equip_tables
  if equip_tables(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function

function FF4Rom.IndexOfEvent(p as Event ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_events
  if events(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfFormation(p as Formation ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_formations
  if formations(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfItem(p as Item ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_items
  if items(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfJob(p as Job ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_jobs
  if jobs(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function

function FF4Rom.IndexOfMenuCommand(p as MenuCommand ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_menu_commands
  if menu_commands(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfMonster(p as Monster ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_monsters
  if monsters(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfSpell(p as Spell ptr) as Integer

 dim result as Integer = 0
 
 for i as Integer = 0 to total_spells
  if spells(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function


function FF4Rom.IndexOfSpellSet(p as SpellSet ptr) as Integer

 dim result as Integer = -1
 
 for i as Integer = 0 to total_spell_sets
  if spell_sets(i) = p then
   result = i
   exit for
  end if
 next
 
 return result

end function



'This reads the rom from the file and stores it in a string variable. It then
' goes through and parses it into all the different kinds of game object data.

sub FF4Rom.ReadFromFile(filename as String)

 open filename for binary access read as #1
  if err > 0 then 
   print "FILE ACCESS ERROR"
   getkey
   end
  end if
  if lof(1) > 0 then
   romdata = String(lof(1), 0)
   get #1, , romdata
   if lof(1) = 1048576 then 'it must be unheadered
    romdata = String(&h200, 0) + romdata 'give it a dummy header
    unheadered = true
   elseif lof(1) <> 1049088 then 'it isn't FF4
    print "FILE SIZE ERROR"
    getkey
    end
   end if
  else
   print "FILE EMPTY"
   getkey
   end
  end if
 close

 if_patch = false
 for i as Integer = 1 to 8
  if ByteAt(&h7F70 + i) <> &hFF then
   if_patch = true
   exit for
  end if
 next
 
 ReadActors()
 ReadCharacters()
 ReadDropTables()
 ReadElementStatusTables()
 ReadEquipTables()
 'ReadEventCalls()
 ReadEvents()
 ReadFormations()
 ReadItems()
 ReadJobs()
 'ReadMaps()
 ReadMenuCommands()
 'ReadMessages()
 ReadMonsters()
 'ReadNPCs()
 'ReadPrices()
 'ReadShops()
 ReadSpells()
 ReadSpellSets()

end sub



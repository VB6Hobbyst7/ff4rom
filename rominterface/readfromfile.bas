sub FF4Rom.ReadFromFile(filename as String)
 open filename for binary as #1
  if err > 0 then
   print "FILE ACCESS ERROR"
   getkey
   end
  elseif lof(1) > 0 then
   romdata = String(lof(1), 0)
   get #1, , romdata
   if lof(1) = 1048576 then
    romdata = String(&h200, 0) + romdata
    unheadered = true
   elseif lof(1) <> 1049088 then
    print "FILE SIZE ERROR"
    getkey
    end
   end if
  else
   print "FILE EMPTY"
   getkey
   end
  end if
 close #1
 if_patch = (ByteAt(&h7F71) = &hFF)
 ReadAttributeTables()
 ReadSpells()
 ReadSpellSets()
 ReadJobs()
 ReadEquipTables()
 ReadCharacters()
 ReadBank1Messages()
 ReadBank3Messages()
 ReadBattleMessages()
 ReadAlertMessages()
 ReadDescriptions()
 ReadItems()
 ReadShops()
 ReadStances()
 ReadMenuCommands()
 ReadActors()
 ReadDropTables()
 ReadStatTables()
 ReadSpeedTables()
 ReadConditions()
 ReadConditionSets()
 ReadAIs()
 ReadMonsters()
end sub

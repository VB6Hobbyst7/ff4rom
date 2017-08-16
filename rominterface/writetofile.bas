'This writes all the various game object data back to the rom and then the rom
' data is written to the specified file.
'
' This will save every type of data, including ones that haven't necessarily
'  been changed explicitly. Some of the write routines save the data in a way
'  that has different underlying code, even if it results in no detectable
'  difference in gameplay, so if you use this routine, it is possible that
'  there may be changes to the rom in places you haven't manually changed. If
'  you wish to avoid this, instead call each of the relevant write routines
'  you need manually, then call SaveToFile.

sub FF4Rom.WriteToFile(filename as String)

 WriteActors()
 WriteCharacters()
 WriteElementGrids()
 WriteEquipCharts()
 WriteEventCalls()
 WriteEvents()
 WriteItems()
 WriteJobs()
 WriteMaps()
 WriteMenuCommands()
 WriteMessages()
 'WriteMonsters()
 WriteNPCs()
 WritePrices()
 WriteShops()
 WriteSpells()
 WriteSpellSets()

 SaveToFile(filename)
 
end sub



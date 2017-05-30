#include once "../common/list.bas"
#include once "../common/range.bas"
#include once "gameobjects/elementgrid.bas"
#include once "gameobjects/job.bas"
#include once "gameobjects/equipchart.bas"
#include once "gameobjects/statbonus.bas"
#include once "gameobjects/item.bas"
#include once "gameobjects/menucommand.bas"
#include once "gameobjects/actor.bas"
#include once "gameobjects/character.bas"

type FF4Rom

 public:
 elementgrids(total_element_grids) as ElementGrid
 menu_commands(total_menu_commands) as MenuCommand
 
 jobs(total_jobs) as Job
 equipcharts(total_equip_charts) as EquipChart
 
 characters(total_characters) as Character

 actors(total_actors) as Actor
 names(total_names) as String
 jobchange_actor as Integer
 jobchange_job as UByte
 blackreplace_actor as Integer
 blackreplace_text as String
 
 items(total_items) as Item
 descriptions_range as Range
 weapons_range as Range
 armors_range as Range
 medicines_range as Range
 tools_range as Range
 two_handed_range as Range
 bow_range as Range
 arrow_range as Range
 shield_range as Range
 head_range as Range
 body_range as Range
 arms_range as Range
 key_items_range as Range
 special_key_item1 as UByte
 special_key_item2 as UByte
 
 private:
 romdata as String
 unheadered as Boolean

 public:
 'INFO/
 ' These give information about the rom without actually making changes.
 declare function CanEquip(actor_index as UByte, item_index as UByte) as Boolean
 declare function ConvertText(text as String) as String
 declare function DisplayText(text as String) as String
 declare function FlagIndex(flagname as String) as Integer
 declare function NextUnusedElementGrid() as Integer

 'EDIT/
 ' These could end up changing the data that's in the rom.
 ' Changes only exist in the copy of the rom in memory and will not be
 '  applied to the actual file until you call WriteToFile.
 declare sub Equip(actor_index as UByte, item_index as UByte, arrow_ammo as UByte = 50, force_hand as String = "")
 declare function FindMakeElementGrid(combination as List) as Integer
 declare sub GiveActorCommand(actor_index as UByte, command_index as UByte)
 declare sub Unequip(actor_index as UByte, slot_index as Integer = -1)

 'ROMINTERFACE/
 ' These are for reading and writing between the abstract objects stored
 '  in memory and the rom data as well as between the rom data and the
 '  file on disk.
 declare sub ReadFromFile(filename as String)
 declare sub WriteToFile(filename as String)

 private:
 declare function ByteAt(address as Integer) as UByte
 declare sub WriteByte(address as Integer, newbyte as UByte)
 
 'READWRITE/
 ' These are for converting the raw rom data into abstract objects that
 '  are easier to work with directly, and from those objects back to raw
 '  rom data.
 ' Each of these are called as part of the ReadFromFile routine, so you
 '  don't have to call them all manually.
 declare sub  ReadActors()
 declare sub WriteActors()
 declare sub  ReadCharacters()
 declare sub WriteCharacters()
 declare sub  ReadElementGrids()
 declare sub WriteElementGrids()
 declare sub  ReadEquipCharts()
 declare sub WriteEquipCharts()
 declare sub  ReadItems()
 declare sub WriteItems()
 declare sub  ReadJobs()
 declare sub WriteJobs()
 declare sub  ReadMenuCommands()
 declare sub WriteMenuCommands()

end type

#include once "info/canequip.bas"
#include once "info/converttext.bas"
#include once "info/displaytext.bas"
#include once "info/flagindex.bas"
#include once "info/nextunusedelementgrid.bas"

#include once "edit/equip.bas"
#include once "edit/findmakeelementgrid.bas"
#include once "edit/giveactorcommand.bas"
#include once "edit/unequip.bas"

#include once "rominterface/readfromfile.bas"
#include once "rominterface/writetofile.bas"
#include once "rominterface/byteat.bas"
#include once "rominterface/writebyte.bas"

#include once "readwrite/actors.bas"
#include once "readwrite/characters.bas"
#include once "readwrite/elementgrids.bas"
#include once "readwrite/equipcharts.bas"
#include once "readwrite/items.bas"
#include once "readwrite/jobs.bas"
#include once "readwrite/menucommands.bas"

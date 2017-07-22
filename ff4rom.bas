#include once "../common/list.bas"
#include once "../common/range.bas"
#include once "../common/functions/pad.bas"
#include once "../common/functions/tokenize.bas"
#include once "gameobjects/elementgrid.bas"
#include once "gameobjects/job.bas"
#include once "gameobjects/equipchart.bas"
#include once "gameobjects/statbonus.bas"
#include once "gameobjects/item.bas"
#include once "gameobjects/shop.bas"
#include once "gameobjects/menucommand.bas"
#include once "gameobjects/actor.bas"
#include once "gameobjects/character.bas"
#include once "gameobjects/spell.bas"
#include once "gameobjects/spellset.bas"
#include once "gameobjects/trigger.bas"
#include once "gameobjects/map.bas"
#include once "gameobjects/npc.bas"
#include once "gameobjects/message.bas"

type FF4Rom

 public:
 elementgrids(total_element_grids) as ElementGrid
 menu_commands(total_menu_commands) as MenuCommand
 
 spells(total_spells) as Spell
 spellsets(total_spell_sets) as SpellSet
 player_spells as Range
 menu_spells as Range
 white_spells as Range
 summon_spells as Range
 black_spells as Range 'Includes Ninja and Twin spells
 
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
 shops(total_shops) as Shop
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
 
 bank1_messages(total_bank1_messages) as Message
 bank3_messages(total_bank3_messages) as Message
 
 maps(total_maps) as Map
 npcs(total_npcs) as NPC
 
 private:
 romdata as String
 unheadered as Boolean
 dte_range1 as Range
 dte_range2 as Range
 dte(&hFE) as String

 public:
 'INFO/
 ' These give information about the rom without actually making changes.
 declare function ActorsOfJob(job_index as UByte) as List
 declare function CanEquip(actor_index as UByte, item_index as UByte) as Boolean
 declare function CommandCount(actor_index as UByte) as Integer
 declare function ConvertText(text as String) as String
 declare function DecompressDTE(text as String) as String
 declare function DisplayText(text as String) as String
 declare function FlagIndex(flagname as String) as Integer
 declare function JobChangeFrom() as UByte
 declare function JobOfActor(actor_index as UByte) as UByte
 declare function MessageCodeLength(symbol as UByte) as Integer
 declare function MessageCodeTakesParameter(symbol as UByte) as Boolean
 declare function MessageOutputLength(substring as String) as Integer
 declare function MessagesContaining(substring as String) as List
 declare function NextUnusedElementGrid() as Integer
 declare function UniqueActor(actor_index as UByte) as Boolean

 'EDIT/
 ' These could end up changing the data that's in the rom.
 ' Changes only exist in the copy of the rom in memory and will not be
 '  applied to the actual file until you call WriteToFile.
 declare sub AssignSpellset(job_index as UByte, spellset_index as UByte, school as String)
 declare sub ClearActorCommands(actor_index as UByte = &hFF)
 declare sub ClearJobSpellSets(job_index as UByte = &hFF)
 declare function CompressDTE(text as String) as String
 declare sub Equip(actor_index as UByte, item_index as UByte, arrow_ammo as UByte = 50, force_hand as String = "")
 declare function FindMakeElementGrid(combination as List) as Integer
 declare sub GiveActorCommand(actor_index as UByte, command_index as UByte)
 declare function Replace(find_word as String, replacement as String, text as String) as String
 declare sub ReplaceAll(find_word as String, replacement as String)
 declare sub SortSpellSets()
 declare sub Unequip(actor_index as UByte, slot_index as Integer = -1)
 declare function WrapMessage(text as String) as String

 'ROMINTERFACE/
 ' These are for reading and writing between the abstract objects stored
 '  in memory and the rom data as well as between the rom data and the
 '  file on disk.
 declare sub ReadFromFile(filename as String)
 declare sub WriteToFile(filename as String)

 private:
 declare function ByteAt(address as Integer) as UByte
 declare sub ConstructDTE()
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
 declare sub  ReadMaps() 'Includes triggers
 declare sub WriteMaps()
 declare sub  ReadMenuCommands()
 declare sub WriteMenuCommands()
 declare sub  ReadMessages()
 declare sub WriteMessages()
 declare sub  ReadNPCs()
 declare sub WriteNPCs()
 declare sub  ReadShops()
 declare sub WriteShops()
 declare sub  ReadSpells()
 declare sub WriteSpells()
 declare sub  ReadSpellSets()
 declare sub WriteSpellSets()
 
 declare sub  ReadTrigger(t as Trigger ptr, address as Integer) 'Used by map reader
 declare sub WriteTrigger(t as Trigger ptr, address as Integer)

end type

#include once "info/actorsofjob.bas"
#include once "info/canequip.bas"
#include once "info/commandcount.bas"
#include once "info/converttext.bas"
#include once "info/decompressdte.bas"
#include once "info/displaytext.bas"
#include once "info/flagindex.bas"
#include once "info/jobchangefrom.bas"
#include once "info/jobofactor.bas"
#include once "info/messagecodelength.bas"
#include once "info/messagecodetakesparameter.bas"
#include once "info/messageoutputlength.bas"
#include once "info/messagescontaining.bas"
#include once "info/nextunusedelementgrid.bas"
#include once "info/uniqueactor.bas"

#include once "edit/assignspellset.bas"
#include once "edit/clearactorcommands.bas"
#include once "edit/clearjobspellsets.bas"
#include once "edit/compressdte.bas"
#include once "edit/equip.bas"
#include once "edit/findmakeelementgrid.bas"
#include once "edit/giveactorcommand.bas"
#include once "edit/replace.bas"
#include once "edit/replaceall.bas"
#include once "edit/sortspellsets.bas"
#include once "edit/unequip.bas"
#include once "edit/wrapmessage.bas"

#include once "rominterface/readfromfile.bas"
#include once "rominterface/writetofile.bas"
#include once "rominterface/byteat.bas"
#include once "rominterface/constructdte.bas"
#include once "rominterface/writebyte.bas"

#include once "readwrite/actors.bas"
#include once "readwrite/characters.bas"
#include once "readwrite/elementgrids.bas"
#include once "readwrite/equipcharts.bas"
#include once "readwrite/items.bas"
#include once "readwrite/jobs.bas"
#include once "readwrite/maps.bas"
#include once "readwrite/menucommands.bas"
#include once "readwrite/messages.bas"
#include once "readwrite/npcs.bas"
#include once "readwrite/shops.bas"
#include once "readwrite/spells.bas"
#include once "readwrite/spellsets.bas"

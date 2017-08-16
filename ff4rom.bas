#include once "../common/list.bas"
#include once "../common/range.bas"
#include once "../common/functions/minmax.bas"
#include once "../common/functions/pad.bas"
#include once "../common/functions/tokenize.bas"
#include once "gameobjects/elementgrid.bas"
#include once "gameobjects/job.bas"
#include once "gameobjects/equipchart.bas"
#include once "gameobjects/statbonus.bas"
#include once "gameobjects/item.bas"
#include once "gameobjects/shop.bas"
#include once "gameobjects/menucommand.bas"
#include once "gameobjects/monster.bas"
#include once "gameobjects/actor.bas"
#include once "gameobjects/character.bas"
#include once "gameobjects/spell.bas"
#include once "gameobjects/spellset.bas"
#include once "gameobjects/trigger.bas"
#include once "gameobjects/map.bas"
#include once "gameobjects/eventcall.bas"
#include once "gameobjects/npc.bas"
#include once "gameobjects/message.bas"
#include once "gameobjects/event.bas"

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
 
 monsters(total_monsters) as Monster
 
 bank1_messages(total_bank1_messages) as Message
 bank3_messages(total_bank3_messages) as Message
 battle_messages(total_battle_messages) as Message
 alert_messages(total_alert_messages) as Message
 
 events(total_events) as Event
 eventcalls(total_event_calls) as EventCall
 prices(total_prices) as UByte
 
 maps(total_maps) as Map
 npcs(total_npcs) as NPC
 
 private:
 romdata as String
 unheadered as Boolean
 dte_range1 as Range
 dte_range2 as Range
 dte(&hFE) as String
 if_patch as Boolean
 instruction_names as List
 element_names as List
 persistent_status_names as List
 temporary_status_names as List
 hidden_status_names as List
 system_status_names as List
 
 public:
 'INFO/
 ' These give information about the rom without actually making changes.
 declare function ActorHandedness(actor_index as UByte) as String
 declare function ActorHasCommand(actor_index as UByte, command_index as UByte) as Boolean
 declare function ActorsOfJob(job_index as UByte) as List
 declare function CanEquip(actor_index as UByte, item_index as UByte) as Boolean
 declare function CommandCount(actor_index as UByte) as Integer
 declare function ConvertText(text as String) as String
 declare function DecompressDTE(text as String) as String
 declare function DisplayText(text as String) as String
 declare function EventContainsInstruction(event_index as UByte, code_index as UByte, parameter as Integer = -1) as Boolean
 declare function EventsContaining(code_index as UByte, parameter as Integer = -1) as List
 declare function FlagIndex(flagname as String) as Integer
 declare function InstructionIndex(instruction_name as String) as UByte
 declare function InstructionParameters(code as UByte) as Integer
 declare function ItemsUsableByActor(actor_index as UByte) as List
 declare function ItemsUsableByJob(job_index as UByte) as List
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
 declare sub AddScriptEntry overload (event_index as UByte, new_code as UByte, parameters as List)
 declare sub AddScriptEntry overload (event_index as UByte, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)
 declare sub AddScriptEntry overload (event_index as UByte, new_entry as Instruction)
 declare sub AddScriptEntry overload (event_index as UByte, new_entry as Instruction ptr)
 declare sub AddStock(shop_index as UByte, item_index as UByte)
 declare sub ApplyIPS(ips_file as String, headered as Boolean = true)
 declare sub ApplyPatch(address as Integer, patch as String)
 declare sub AssignSpellset(job_index as UByte, spellset_index as UByte, school as String)
 declare sub ChangeParameter(event_index as UByte, script_line as Integer, parameter_index as UByte, parameter_value as UByte)
 declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameters as List)
 declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)
 declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction)
 declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction ptr)
 declare sub ClearActorCommands(actor_index as UByte = &hFF)
 declare sub ClearEventScript(event_index as UByte)
 declare sub ClearJobSpellSets(job_index as UByte = &hFF)
 declare function CompressDTE(text as String) as String
 declare sub EmptyShop(shop_index as UByte)
 declare sub Equip(actor_index as UByte, item_index as UByte, arrow_ammo as UByte = 50, force_hand as String = "")
 declare function FindMakeElementGrid(combination as List) as Integer
 declare sub GiveActorCommand(actor_index as UByte, command_index as UByte)
 declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameters as List)
 declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)
 declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction)
 declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction ptr)
 declare function Replace(find_word as String, replacement as String, text as String) as String
 declare sub ReplaceAll(find_word as String, replacement as String, include_battle as Boolean = false)
 declare sub SortSpellSets()
 declare sub Unequip(actor_index as UByte, slot_index as Integer = -1)
 declare function WrapMessage(text as String) as String

 'ROMINTERFACE/
 ' These are for reading and writing between the abstract objects stored
 '  in memory and the rom data as well as between the rom data and the
 '  file on disk.
 declare sub ReadFromFile(filename as String)
 declare sub SaveToFile(filename as String)  'Doesn't commit changes
 declare sub WriteToFile(filename as String) 'Commits changes then saves

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
 declare sub  ReadEventCalls()
 declare sub WriteEventCalls()
 declare sub  ReadEvents()
 declare sub WriteEvents()
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
 declare sub  ReadMonsters()
 declare sub WriteMonsters()
 declare sub  ReadNPCs()
 declare sub WriteNPCs()
 declare sub  ReadPrices()
 declare sub WritePrices()
 declare sub  ReadShops()
 declare sub WriteShops()
 declare sub  ReadSpells()
 declare sub WriteSpells()
 declare sub  ReadSpellSets()
 declare sub WriteSpellSets()
 
 private:
 declare function ByteAt(address as Integer) as UByte
 declare sub ConstructDTE()
 declare function ConstructInstruction(address as Integer) as Instruction ptr
 declare sub InitializeInstructionNames()
 declare sub InitializeStatusNames()
 declare sub WriteByte(address as Integer, newbyte as UByte)
 declare sub  ReadTrigger(t as Trigger ptr, address as Integer) 'Used by map reader
 declare sub WriteTrigger(t as Trigger ptr, address as Integer)

end type

#include once "info/actorhandedness.bas"
#include once "info/actorhascommand.bas"
#include once "info/actorsofjob.bas"
#include once "info/canequip.bas"
#include once "info/commandcount.bas"
#include once "info/converttext.bas"
#include once "info/decompressdte.bas"
#include once "info/displaytext.bas"
#include once "info/eventcontainsinstruction.bas"
#include once "info/eventscontaining.bas"
#include once "info/flagindex.bas"
#include once "info/instructionindex.bas"
#include once "info/instructionparameters.bas"
#include once "info/itemsusablebyactor.bas"
#include once "info/itemsusablebyjob.bas"
#include once "info/jobchangefrom.bas"
#include once "info/jobofactor.bas"
#include once "info/messagecodelength.bas"
#include once "info/messagecodetakesparameter.bas"
#include once "info/messageoutputlength.bas"
#include once "info/messagescontaining.bas"
#include once "info/nextunusedelementgrid.bas"
#include once "info/uniqueactor.bas"

#include once "edit/addscriptentry.bas"
#include once "edit/addstock.bas"
#include once "edit/applypatch.bas"
#include once "edit/assignspellset.bas"
#include once "edit/changeparameter.bas"
#include once "edit/changescriptentry.bas"
#include once "edit/clearactorcommands.bas"
#include once "edit/cleareventscript.bas"
#include once "edit/clearjobspellsets.bas"
#include once "edit/compressdte.bas"
#include once "edit/emptyshop.bas"
#include once "edit/equip.bas"
#include once "edit/findmakeelementgrid.bas"
#include once "edit/giveactorcommand.bas"
#include once "edit/insertscriptentry.bas"
#include once "edit/replace.bas"
#include once "edit/replaceall.bas"
#include once "edit/sortspellsets.bas"
#include once "edit/unequip.bas"
#include once "edit/wrapmessage.bas"

#include once "rominterface/byteat.bas"
#include once "rominterface/constructdte.bas"
#include once "rominterface/initializeinstructionnames.bas"
#include once "rominterface/initializestatusnames.bas"
#include once "rominterface/readfromfile.bas"
#include once "rominterface/savetofile.bas"
#include once "rominterface/writetofile.bas"
#include once "rominterface/writebyte.bas"

#include once "readwrite/actors.bas"
#include once "readwrite/characters.bas"
#include once "readwrite/elementgrids.bas"
#include once "readwrite/equipcharts.bas"
#include once "readwrite/eventcalls.bas"
#include once "readwrite/events.bas"
#include once "readwrite/items.bas"
#include once "readwrite/jobs.bas"
#include once "readwrite/maps.bas"
#include once "readwrite/menucommands.bas"
#include once "readwrite/messages.bas"
#include once "readwrite/monsters.bas"
#include once "readwrite/npcs.bas"
#include once "readwrite/prices.bas"
#include once "readwrite/shops.bas"
#include once "readwrite/spells.bas"
#include once "readwrite/spellsets.bas"

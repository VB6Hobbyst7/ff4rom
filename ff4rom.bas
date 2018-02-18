#include once "../common/set.bas"
#include once "../common/range.bas"
#include once "../common/functions/minmax.bas"
#include once "../common/functions/pad.bas"
#include once "../common/functions/tokenize.bas"

#include once "gameobjects/elementstatustable.bas"
#include once "gameobjects/spell.bas"
#include once "gameobjects/spellset.bas"
#include once "gameobjects/job.bas"
#include once "gameobjects/equiptable.bas"
#include once "gameobjects/statbonus.bas"
#include once "gameobjects/item.bas"
#include once "gameobjects/tool.bas"
#include once "gameobjects/consumable.bas"
#include once "gameobjects/armor.bas"
#include once "gameobjects/weapon.bas"
#include once "gameobjects/shop.bas"
#include once "gameobjects/message.bas"
#include once "gameobjects/stance.bas"
#include once "gameobjects/menucommand.bas"
#include once "gameobjects/levelup.bas"
#include once "gameobjects/character.bas"
#include once "gameobjects/actor.bas"
#include once "gameobjects/droptable.bas"
#include once "gameobjects/monster.bas"
#include once "gameobjects/formation.bas"
#include once "gameobjects/instruction.bas"
#include once "gameobjects/event.bas"
#include once "gameobjects/eventcall.bas"
#include once "gameobjects/trigger.bas"
#include once "gameobjects/npc.bas"
#include once "gameobjects/map.bas"


type FF4Rom

 public:

 element_status_tables(total_element_status_tables) as ElementStatusTable ptr
 spells(total_spells) as Spell ptr
 spell_sets(total_spell_sets) as SpellSet ptr
 jobs(total_jobs) as Job ptr
 equip_tables(total_equip_tables) as EquipTable ptr
 items(total_items) as Item ptr
 weapons(total_weapons) as Weapon ptr
 armors(total_armors) as Armor ptr
 consumables(total_consumables) as Consumable ptr
 tools(total_tools) as Tool ptr
 shops(total_shops) as Shop ptr
 bank1_messages(total_bank1_messages) as Message ptr
 bank3_messages(total_bank3_messages) as Message ptr
 battle_messages(total_battle_messages) as Message ptr
 alert_messages(total_alert_messages) as Message ptr
 'stances(total_stances) as Stance ptr
 menu_commands(total_menu_commands) as MenuCommand ptr
 characters(total_characters) as Character ptr
 names(total_names) as String
 actors(total_actors) as Actor ptr
 drop_tables(total_drop_tables) as DropTable ptr
 monsters(total_monsters) as Monster ptr
 formations(total_formations) as Formation ptr
 prices(total_prices) as UByte
 events(total_events) as Event ptr
 'eventcalls(total_event_calls) as EventCall ptr
 
 maps(total_maps) as Map ptr
 'npcs(total_npcs) as NPC ptr
 
 player_spells as Range
 menu_spells as Range
 white_spells as Range
 summon_spells as Range
 black_spells as Range 'Includes Ninja and Twin spells
 descriptions_range as Range
 weapons_range as Range
 armors_range as Range
 consumables_range as Range
 tools_range as Range
 two_handed_range as Range
 bow_range as Range
 arrow_range as Range
 shield_range as Range
 head_range as Range
 body_range as Range
 arms_range as Range
 key_items_range as Range

 special_key_item1 as Item ptr
 special_key_item2 as Item ptr
 jobchange_actor as Actor ptr
 jobchange_job as Job ptr
 blackreplace_actor as Actor ptr
 blackreplace_text as String
 'autobattles as List
 'solobattles as List

 private:
 romdata as String
 unheadered as Boolean
 dte_range1 as Range
 dte_range2 as Range
 dte(&hFE) as String
 if_patch as Boolean
 'instruction_names as List
 'element_names as List
 'persistent_status_names as List
 'temporary_status_names as List
 'hidden_status_names as List
 'system_status_names as List
 
 public:
 
 declare constructor(filename as String)
 
 'INFO/
 ' These give information about the rom without actually making changes.
 'declare function ActorHandedness(actor_index as UByte) as String
 'declare function ActorHasCommand(actor_index as UByte, command_index as UByte) as Boolean
 'declare function ActorsOfJob(job_index as UByte) as List
 'declare function CanEquip(actor_index as UByte, item_index as UByte) as Boolean
 'declare function CommandCount(actor_index as UByte) as Integer
 declare function ConvertText(text as String) as String
 declare function DecompressDTE(text as String) as String
 declare function DisplayText(text as String) as String
 'declare function EventContainsInstruction(event_index as UByte, code_index as UByte, parameter as Integer = -1) as Boolean
 'declare function EventsContaining(code_index as UByte, parameter as Integer = -1) as List
 'declare function FlagIndex(flagname as String) as Integer
 'declare function InstructionIndex(instruction_name as String) as UByte
 declare function InstructionParameters(code as UByte) as Integer
 'declare function ItemsUsableByActor(actor_index as UByte) as List
 'declare function ItemsUsableByJob(job_index as UByte) as List
 'declare function JobChangeFrom() as UByte
 'declare function JobOfActor(actor_index as UByte) as UByte
 'declare function MessageCodeLength(symbol as UByte) as Integer
 'declare function MessageOutputLength(substring as String) as Integer
 'declare function MessagesContaining(substring as String) as List
 'declare function NextUnusedElementStatusTable() as Integer
 'declare function UniqueActor(actor_index as UByte) as Boolean

 'EDIT/
 ' These could end up changing the data that's in the rom.
 ' Changes only exist in the copy of the rom in memory and will not be
 '  applied to the actual file until you call WriteToFile.
 declare function CompressDTE(text as String) as String
 'declare function FindOrCreateElementStatusTable(combination as List) as Integer
 'declare function Replace(find_word as String, replacement as String, text as String) as String
 'declare function WrapMessage(text as String) as String
 'declare sub AddScriptEntry overload (event_index as UByte, new_code as UByte, parameters as List)
 'declare sub AddScriptEntry overload (event_index as UByte, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)
 'declare sub AddScriptEntry overload (event_index as UByte, new_entry as Instruction)
 'declare sub AddScriptEntry overload (event_index as UByte, new_entry as Instruction ptr)
 'declare sub AddStock(shop_index as UByte, item_index as UByte)
 'declare sub ApplyPatch(address as Integer, patch as String)
 'declare sub AssignSpellset(job_index as UByte, spellset_index as UByte, school as String)
 'declare sub ChangeParameter(event_index as UByte, script_line as Integer, parameter_index as UByte, parameter_value as UByte)
 'declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameters as List)
 'declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)
 'declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction)
 'declare sub ChangeScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction ptr)
 'declare sub ClearActorCommands(actor_index as UByte = &hFF)
 'declare sub ClearEventScript(event_index as UByte)
 'declare sub ClearJobSpellSets(job_index as UByte = &hFF)
 'declare sub EmptyShop(shop_index as UByte)
 'declare sub Equip(actor_index as UByte, item_index as UByte, arrow_ammo as UByte = 50, force_hand as String = "")
 'declare sub GiveActorCommand(actor_index as UByte, command_index as UByte)
 'declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameters as List)
 'declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_code as UByte, parameter1 as UByte = 0, parameter2 as UByte = 0, parameter3 as UByte = 0, parameter4 as UByte = 0)
 'declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction)
 'declare sub InsertScriptEntry overload (event_index as UByte, script_line as Integer, new_entry as Instruction ptr)
 'declare sub ReplaceAll(find_word as String, replacement as String, include_battle as Boolean = false)
 'declare sub SortSpellSets()
 'declare sub Unequip(actor_index as UByte, slot_index as Integer = -1)

 'INSTRUCTION CREATORS
 'These create instruction pointers for new instructions to add to events.
 'The MovementInstruction creator can be called with a placement and a movement
 ' separately, or they can be added together into one byte. The one-parameter
 ' version is also useful for the "you move" type instructions.
 declare function InstructionFromBytes(bytes as List) as Instruction ptr
 declare function MovementInstruction overload (placement_index as UByte, move_direction as UByte) as Instruction ptr
 declare function MovementInstruction overload (code as UByte) as Instruction ptr
 declare function ScreenInstruction(code as UByte) as Instruction ptr
 declare function ToggleStatusInstruction overload (status as Integer) as Instruction ptr
 declare function ToggleStatusInstruction overload (status_name as String) as Instruction ptr
 declare function ToggleStatusInstruction overload (statuses as List) as Instruction ptr
 declare function PayInstruction(price_index as Integer) as Instruction ptr
 declare function SetLeaderInstruction(leader as Actor ptr) as Instruction ptr
 declare function RestoreHPInstruction(amount as UByte) as Instruction ptr
 declare function RestoreAllHPInstruction() as Instruction ptr
 declare function RestoreMPInstruction(amount as UByte) as Instruction ptr
 declare function RestoreAllMPInstruction() as Instruction ptr
 declare function GainItemInstruction(item_link as Item ptr) as Instruction ptr
 declare function LoseItemInstruction(item_link as Item ptr) as Instruction ptr
 declare function LearnInstruction(spell_link as Spell ptr, spell_set_link as SpellSet ptr) as Instruction ptr
 declare function LoseStatusInstruction overload (status as Integer) as Instruction ptr
 declare function LoseStatusInstruction overload (status_name as String) as Instruction ptr
 declare function LoseStatusInstruction overload (statuses as List) as Instruction ptr
 declare function LoseAllStatusesInstruction() as Instruction ptr
 declare function GainStatusInstruction overload (status as Integer) as Instruction ptr
 declare function GainStatusInstruction overload (status_name as String) as Instruction ptr
 declare function GainStatusInstruction overload (statuses as List) as Instruction ptr
 declare function GainGilInstruction(amount as UByte) as Instruction ptr
 declare function LoseGilInstruction(amount as UByte) as Instruction ptr
 declare function GainActorInstruction(actor_link as Actor ptr) as Instruction ptr
 declare function LoseActorInstruction(actor_link as Actor ptr) as Instruction ptr
 declare function PauseInstruction(duration as UByte) as Instruction ptr
 declare function FadeSongInstruction(song_index as UByte) as Instruction ptr
 declare function RepeatInstruction(instructions as UByte, times as UByte) as Instruction ptr
 declare function BattleInstruction(formation_link as Formation ptr) as Instruction ptr
 declare function ShopInstruction(shop_link as Shop ptr) as Instruction ptr
 declare function Bank2Instruction(message_index as UByte, from_map as Boolean = true) as Instruction ptr
 declare function Bank1Instruction(message_link as Message ptr) as Instruction ptr
 declare function SetFlagInstruction(flag_index as UByte) as Instruction ptr
 declare function ClearFlagInstruction(flag_index as UByte) as Instruction ptr
 declare function ActivateInstruction(npc_link as NPC ptr) as Instruction ptr
 declare function DeactivateInstruction(npc_link as NPC ptr) as Instruction ptr
 declare function Bank3Instruction(message_link as Message ptr) as Instruction ptr
 declare function PickItemInstruction(item_link as Item ptr) as Instruction ptr
 declare function YesNoInstruction(message_link as Message ptr) as Instruction ptr
 declare function TintInstruction(value as UByte) as Instruction ptr
 declare function PlaySongInstruction(song_index as UByte) as Instruction ptr
 declare function SFXInstruction(effect as UByte) as Instruction ptr
 declare function VFXInstruction(effect as UByte) as Instruction ptr
 declare function TeleportInstruction(map_link as Map ptr, x as UByte, y as UByte, vehicle as UByte = 0) as Instruction ptr
 declare function EndInstruction() as Instruction ptr

 'ROMINTERFACE/
 ' These are for reading and writing between the abstract objects stored
 '  in memory and the rom data as well as between the rom data and the
 '  file on disk.
 declare sub SaveToFile(filename as String)  'Doesn't commit changes
 declare sub WriteToFile(filename as String) 'Commits changes then saves

 'private:

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
 declare sub  ReadDropTables()
 declare sub WriteDropTables()
 declare sub  ReadElementStatusTables()
 declare sub WriteElementStatusTables()
 declare sub  ReadEquipTables()
 declare sub WriteEquipTables()
 'declare sub  ReadEventCalls()
 'declare sub WriteEventCalls()
 declare sub  ReadEvents()
 declare sub WriteEvents()
 declare sub  ReadFormations()
 declare sub WriteFormations()
 declare sub  ReadItems()
 declare sub WriteItems()
 declare sub  ReadJobs()
 declare sub WriteJobs()
 'declare sub  ReadMaps() 'Includes triggers
 'declare sub WriteMaps()
 declare sub  ReadMenuCommands()
 declare sub WriteMenuCommands()
 declare sub  ReadMessages()
 declare sub WriteMessages()
 declare sub  ReadMonsters()
 declare sub WriteMonsters()
 'declare sub  ReadNPCs()
 'declare sub WriteNPCs()
 'declare sub  ReadPrices()
 'declare sub WritePrices()
 declare sub  ReadShops()
 declare sub WriteShops()
 declare sub  ReadSpells()
 declare sub WriteSpells()
 declare sub  ReadSpellSets()
 declare sub WriteSpellSets()
 'declare sub  ReadStances()
 'declare sub WriteStances()
 'declare sub  ReadTrigger(t as Trigger ptr, address as Integer) 'Used by map reader
 'declare sub WriteTrigger(t as Trigger ptr, address as Integer)

 declare function IndexOfActor(p as Actor ptr) as Integer
 declare function IndexOfAlertMessage(p as Message ptr) as Integer
 declare function IndexOfDropTable(p as DropTable ptr) as Integer
 declare function IndexOfElementStatusTable(p as ElementStatusTable ptr) as Integer
 declare function IndexOfEquipTable(p as EquipTable ptr) as Integer
 declare function IndexOfEvent(p as Event ptr) as Integer
 declare function IndexOfFormation(p as Formation ptr) as Integer
 declare function IndexOfItem(p as Item ptr) as Integer
 declare function IndexOfJob(p as Job ptr) as Integer
 declare function IndexOfMenuCommand(p as MenuCommand ptr) as Integer
 declare function IndexOfMonster(p as Monster ptr) as Integer
 declare function IndexOfSpell(p as Spell ptr) as Integer
 declare function IndexOfSpellSet(p as SpellSet ptr) as Integer
 
 declare function ByteAt(address as Integer) as UByte
 'declare function ConstructInstruction(address as Integer) as Instruction ptr
 declare sub ConstructDTE()
 'declare sub InitializeInstructionNames()
 'declare sub InitializeStatusNames()
 declare sub ReadFromFile(filename as String)
 declare sub WriteByte(address as Integer, newbyte as UByte)

 declare static function MessageCodeTakesParameter(symbol as UByte) as Boolean

end type

constructor FF4Rom(filename as String)

 for i as Integer = 0 to total_element_status_tables
  element_status_tables(i) = new ElementStatusTable
 next
 
 for i as Integer = 0 to total_spells
  spells(i) = new Spell
 next
 
 for i as Integer = 0 to total_spell_sets
  spell_sets(i) = new SpellSet
 next
 
 for i as Integer = 0 to total_jobs
  jobs(i) = new Job
 next
 
 for i as Integer = 0 to total_equip_tables
  equip_tables(i) = new EquipTable
 next
 
 for i as Integer = 0 to total_characters
  characters(i) = new Character
 next
 
 for i as Integer = 0 to total_weapons
  weapons(i) = new Weapon
 next
 
 for i as Integer = 0 to total_armors
  armors(i) = new Armor
 next
 
 for i as Integer = 0 to total_consumables
  consumables(i) = new Consumable
 next
 
 for i as Integer = 0 to total_tools
  tools(i) = new Tool
 next
 
 for i as Integer = 0 to total_shops
  shops(i) = new Shop
 next
 
 for i as Integer = 0 to total_bank1_messages
  bank1_messages(i) = new Message
 next
 
 for i as Integer = 0 to total_bank3_messages
  bank3_messages(i) = new Message
 next
 
 for i as Integer = 0 to total_battle_messages
  battle_messages(i) = new Message
 next
 
 for i as Integer = 0 to total_alert_messages
  alert_messages(i) = new Message
 next
 
 for i as Integer = 0 to total_menu_commands
  menu_commands(i) = new MenuCommand
 next
 
 for i as Integer = 0 to total_actors
  actors(i) = new Actor
 next
 
 for i as Integer = 0 to total_drop_tables
  drop_tables(i) = new DropTable
 next
 
 for i as Integer = 0 to total_monsters
  monsters(i) = new Monster
 next
 
 for i as Integer = 0 to total_formations
  formations(i) = new Formation
 next
 
 for i as Integer = 0 to total_events
  events(i) = new Event
 next
 
 for i as Integer = 0 to total_maps
  maps(i) = new Map
 next
 
 ReadFromFile(filename)

end constructor


'#include once "info/actorhandedness.bas"
'#include once "info/actorhascommand.bas"
'#include once "info/actorsofjob.bas"
'#include once "info/canequip.bas"
'#include once "info/commandcount.bas"
#include once "info/converttext.bas"
#include once "info/decompressdte.bas"
#include once "info/displaytext.bas"
'#include once "info/eventcontainsinstruction.bas"
'#include once "info/eventscontaining.bas"
'#include once "info/flagindex.bas"
'#include once "info/instructionindex.bas"
#include once "info/instructionparameters.bas"
'#include once "info/itemsusablebyactor.bas"
'#include once "info/itemsusablebyjob.bas"
'#include once "info/jobchangefrom.bas"
'#include once "info/jobofactor.bas"
'#include once "info/messagecodelength.bas"
#include once "info/messagecodetakesparameter.bas"
'#include once "info/messageoutputlength.bas"
'#include once "info/messagescontaining.bas"
'#include once "info/nextunusedelementstatustable.bas"
'#include once "info/uniqueactor.bas"

'#include once "edit/addscriptentry.bas"
'#include once "edit/addstock.bas"
'#include once "edit/applypatch.bas"
'#include once "edit/assignspellset.bas"
'#include once "edit/changeparameter.bas"
'#include once "edit/changescriptentry.bas"
'#include once "edit/clearactorcommands.bas"
'#include once "edit/cleareventscript.bas"
'#include once "edit/clearjobspellsets.bas"
#include once "edit/compressdte.bas"
'#include once "edit/emptyshop.bas"
'#include once "edit/equip.bas"
'#include once "edit/findmakeelementgrid.bas"
'#include once "edit/giveactorcommand.bas"
'#include once "edit/insertscriptentry.bas"
'#include once "edit/replace.bas"
'#include once "edit/replaceall.bas"
'#include once "edit/sortspellsets.bas"
'#include once "edit/unequip.bas"
'#include once "edit/wrapmessage.bas"
#include once "edit/instructioncreators.bas"

#include once "rominterface/byteat.bas"
#include once "rominterface/writebyte.bas"
#include once "rominterface/readfromfile.bas"
#include once "rominterface/writetofile.bas"
#include once "rominterface/constructdte.bas"
'#include once "rominterface/initializeinstructionnames.bas"
'#include once "rominterface/initializestatusnames.bas"
#include once "rominterface/savetofile.bas"
#include once "rominterface/indexfinders.bas"

#include once "readwrite/actors.bas"
#include once "readwrite/characters.bas"
#include once "readwrite/droptables.bas"
#include once "readwrite/elementstatustables.bas"
#include once "readwrite/equiptables.bas"
'#include once "readwrite/eventcalls.bas"
#include once "readwrite/events.bas"
#include once "readwrite/formations.bas"
#include once "readwrite/items.bas"
#include once "readwrite/jobs.bas"
'#include once "readwrite/maps.bas"
#include once "readwrite/menucommands.bas"
#include once "readwrite/messages.bas"
#include once "readwrite/monsters.bas"
'#include once "readwrite/npcs.bas"
'#include once "readwrite/prices.bas"
#include once "readwrite/shops.bas"
#include once "readwrite/spells.bas"
#include once "readwrite/spellsets.bas"

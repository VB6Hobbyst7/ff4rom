#include once "../common/list.bas"
#include once "../common/range.bas"
#include once "../common/set.bas"
#include once "../common/functions/pad.bas"
#include once "gameobjects/attributetable.bas"
#include once "objectlists/attributetablelist.bas"
#include once "gameobjects/spell.bas"
#include once "objectlists/spelllist.bas"
#include once "gameobjects/spellset.bas"
#include once "objectlists/spellsetlist.bas"
#include once "gameobjects/job.bas"
#include once "objectlists/joblist.bas"
#include once "gameobjects/equiptable.bas"
#include once "objectlists/equiptablelist.bas"
#include once "gameobjects/statbonus.bas"
#include once "gameobjects/levelup.bas"
#include once "gameobjects/character.bas"
#include once "objectlists/characterlist.bas"
#include once "gameobjects/message.bas"
#include once "objectlists/messagelist.bas"
#include once "gameobjects/item.bas"
#include once "objectlists/itemlist.bas"
#include once "objectlists/weaponlist.bas"
#include once "objectlists/armorlist.bas"
#include once "objectlists/supplylist.bas"
#include once "objectlists/toollist.bas"
#include once "gameobjects/shop.bas"
#include once "objectlists/shoplist.bas"
#include once "gameobjects/actor.bas"
#include once "objectlists/actorlist.bas"
#include once "gameobjects/stance.bas"
#include once "objectlists/stancelist.bas"
#include once "gameobjects/menucommand.bas"
#include once "objectlists/menucommandlist.bas"
#include once "gameobjects/droptable.bas"
#include once "objectlists/droptablelist.bas"
#include once "gameobjects/stattable.bas"
#include once "objectlists/stattablelist.bas"
#include once "gameobjects/speedtable.bas"
#include once "objectlists/speedtablelist.bas"
#include once "gameobjects/condition.bas"
#include once "objectlists/conditionlist.bas"
#include once "gameobjects/conditionset.bas"
#include once "objectlists/conditionsetlist.bas"
#include once "gameobjects/scriptentry.bas"
#include once "objectlists/scriptentrylist.bas"
#include once "gameobjects/script.bas"
#include once "objectlists/scriptlist.bas"
#include once "gameobjects/ai.bas"
#include once "objectlists/ailist.bas"
#include once "gameobjects/monster.bas"
#include once "objectlists/monsterlist.bas"
#include once "gameobjects/autoscriptentry.bas"
#include once "objectlists/autoscriptlist.bas"
#include once "gameobjects/formation.bas"
#include once "objectlists/formationlist.bas"
#include once "gameobjects/encounter.bas"
#include once "objectlists/encounterlist.bas"
#include once "gameobjects/instruction.bas"
#include once "objectlists/instructionlist.bas"
#include once "gameobjects/event.bas"
#include once "objectlists/eventlist.bas"
#include once "gameobjects/callcomponent.bas"
#include once "objectlists/callcomponentlist.bas"
#include once "gameobjects/eventcall.bas"
#include once "objectlists/eventcalllist.bas"
#include once "gameobjects/trigger.bas"
#include once "objectlists/triggerlist.bas"
#include once "gameobjects/tile.bas"
#include once "objectlists/tilelist.bas"
#include once "gameobjects/tileset.bas"
#include once "objectlists/tilesetlist.bas"
#include once "gameobjects/layout.bas"
#include once "objectlists/layoutlist.bas"
#include once "gameobjects/npc.bas"
#include once "objectlists/npclist.bas"
#include once "gameobjects/placement.bas"
#include once "objectlists/placementlist.bas"
#include once "gameobjects/placementset.bas"
#include once "objectlists/placementsetlist.bas"
#include once "gameobjects/map.bas"
#include once "objectlists/maplist.bas"

type FF4Rom extends Object
 public:
  '---- Arrays of game object pointers
  attribute_tables as AttributeTableList = AttributeTableList(total_attribute_tables)
  spells as SpellList = SpellList(total_spells)
  spell_sets as SpellSetList = SpellSetList(total_spell_sets)
  jobs as JobList = JobList(total_jobs)
  equip_tables as EquipTableList = EquipTableList(total_equip_tables)
  characters as CharacterList = CharacterList(total_characters)
  bank1_messages as MessageList = MessageList(total_bank1_messages)
  bank3_messages as MessageList = MessageList(total_bank3_messages)
  battle_messages as MessageList = MessageList(total_battle_messages)
  alert_messages as MessageList = MessageList(total_alert_messages)
  descriptions as MessageList = MessageList(total_descriptions)
  tools as ToolList
  supplies as SupplyList
  armors as ArmorList
  weapons as WeaponList
  items as ItemList
  shops as ShopList = ShopList(total_shops)
  actors as ActorList = ActorList(total_actors)
  stances as StanceList = StanceList(total_stances)
  menu_commands as MenuCommandList = MenuCommandList(total_menu_commands)
  drop_tables as DropTableList = DropTableList(total_drop_tables)
  stat_tables as StatTableList = StatTableList(total_stat_tables)
  speed_tables as SpeedTableList = SpeedTableList(total_speed_tables)
  conditions as ConditionList = ConditionList(total_conditions)
  condition_sets as ConditionSetList = ConditionSetList(total_condition_sets)
  scripts as ScriptList = ScriptList(total_scripts)
  lunar_scripts as ScriptList = ScriptList(total_lunar_scripts)
  ais as AIList = AIList(total_ais)
  monsters as MonsterList = MonsterList(total_monsters)
  formations as FormationList = FormationList(total_formations)
  encounters as EncounterList = EncounterList(total_encounters)
  events as EventList = EventList(total_events)
  event_calls as EventCallList = EventCallList(total_event_calls)
  tile_sets as TileSetList = TileSetList(total_tile_sets)
  layouts as LayoutList = LayoutList(total_layouts)
  npcs as NPCList = NPCList(total_npcs)
  placement_sets as PlacementSetList = PlacementSetList(total_placement_sets)
  maps as MapList = MapList(total_maps)
  '---- Lists and ranges
  condition_hps(total_condition_hps) as Integer
  player_spell_range as Range
  menu_spell_range as Range
  white_range as Range
  summon_range as Range
  black_range as Range
  names as List
  prices as List
  descriptions_range as Range
  weapons_range as Range
  armors_range as Range
  supplies_range as Range
  tools_range as Range
  bow_range as Range
  arrow_range as Range
  two_handed_range as Range
  head_range as Range
  body_range as Range
  arms_range as Range
  hand_range as Range
  key_item_range as Range
  key_item1 as Item ptr
  key_item2 as Item ptr
  black_replace_actor as Actor ptr
  black_replace_text as String
  job_change_actor as Actor ptr
  job_change_job as Job ptr
  declare constructor()
  declare constructor(filename as String)
  declare function ConvertText(asciitext as String) as String
  declare function DisplayText(ff4text as String) as String
  declare sub DisplayBytes(start as Long, finish as Long)
 private:
  '---- Direct interface with ROM
  romdata as String
  unheadered as Boolean
  if_patch as Boolean
  declare function ByteAt(address as Long) as UByte
  declare sub WriteByte(address as Long, newbyte as UByte)
  declare sub ReadFromFile(filename as String)
  declare sub WriteToFile()
  declare function CompressDTE(text as String) as String
  declare function DecompressDTE(text as String) as String
  declare function MessageParameter(symbol as UByte) as Boolean
  declare function ScriptParameter(action as UByte) as Boolean
  '---- Read and write various game object lists
  declare sub  ReadAttributeTables()
  declare sub WriteAttributeTables()
  declare sub  ReadSpells()
  declare sub WriteSpells()
  declare sub  ReadSpellSets()
  declare sub WriteSpellSets()
  declare sub  ReadJobs()
  declare sub WriteJobs()
  declare sub  ReadEquipTables()
  declare sub WriteEquipTables()
  declare sub  ReadCharacters()
  declare sub WriteCharacters()
  declare sub  ReadBank1Messages()
  declare sub WriteBank1Messages()
  declare sub  ReadBank2Messages()
  declare sub WriteBank2Messages()
  declare sub  ReadBank3Messages()
  declare sub WriteBank3Messages()
  declare sub  ReadBattleMessages()
  declare sub WriteBattleMessages()
  declare sub  ReadAlertMessages()
  declare sub WriteAlertMessages()
  declare sub  ReadDescriptions()
  declare sub WriteDescriptions()
  declare sub  ReadItems()
  declare sub WriteItems()
  declare sub  ReadShops()
  declare sub WriteShops()
  declare sub  ReadActors()
  declare sub WriteActors()
  declare sub  ReadStances()
  declare sub WriteStances()
  declare sub  ReadMenuCommands()
  declare sub WriteMenuCommands()
  declare sub  ReadDropTables()
  declare sub WriteDropTables()
  declare sub  ReadStatTables()
  declare sub WriteStatTables()
  declare sub  ReadSpeedTables()
  declare sub WriteSpeedTables()
  declare sub  ReadConditions()
  declare sub WriteConditions()
  declare sub  ReadConditionSets()
  declare sub WriteConditionSets()
  declare sub  ReadAIs()
  declare sub WriteAIs()
  declare sub  ReadMonsters()
  declare sub WriteMonsters()
  declare sub  ReadFormations()
  declare sub WriteFormations()
  declare sub  ReadEncounters()
  declare sub WriteEncounters()
  declare sub  ReadEvents()
  declare sub WriteEvents()
  declare sub  ReadEventCalls()
  declare sub WriteEventCalls()
  declare sub  ReadTriggers()
  declare sub WriteTriggers()
  declare sub  ReadTileSets()
  declare sub WriteTileSets()
  declare sub  ReadLayouts()
  declare sub WriteLayouts()
  declare sub  ReadNPCs()
  declare sub WriteNPCs()
  declare sub  ReadPlacementSets()
  declare sub WritePlacementSets()
  declare sub  ReadMaps()
  declare sub WriteMaps()
end type

constructor FF4Rom()
end constructor

constructor FF4Rom(filename as String)
 ReadFromFile(filename)
end constructor

#include once "misc/converttext.bas"
#include once "misc/decompressdte.bas"
#include once "misc/displaytext.bas"
#include once "misc/messageparameter.bas"
#include once "misc/scriptparameter.bas"
#include once "rominterface/byteat.bas"
#include once "rominterface/writebyte.bas"
#include once "rominterface/readfromfile.bas"
#include once "rominterface/writetofile.bas"
#include once "rominterface/displaybytes.bas"
#include once "readwrite/attributetables.bas"
#include once "readwrite/spells.bas"
#include once "readwrite/spellsets.bas"
#include once "readwrite/jobs.bas"
#include once "readwrite/equiptables.bas"
#include once "readwrite/characters.bas"
#include once "readwrite/bank1messages.bas"
'#include once "readwrite/bank2messages.bas"
#include once "readwrite/bank3messages.bas"
#include once "readwrite/battlemessages.bas"
#include once "readwrite/alertmessages.bas"
#include once "readwrite/descriptions.bas"
#include once "readwrite/items.bas"
#include once "readwrite/shops.bas"
#include once "readwrite/actors.bas"
#include once "readwrite/stances.bas"
#include once "readwrite/menucommands.bas"
#include once "readwrite/droptables.bas"
#include once "readwrite/stattables.bas"
#include once "readwrite/speedtables.bas"
#include once "readwrite/conditions.bas"
#include once "readwrite/conditionsets.bas"
#include once "readwrite/ais.bas"
#include once "readwrite/monsters.bas"
#include once "readwrite/formations.bas"
#include once "readwrite/encounters.bas"
#include once "readwrite/events.bas"
#include once "readwrite/eventcalls.bas"
#include once "readwrite/triggers.bas"
#include once "readwrite/tilesets.bas"
#include once "readwrite/layouts.bas"
#include once "readwrite/npcs.bas"
#include once "readwrite/placementsets.bas"
#include once "readwrite/maps.bas"

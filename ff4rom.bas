#include once "../common/list.bas"
#include once "../common/range.bas"
#include once "../common/set.bas"
#include once "../common/functions/pad.bas"
#include once "gameobjects/attributetable.bas"
#include once "gameobjects/spell.bas"
#include once "gameobjects/spellset.bas"
#include once "gameobjects/job.bas"
#include once "gameobjects/equiptable.bas"
#include once "gameobjects/statbonus.bas"
#include once "gameobjects/levelup.bas"
#include once "gameobjects/character.bas"
#include once "gameobjects/message.bas"
#include once "gameobjects/item.bas"
#include once "gameobjects/shop.bas"
#include once "gameobjects/stance.bas"
#include once "gameobjects/menucommand.bas"
#include once "gameobjects/actor.bas"
#include once "gameobjects/droptable.bas"
#include once "gameobjects/stattable.bas"
#include once "gameobjects/condition.bas"
#include once "gameobjects/conditionset.bas"
#include once "gameobjects/ai.bas"
#include once "gameobjects/monster.bas"
#include once "gameobjects/arrangement.bas"
#include once "gameobjects/formation.bas"
#include once "gameobjects/encounter.bas"
#include once "gameobjects/instruction.bas"
#include once "gameobjects/event.bas"
#include once "gameobjects/eventcall.bas"
#include once "gameobjects/trigger.bas"
#include once "gameobjects/tile.bas"
#include once "gameobjects/tileset.bas"
#include once "gameobjects/tilegrid.bas"
#include once "gameobjects/npc.bas"
#include once "gameobjects/placement.bas"
#include once "gameobjects/placementset.bas"
#include once "gameobjects/map.bas"

type FF4Rom extends Object
 public:
  'Arrays of game object pointers
  attribute_tables(total_attribute_tables) as AttributeTable ptr
  spells(total_spells) as Spell ptr
  spell_sets(total_spell_sets) as SpellSet ptr
  jobs(total_jobs) as Job ptr
  equip_tables(total_equip_tables) as EquipTable ptr
  characters(total_characters) as Character ptr
  bank1_messages(total_bank1_messages) as Message ptr
  bank3_messages(total_bank3_messages) as Message ptr
  battle_messages(total_battle_messages) as Message ptr
  alert_messages(total_alert_messages) as Message ptr
  descriptions(total_descriptions) as Message ptr
  tools(total_tools) as Tool ptr
  supplies(total_supplies) as Supply ptr
  armors(total_armors) as Armor ptr
  weapons(total_weapons) as Weapon ptr
  items(total_items) as Item ptr
  shops(total_shops) as Shop ptr
  stances(total_stances) as Stance ptr
  menu_commands(total_menu_commands) as MenuCommand ptr
  actors(total_actors) as Actor ptr
  drop_tables(total_drop_tables) as DropTable ptr
  stat_tables(total_stat_tables) as StatTable ptr
  conditions(total_conditions) as Condition ptr
  condition_sets(total_condition_sets) as ConditionSet ptr
  ais(total_ais) as AI ptr
  monsters(total_monsters) as Monster ptr
  arrangements(total_arrangements) as Arrangement ptr
  formations(total_formations) as Formation ptr
  encounters(total_encounters) as Encounter ptr
  events(total_events) as Event ptr
  event_calls(total_event_calls) as EventCall ptr
  triggers(total_triggers) as Trigger ptr
  tiles(total_tiles) as Tile ptr
  tile_sets(total_tile_sets) as TileSet ptr
  tile_grids(total_tile_grids) as TileGrid ptr
  npcs(total_npcs) as NPC ptr
  maps(total_maps) as Map ptr
  'Lists and ranges
  names as List
  prices as List
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
  white_range as Range
  black_range as Range
  summon_range as Range
  menu_spell_range as Range
  player_spell_range as Range
  'Constructors
  declare constructor()
  declare constructor(filename as String)
  'Text conversion
  declare function ConvertText(asciitext as String) as String
  declare function DisplayText(ff4text as String) as String
 private:
  'Raw ROM data and related flags
  romdata as String
  unheadered as Boolean
  if_patch as Boolean
  'Direct interface with ROM
  declare function ByteAt(address as Long) as UByte
  declare sub ReadFromFile(filename as String)
  declare sub WriteByte(address as Long, newbyte as UByte)
  declare sub WriteToFile()
  'Manage arrays of game objects
  declare sub InitializeObjects()
  'Find the index of an object pointer in the corresponding array
  declare function AttributeTableIndex(p as AttributeTable ptr) as Integer
  declare function SpellIndex(p as Spell ptr) as Integer
  declare function SpellSetIndex(p as SpellSet ptr) as Integer
  declare function JobIndex(p as Job ptr) as Integer
  declare function CharacterIndex(p as Character ptr) as Integer
  declare function ActorIndex(p as Actor ptr) as Integer
  'Read and write game objects to/from rom data
  declare sub  ReadActors()
  declare sub WriteActors()
  declare sub  ReadAIs()
  declare sub WriteAIs()
  declare sub  ReadArrangements()
  declare sub WriteArrangements()
  declare sub  ReadAttributeTables()
  declare sub WriteAttributeTables()
  declare sub  ReadCharacters()
  declare sub WriteCharacters()
  declare sub  ReadConditions()
  declare sub WriteConditions()
  declare sub  ReadConditionSets()
  declare sub WriteConditionSets()
  declare sub  ReadDropTables()
  declare sub WriteDropTables()
  declare sub  ReadEncounters()
  declare sub WriteEncounters()
  declare sub  ReadEquipTables()
  declare sub WriteEquipTables()
  declare sub  ReadEvents()
  declare sub WriteEvents()
  declare sub  ReadEventCalls()
  declare sub WriteEventCalls()
  declare sub  ReadFormations()
  declare sub WriteFormations()
  declare sub  ReadItems()
  declare sub WriteItems()
  declare sub  ReadJobs()
  declare sub WriteJobs()
  declare sub  ReadMaps()
  declare sub WriteMaps()
  declare sub  ReadMenuCommands()
  declare sub WriteMenuCommands()
  declare sub  ReadMessages()
  declare sub WriteMessages()
  declare sub  ReadMonsters()
  declare sub WriteMonsters()
  declare sub  ReadNPCs()
  declare sub WriteNPCs()
  declare sub  ReadPlacementSets()
  declare sub WritePlacementSets()
  declare sub  ReadShops()
  declare sub WriteShops()
  declare sub  ReadSpells()
  declare sub WriteSpells()
  declare sub  ReadSpellSets()
  declare sub WriteSpellSets()
  declare sub  ReadStances()
  declare sub WriteStances()
  declare sub  ReadStatTables()
  declare sub WriteStatTables()
  declare sub  ReadTileGrids()
  declare sub WriteTileGrids()
  declare sub  ReadTileSets()
  declare sub WriteTileSets()
end type

constructor FF4Rom()
end constructor

constructor FF4Rom(filename as String)
 InitializeObjects()
 ReadFromFile(filename)
end constructor

#include once "misc/converttext.bas"
#include once "misc/displaytext.bas"
#include once "rominterface/byteat.bas"
#include once "rominterface/readfromfile.bas"
#include once "rominterface/writebyte.bas"
#include once "rominterface/writetofile.bas"
#include once "rominterface/initializeobjects.bas"
#include once "rominterface/indexfinders.bas"
#include once "readwrite/actors.bas"
#include once "readwrite/attributetables.bas"
#include once "readwrite/characters.bas"
#include once "readwrite/encounters.bas"
#include once "readwrite/equiptables.bas"
#include once "readwrite/eventcalls.bas"
#include once "readwrite/events.bas"
#include once "readwrite/formations.bas"
#include once "readwrite/items.bas"
#include once "readwrite/jobs.bas"
#include once "readwrite/maps.bas"
#include once "readwrite/menucommands.bas"
#include once "readwrite/messages.bas"
#include once "readwrite/monsters.bas"
#include once "readwrite/npcs.bas"
#include once "readwrite/shops.bas"
#include once "readwrite/spells.bas"
#include once "readwrite/spellsets.bas"
#include once "readwrite/stances.bas"
#include once "readwrite/tilegrids.bas"
#include once "readwrite/tiles.bas"
#include once "readwrite/triggers.bas"


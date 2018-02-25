sub FF4Rom.InitializeObjects()
 for i as Integer = 0 to total_attribute_tables
  attribute_tables(i) = new AttributeTable
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
 for i as Integer = 0 to total_descriptions
  descriptions(i) = new Message
 next
 for i as Integer = 0 to total_weapons
  weapons(i) = new Weapon
  items(i) = weapons(i)
 next
 for i as Integer = 0 to total_armors
  armors(i) = new Armor
  items(i + total_weapons + 1) = armors(i)
 next
 for i as Integer = 0 to total_supplies
  supplies(i) = new Supply
  items(i + total_armors + 1) = supplies(i)
 next
 for i as Integer = 0 to total_tools
  tools(i) = new Tool
  items(i + total_supplies + 1) = tools(i)
 next
 for i as Integer = 0 to total_shops
  shops(i) = new Shop
 next
 for i as Integer = 0 to total_stances
  stances(i) = new Stance
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
 for i as Integer = 0 to total_stat_tables
  stat_tables(i) = new StatTable
 next
 for i as Integer = 0 to total_conditions
  conditions(i) = new Condition
 next
 for i as Integer = 0 to total_condition_sets
  condition_sets(i) = new ConditionSet
 next
 for i as Integer = 0 to total_ais
  ais(i) = new AI
 next
 for i as Integer = 0 to total_monsters
  monsters(i) = new Monster
 next
 for i as Integer = 0 to total_arrangements
  arrangements(i) = new Arrangement
 next
 for i as Integer = 0 to total_formations
  formations(i) = new Formation
 next
 for i as Integer = 0 to total_encounters
  encounters(i) = new Encounter
 next
 for i as Integer = 0 to total_events
  events(i) = new Event
 next
 for i as Integer = 0 to total_triggers
  triggers(i) = new Trigger
 next
 for i as Integer = 0 to total_tile_sets
  tile_sets(i) = new TileSet
 next
 for i as Integer = 0 to total_tile_grids
  tile_grids(i) = new TileGrid
 next
 for i as Integer = 0 to total_npcs
  npcs(i) = new NPC
 next
 for i as Integer = 0 to total_maps
  maps(i) = new Map
 next
end sub

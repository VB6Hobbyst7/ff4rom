type Monster
 name as String
 boss as Boolean
 level as UByte
 hp as Integer
 gil as Integer
 xp as Integer
 physical_attack as StatTable ptr
 physical_defense as StatTable ptr
 magic_defense as StatTable ptr
 speed_index as UByte
 drop_rate as UByte
 drop_table as DropTable ptr
 main_ai as AI ptr
 lunar as Boolean
 has_attack_attributes as Boolean
 has_resistances as Boolean
 has_weaknesses as Boolean
 has_spell_power as Boolean
 has_race as Boolean
 has_reaction as Boolean
 attack_attributes as AttributeTable
 resistances as AttributeTable
 weaknesses as AttributeTable
 spell_power as UByte
 races(7) as Boolean
 reaction as AI ptr
 size as UByte
 colors as UByte
 sprite1 as UByte
 sprite2 as UByte
end type

const total_monsters = 223

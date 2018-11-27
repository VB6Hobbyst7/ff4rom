type Item extends Object
 name as String
 price as UByte
 description as Message ptr
end type

type Tool extends Item
end type

type Supply extends Item
 delay as UByte
 target as UByte
 power as UByte
 boss as Boolean
 hit as UByte
 impact as Boolean
 effect as UByte
 damage as Boolean
 attributes as AttributeTable ptr
 reflectable as Boolean
 mp_cost as UByte
 visual as UByte
end type

type Equipment extends Item
 magnetic as Boolean
 attributes as AttributeTable ptr
 races(7) as Boolean
 stat_bonus as StatBonus
 equip as EquipTable ptr
end type

type Armor extends Equipment
 defense as UByte
 evade as UByte
 magic_defense as UByte
 magic_evade as UByte
end type

type Weapon extends Equipment
 properties(7) as Boolean
 ranged as Boolean
 throwable as Boolean
 attack as UByte
 hit as UByte
 sprite as UByte
 colors as UByte
 swing as UByte
 slash as UByte
 casts as Spell ptr
 spell_visual as Spell ptr
 spell_power as UByte
end type

const total_items = &hFF
const total_tools = 34
const total_supplies = 45
const total_equipment = 175
const total_armors = 79
const total_weapons = 95

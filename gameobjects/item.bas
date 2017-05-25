'An item is something that could go in the player's inventory, among a wide
' variety of other places, such as treasure chests and actor starting equips.

' There are four main types of items:
'  * Tools: They don't do anything in battle and can't be equipped. Some can
'            be used outside of battle to trigger an event, but some are just
'            plot items used in certain scenes.
'  * Medicines: They can be used in battle and are usually consumed. They
'                can't be equipped.
'  * Armor: They can be equipped to give you extra defense and resistances.
'            There are four main slots armor can be equipped in: Head, Body,
'            Arms, and "off hand". Which goes in which slot is controlled by
'            ranges.
'  * Weapons: They can be equipped in your "main hand" to give attack bonuses
'              and other properties. Ambidextrous characters can use a weapon
'              in their off hand instead of an armor.

' Not all types of items can make use of all the properties; there are some
'  specific to weapons, some specific to armors, etc. Also some properties
'  are used differently by different item types. For example, "elements" for
'  a weapon means the elemental/status properties of the attack, whereas for
'  an armor, it indicates what elements and statuses it resists.

type Item

 'All items
 name as String
 price_code as UByte
 description as UByte

 'Medicines only
 delay as UByte
 target as UByte
 power as UByte
 boss as Boolean
 success as UByte
 impact as Boolean
 effect as UByte
 damage as UByte
 element_code as UByte
 reflectable as Boolean
 mp_cost as UByte
 visual as UByte
 
 'Armors only
 defense as UByte
 evade as UByte
 magic_defense as UByte
 magic_evade as UByte

 'Weapons and Armors
 elements as UByte
 races(7) as Boolean
 stat_bonus as StatBonus

 'Weapons only
 attack as UByte
 hit as UByte
 sprite as UByte
 colors as UByte
 swing as UByte
 slash as UByte
 casts as UByte
 spell_power as UByte

end type

const total_items = &hFF

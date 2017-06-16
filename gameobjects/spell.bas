'This is the information for a magic spell (White, Black, Call, Ninja, or Twin)
' or a "special technique", usually some kind of action done by a monster.

' Some of these have special effects important for monster battle scripts such
'  as making a monster invincible or causing other monsters to trigger a
'  reaction (e.g. the captain telling his soldiers to attack).

' The "player" spells have six letter names and will appear correctly when put
'  into spell sets. If you put a spell/technique outside this range into a
'  spell set, it will not display correctly.

type Spell

 name as String
 delay as UByte
 target as UByte
 power as UByte
 hit as UByte
 boss as Boolean
 effect as UByte
 damage as Boolean
 element_code as UByte
 impact as Boolean
 mp_cost as UByte
 reflectable as Boolean
 colors as UByte
 sprites as UByte
 visual1 as UByte
 visual2 as UByte
 sound as UByte

end type

const total_spells = &hBF

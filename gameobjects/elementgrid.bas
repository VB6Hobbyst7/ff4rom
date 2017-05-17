'An ElementGrid is a combination of element and/or status flags.

' Rather than having each weapon, armor, spell, etc, reference its own set of
'  element and status flags individually, there is a large table of
'  element/status combinations, and the spells and such reference an index in
'  the table corresponding to one of the combinations.

' Each flag corresponds to a different element or status as defined by the
'  constants.

' The "immune" flag has special meanings:
'  * For a weapon: I don't think it does anything but I'm not completely sure.
'  * For an armor: It makes you take 1 damage instead of half damage from
'                   elements that you resist (whether you resist them because
'                   of this armor or other armors; for example if you have a
'                   Helm with the immune and fire flags and a Ring with the
'                   bolt flag, you will be immune to both fire and bolt).
'  * For a weakness: It makes you take 4x damage instead of 2x damage from
'                     elements that you are weak to. For example, if you have
'                     the bolt, fire, and immune flags, you will take
'                     4x damage from bolt and fire sources.
'  * For a resistance: Same as armor.

' The "absorb" flag also has special meanings:
'  * For a weapon: Damage dealt by the weapon will heal the attacker equal to
'                   the amount of damage dealt.
'  * For an armor: It makes you heal HP equal to the damage instead of taking
'                   half damage from elements that you resist (whether you
'                   resist them because of this armor or other armors, in the
'                   same manner as the immune flag). I'm not sure whether it
'                   halves the damage as well or just inverts it.

const total_element_grids = 123

const fire = 1
const ice = 2
const bolt = 3
const dark = 4
const holy = 5
const air = 6
const absorb = 7
const immune = 8

const poison = 9
const blind = 10
const mute = 11
const pig = 12
const mini = 13
const frog = 14
const petrify = 15
const ko = 16

const calcify1 = 17
const calcify2 = 18
const berserk = 19
const charm = 20
const asleep = 21 'I can't call it "sleep" as that is a BASIC keyword
const stun = 22
const float = 23
const curse = 24

type ElementGrid

 flags(24) as Boolean

end type



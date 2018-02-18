'This is what tracks a character's initial stats, levelups, and other
' miscellaneous information.

type ActorFwd as Actor

type Character

 initial_actor as ActorFwd ptr
 left_handed as Boolean
 right_handed as Boolean
 job_link as Job ptr
 sprite as UByte
 level as UByte
 max_hp as UInteger
 max_mp as UInteger
 stats(5) as UByte
 xp as UInteger
 tnl as UInteger
 levelups(69) as LevelUp
 after70(7) as StatBonus

end type


const total_characters = 12

const dk_character = 0
const kain_character = 1
const rydia_character = 2
const tellah_character = 3
const edward_character = 4
const rosa_character = 5
const yang_character = 6
const palom_character = 7
const porom_character = 8
const paladin_character = 9
const cid_character = 10
const edge_character = 11
const fusoya_character = 12

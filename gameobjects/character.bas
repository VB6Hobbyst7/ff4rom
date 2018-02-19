type ActorFwd as Actor

type Character
 initial_actor as ActorFwd ptr
 left_handed as Boolean
 right_handed as Boolean
 job_link as Job ptr
 sprite as UByte
 level as UByte
 max_hp as Integer
 max_mp as Integer
 stats(4) as UByte
 xp as Integer
 tnl as Integer
 levelups(69) as LevelUp
 after70(7) as StatBonus
end type

const total_characters = 12

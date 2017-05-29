'This represents a character's appearance and spell sets. It is also
' referenced by other game objects to determine things like what the character
' can equip.

' The in-battle spell menus and out-of-battle spell menus are normally the
'  same, but there is nothing technically preventing them from being
'  different if desired.

' The number of jobs that are actually defined is different from the number
'  that can be referenced by other things, such as equip charts. That is why
'  there are two separate constants to track total jobs versus usable jobs.

type Job

 name as String
 white as UByte
 black as UByte
 summon as UByte 'Call is a BASIC keyword
 menu_white as UByte
 menu_black as UByte
 menu_summon as UByte

end type

const total_jobs = 15
const usable_jobs = 13

const dark_knight_job = 0
const dragoon_job = 1
const young_caller_job = 2
const sage_job = 3
const bard_job = 4
const archer_job = 5 'to distinguish from porom
const karate_job = 6
const black_wiz_job = 7
const white_wiz_job = 8
const paladin_job = 9
const chief_job = 10
const adult_caller_job = 11
const ninja_job = 12
const lunar_job = 13
const extra1_job = 14
const extra2_job = 15

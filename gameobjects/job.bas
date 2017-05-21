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

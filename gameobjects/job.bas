type Job
 name as String
 white as SpellSet ptr
 black as SpellSet ptr
 summon as SpellSet ptr
 menu_white as SpellSet ptr
 menu_black as SpellSet ptr
 menu_summon as SpellSet ptr
end type

const total_jobs = 15
const usable_jobs = 13

enum JobNames
 dark_knight = 0
 dragoon
 young_caller
 sage
 bard
 archer
 karate
 black_wiz
 white_wiz
 paladin
 chief
 adult_caller
 ninja
 lunar
 extra1
 extra2
end enum

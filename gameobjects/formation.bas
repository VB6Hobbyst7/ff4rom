type Formation
 mystery_flag(2) as Boolean
 back_attack as Boolean
 boss_death as Boolean
 egg(2) as Boolean
 monster_type(2) as Monster ptr
 summons as Boolean
 transforms as Boolean
 number_appearing(2) as UByte
 arrangement as UByte
 no_flee as Boolean
 no_gameover as Boolean
 battle_music as UByte
 character_battle as Boolean
 auto_battle as Boolean
 auto_battle_script as AutoScriptList
 floating as Boolean
 transparent as Boolean
 cursor_style as UByte
end type

const total_formations = 511
const max_autobattles = 6

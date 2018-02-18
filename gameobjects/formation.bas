'A formation is a battle with a particular set of monsters. Not to
' be confused with the (x, y) coordinates of the monsters on the
' screen; those are an "arrangement".

' A formation, in addition to detailing what types of monsters are in
'  the battle and how many of each, also details certain other
'  features such as whether you can run from the battle, whether it
'  is an auto-battle (where the computer automatically takes over
'  and has you execute a certain script, such as the Tellah v Bard
'  fight), or whether the monsters are visually floating.

type Formation

 mystery_flag(3) as Boolean
 back_attack as Boolean      
 boss_death as Boolean       
 egg(3) as Boolean           
 monster_type(3) as Monster ptr
 summons as Boolean
 transforms as Boolean
 number_appearing(3) as UByte     
 arrangement as UByte        
 no_flee as Boolean          
 no_gameover as Boolean      
 battle_music as UByte
 character_battle as Boolean 
 auto_battle as Boolean      
 floating as Boolean         
 transparent as Boolean
 cursor_style as UByte

end type


const total_formations = 511

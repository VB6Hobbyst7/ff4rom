type Actor
 name_index as UByte
 load_initial as Boolean
 store_shadow as Boolean
 load_slot as UByte
 store_slot as UByte
 character_link as Character ptr
 menu_command(4) as MenuCommand ptr
 starting_gear(4) as Item ptr
 right_ammo as UByte
 left_ammo as UByte
end type

const total_actors = 21

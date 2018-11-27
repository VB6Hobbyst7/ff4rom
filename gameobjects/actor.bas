type MenuCommandFwd as MenuCommand

type Actor
 name_index as UByte
 load_initial as Boolean
 store_shadow as Boolean
 load_slot as UByte
 store_slot as UByte
 character_link as Character ptr
 menu_command(4) as MenuCommandFwd ptr
 starting_gear(4) as Item ptr
 right_ammo as UByte
 left_ammo as UByte
end type

const total_actors = 21
const total_names = 13

enum ActorNames
 cecil1 = 1
 kain1
 rydia1
 tellah1
 edward
 rosa
 yang
 palom
 porom
 tellah2
 cecil2
 tellah3
 yang2
 cid
 kain2
 rosa2
 rydia2
 edge
 fusoya
 kain3
 golbez
end enum

enum EquipSlots
 right_hand = 0
 left_hand
 head
 body
 arms
end enum

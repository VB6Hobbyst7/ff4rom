'An actor is what joins or leaves your team; there can be multiple actors of
' the same character.

const total_actors = 20
const total_names = 14

const dk_actor = 1
const kain1_actor = 2
const child_rydia_actor = 3
const tellah1_actor = 4
const edward_actor = 5
const rosa1_actor = 6
const yang1_actor = 7
const palom_actor = 8
const porom_actor = 9
const tellah2_actor = 10
const paladin_actor = 11
const tellah3_actor = 12
const yang2_actor = 13
const cid_actor = 14
const kain2_actor = 15
const rosa2_actor = 16
const adult_rydia_actor = 17
const edge_actor = 18
const fusoya_actor = 19
const kain3_actor = 20
const golbez_actor = 21

type Actor

 name_index as UByte
 load_initial as Boolean
 store_shadow as Boolean
 load_slot as UByte
 store_slot as UByte
 level_link as UByte
 menu_command(5) as UByte
 starting_gear(5) as UByte
 right_ammo as UByte
 left_ammo as UByte

end type

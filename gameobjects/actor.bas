'An actor is what joins or leaves your team; there can be multiple actors of
' the same character.

const total_actors = 19
const total_names = 13

const dk_actor = 0
const kain1_actor = 1
const child_rydia_actor = 2
const tellah1_actor = 3
const edward_actor = 4
const rosa1_actor = 5
const yang1_actor = 6
const palom_actor = 7
const porom_actor = 8
const tellah2_actor = 9
const paladin_actor = 10
const tellah3_actor = 11
const yang2_actor = 12
const cid_actor = 13
const kain2_actor = 14
const rosa2_actor = 15
const adult_rydia_actor = 16
const edge_actor = 17
const fusoya_actor = 18
const kain3_actor = 19
const golbez_actor = 20 'His data isn't read but he can be referred to
                        ' in, say, the events and such.

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

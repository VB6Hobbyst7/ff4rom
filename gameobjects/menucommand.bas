'This is a battle action that can appear in an actor's battle menu.

' Some features are shared by all commands (name, target, delay, etc).
'  However, certain commands have other parameters that can be modified
'  for various effects (such as the spells cast by Pray, Sing, etc).
'  These parameters are stored in the "parameters" byte whose meaning is
'  unique to each command. Use the constants as a guide.

' The target byte seems to contain some additional (unknown I think)
'  information; only the lower three bits seem to actually affect the
'  targeting (target mod 8), so it is only safe to change those three
'  bits.

' Some commands are disabled when the character has certain statuses.
'  These are in two categories:
'   * Persistent: Statuses that persist between battles such as Poison
'   * Temporary: Statuses that only last during battle, such as Charm
'  The reason there are 24 flags in the data structure when only 16 are
'   relevant is so that you can use the element/status constants and have
'   them work the way you expect. Thus, the first 8 flags do nothing.

' Since many commands (mainly the unused ones but also some of the
'  regular ones) are commonly called a variety of different things, I have
'  included all the frequently used aliases in the constants to make it
'  easier to refer to them. A notable exception is "Focus", which is often
'  used to refer either to Palom's spell boosting ability or yang's charge
'  punch. Since Focus was used in an official release to refer to Yang's
'  ability, I have decided to err in that direction.

const total_menu_commands = 25

const fight_command = 0
const item_command = 1
const white_command = 2
const black_command = 3
const call_command = 4
const summon_command = 4
const darkwave_command = 5
const darkness_command = 5
const dark_command = 5
const jump_command = 6
const recall_command = 7
const sing_command = 8
const hide_command = 9
const salve_command = 10
const split_command = 10
const medicine_command = 10
const heal_command = 10
const pray_command = 11
const aim_command = 12
const charge_command = 13
const focus_command = 13
const kick_command = 14
const gird_command = 15
const bear_command = 15
const twin_command = 16
const boast_command = 17
const boost_command = 17
const tears_command = 18
const cry_command = 18
const cover_command = 19
const peep_command = 20
const scan_command = 20
const crash_command = 21
const dart_command = 22
const throw_command = 22
const sneak_command = 23
const steal_command = 23
const ninja_command = 24
const regen_command = 25
const spirit_command = 25
const spiritwave_command = 25

const self_target = 0
const single_ally_target = 1
const all_allies_target = 2
const split_ally_target = 3
const single_enemy_target = 4
const single_unit_target = 5
const all_enemies_target = 6
const split_enemies_target = 7

const resting_stance = 0
const parry_stance = 1
const walking_stance = 2
const crouching_stance = 3
const right_hand_strike_stance = 4
const left_hand_strike_stance = 5
const getting_hit_stance = 6
const cheering_stance = 7
const ko_stance = 8
const chanting_stance = 9
const charging_stance = 10
const casting_stance = 11
const left_hand_raised_stance = 12
const first_special_stance = 13
const second_special_stance = 14
const alt_resting_stance = 15 'Not sure why there are two of these...

type MenuCommand

 name as String
 target as UByte
 delay as UByte
 disabling_statuses_persistent(8) as Boolean
 disabling_statuses_temporary(8) as Boolean
 charging_stance as UByte
 action_stance as UByte
 action_stance2 as UByte
 action_stance3 as UByte
 parameters(24) as UByte 'This could be spells, success rates, etc.
 message_index(5) as UByte
 
end type

'A monster is something that you can fight in battle.

type Monster

 name as String
 boss as Boolean
 level as UByte
 hp as UInteger
 gil as UInteger
 xp as UInteger
 physical_attack_index as UByte
 physical_defense_index as UByte
 magical_defense_index as UByte
 speed_index as UByte
 drop_rate as UByte
 drop_table as DropTable ptr
 attack_sequence_group as UByte
 lunar as Boolean
 has_attack_element as Boolean
 has_resistances as Boolean
 has_weaknesses as Boolean
 has_spell_power as Boolean
 has_race as Boolean
 has_reaction as Boolean
 attack_element as ElementStatusTable
 resistances as ElementStatusTable
 weaknesses as ElementStatusTable
 spell_power as UByte
 races(7) as Boolean
 reaction_index as UByte
 size as UByte
 pal as UByte
 gfx_ptr1 as UByte
 gfx_ptr2 as UByte

end type

const total_monsters = 223

const dragon_race = 0
const robot_race = 1
const reptile_race = 2
const spirit_race = 3
const giant_race = 4
const slime_race = 5
const mage_race = 6
const zombie_race = 7

const mist_dragon_monster = 161
const octomamm_monster = 162
const antlion_monster = 163
const mombomb_monster = 164
const milon_monster = 165
const milon_z_monster = 166
const baigan_monster = 167
const right_arm_monster = 168
const left_arm_monster = 169
const kainazzo_monster = 170
const dark_elf_you_fools_monster = 171
const dark_elf_monster = 172
const sandy_monster = 173
const cindy_monster = 174
const mindy_monster = 175
const golbez_v_tellah_monster = 176
const valvalis_monster = 177
const cal_monster = 178
const calbrena_monster = 179
const golbez_monster = 180
const shadow_monster = 181
const lugae_small_monster = 182
const balnab_monster = 183
const lugae_monster = 184
const king_eblan_monster = 185
const queen_eblan_monster = 186
const rubicant_monster = 187
const odin_monster = 188
const leviatan_monster = 189
const bahamut_monster = 190
const evil_wall_monster = 191
const asura_monster = 192
const elements_1_monster = 193
const elements_2_monster = 194
const dark_elf_dragon_monster = 195
const waterhag_v_edward_monster = 196
const cpu_monster = 197
const defender_monster = 198
const zemus_monster = 199
const zeromus_shroud_monster = 200
const zeromus_monster = 201
const dragoon_monster = 202
const bard_monster = 203
const karate_monster = 204
const dark_knight_monster = 205
const girl_monster = 206
const titan_monster = 207
const floateye_intro_monster = 208
const raven_intro_monster = 209
const brena_monster = 210
const ghast_monster = 211
const balnab_z_monster = 212
const attacker_monster = 213
const zeromus_cutscene_monster = 216
const egg_monster = 223

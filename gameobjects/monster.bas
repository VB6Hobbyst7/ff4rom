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
 drop_index as UByte
 attack_sequence_group as UByte
 lunar as Boolean
 has_attack_element as Boolean
 has_resistances as Boolean
 has_weaknesses as Boolean
 has_spell_power as Boolean
 has_race as Boolean
 has_reaction as Boolean
 attack_element as ElementGrid
 resistances as ElementGrid
 weaknesses as ElementGrid
 spell_power as UByte
 races(7) as Boolean
 reaction_index as UByte
 size as UByte
 pal as UByte
 gfx_ptr1 as UByte
 gfx_ptr2 as UByte

end type

const total_monsters = 223

const mist_dragon_monster = 162
const octomamm_monster = 163
const antlion_monster = 164
const mombomb_monster = 165
const milon_monster = 166
const milon_z_monster = 167
const baigan_monster = 168
const right_arm_monster = 169
const left_arm_monster = 170
const kainazzo_monster = 171
const dark_elf_you_fools_monster = 172
const dark_elf_monster = 173
const sandy_monster = 174
const cindy_monster = 175
const mindy_monster = 176
const golbez_v_tellah_monster = 177
const valvalis_monster = 178
const cal_monster = 179
const calbrena_monster = 180
const golbez_monster = 181
const shadow_monster = 182
const lugae_small_monster = 183
const balnab_monster = 184
const lugae_monster = 185
const king_eblan_monster = 186
const queen_eblan_monster = 187
const rubicant_monster = 188
const odin_monster = 189
const leviatan_monster = 190
const bahamut_monster = 191
const evil_wall_monster = 192
const asura_monster = 193
const elements_1_monster = 194
const elements_2_monster = 195
const dark_elf_dragon_monster = 196
const waterhag_v_edward_monster = 197
const cpu_monster = 198
const defender_monster = 199
const zemus_monster = 200
const zeromus_shroud_monster = 201
const zeromus_monster = 202
const dragoon_monster = 203
const bard_monster = 204
const karate_monster = 205
const dark_knight_monster = 206
const girl_monster = 207
const titan_monster = 208
const floateye_intro_monster = 209
const raven_intro_monster = 210
const brena_monster = 211
const ghast_monster = 212
const balnab_z_monster = 213
const attacker_monster = 214
const zeromus_cutscene_monster = 217
const egg_monster = 224

type Spell
 name as String
 delay as UByte
 target as UByte
 power as UByte
 hit as UByte
 boss as Boolean
 effect as UByte
 damage as UByte
 attributes as AttributeTable ptr
 impact as Boolean
 mp_cost as UByte
 reflectable as Boolean
 colors as UByte
 sprites as UByte
 visual1 as UByte
 visual2 as UByte
 sound as UByte
end type

const total_spells = &hBF

enum Spells
 no_spell = 0
 hold
 mute
 charm
 blink
 armor
 shell_spell
 slow
 fast
 bersk
 wall
 white
 dispel
 peep
 cure1
 cure2
 cure3
 cure4
 heal
 life1
 life2
 size
 exit_spell
 sight
 float
 toad
 piggy
 warp
 venom
 fire1
 fire2
 fire3
 ice1
 ice2
 ice3
 lit1
 lit2
 lit3
 virus
 weak
 quake
 sleep_spell
 stone
 fatal
 stop_spell
 drain
 psych
 meteo
 nuke
 imp_spell
 bomb
 cockatrice
 mage
 chocb
 shiva
 indra
 jinn
 titan
 mist
 sylph
 odin
 levia
 baham
 comet
 flare
 flame
 flood
 blitz
 smoke
 pin
 image
 magic_missile
 group_heal
 basuna
 pure
 dancing
 goblin_punch
 exploder
 stone_gaze
 mind_blast
 choco_kick
 diamond_dust
 judgment_bolt
 hell_fire
 gaia_rage
 mist_breath
 whispering_wind
 zantetsuken
 tsunami
 asura_cure2
 asura_cure3
 asura_life
 megaflare
 w_meteo
 unknown1
 unknown2
 gaze
 bluster
 slap
 powder
 glance
 monster_charm
 tongue
 curse
 ray
 count
 beak
 petrify
 blast
 hug
 breath
 whisper
 entangle
 monster_weak
 disrupt
 coldmist
 explode
 dullsong
 hold_gas
 gas
 poison
 maser
 vanish
 demolish
 black_hole
 pinkpuff_dance
 disrupt2
 storm
 magnet
 reaction
 hatch
 remedy
 absorb
 monster_heal
 big_bang
 vampire
 digest
 pollen
 crush
 alert
 call_spell
 trigger_reaction
 vanish2
 search
 fission
 retreat
 monster_heal2
 beam
 globe199
 monster_fire
 blaze
 monster_blitz
 thunder
 d_breath
 big_wave
 blizzard
 wave
 tornado
 laser
 explode2
 monster_quake
 emission
 heat_ray
 glare
 monster_zantetsuken
 meganuke
 needle
 counter
 increment_counter
 decrement_counter
 recover
 remedy2
 suicide_spawn
 end_battle
 audiovisual
 adult_rydia
end enum

enum Targets
 self = 0
 single_ally
 all_allies
 split_ally
 single_enemy
 single_unit
 all_enemies
 split_enemy
end enum

enum SpellEffects
 damage = 0
 damage_sap
 recover_hp
 single_digit_hp
 drain_hp
 drain_mp
 add_status
 immobilize
 add_blink
 add_reflect
 remove_ko
 remove_status
 transform
 increase_defense
 increase_mdef
 modify_speed
 dispel
 add_stop
 scan
 flee
 caster_hp_damage
 recover_mp
 full_heal
 damage_poison
 damage_status
 damage_immobilize
 sylph
 odin
 count1
 count2
 target_hp_damage
 add_calcify
 gaze
 bluster
 slap
 blast
 hug
 explode
 reaction
 recover_tenth_hp
 damage_status2
 spawn
 dispel2
 attack_damage
 recover_third_hp
 trigger_reaction
 increment_counter
 decrement_counter
 revive_monster
 suicide_spawn
 end_battle
 search
 hatch
 adult_rydia
end enum

enum SoundEffects
 no_sound = 0
 electric_crackle
 mist_dragon
 odin
 meteor
 explosion
 thud
 blade_pierce
 single_punch
 black_magic
 grinding
 rod
 exit_spell
 fire
 thunder
 petrify
 defeat
 ice2
 magnetism
 tornado
 transform
 mute
 throw
 white_magic
 projectile_hit
 shiva
 cure
 airship
 stop_spell
 blizzard
 reflect
 float
 quake
 flee
 healing_pot
 crush
 crystal
 hop
 bahamut
 raise
 landing
 flood
 take_hit
 cash_register
 thud2
 globe199
 fire3
 beach_waves
 unlocking
 heavy_door
 propellors
 big_bang
 summon_magic
 gaze
 laser
 get_item
 falling
 fixing
 harp
 death
 alert
 jumping
 bio
 begin_battle
 powder
 haste
 deep_glow
 scan
 splash
 door
 clock
 whirlpool
 crunch
 hummingway
 black_hole
 whirling_magic
 whistle
 comet
 absorb
 sylph
 burning
 slap
 entice
 earthquake
 pow
 smoke
 magnetize
 hatch
 needles
 pyro
 paralyze
 zantetsuken
 heal
 venom
 drain
 ice3
 flare
 warp
 holy
 dispel
 blink
 sleep_spell
 berserk
 charm
 slow
end enum

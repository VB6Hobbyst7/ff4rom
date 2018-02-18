'This is a set of spells a character can have in the game menu and in battle.
'When a "character" learns a spell at level up, it goes into the spell set
'corresponding to that spell's color (white, summon, or black/ninja). If a
'spell is learned through an event, it is put directly into a certain spell
'set regardless of what character that set was assigned to.

'The list of starting spells are the spells initialized into that spell set at
'the beginning of the game. This happens when you start a new game, not when
'you first add the character to your party.

'The list of spells learned through level ups is associated with a list of
'levels. The nth spell in the learning list is learned at the level specified
'at the nth place in the list of learning levels. For example, if the
'learning list consisted of [Fire, Ice, Bolt] and the level list was 
'[15, 15, 20], then the character with that spell set would learn Fire and
'Ice at level 15 and Bolt at level 20. In the rom, these are stored in order
'of level, and I'm not sure whether that matters, so it's a good idea to sort
'the list before saving (there's an edit function for doing this).

'The spell lists are stored as lists of pointers to spells rather than indexes.

type SpellSet

 starting_spells as List
 learning_spells as List
 learning_levels as List
 
end type


const total_spell_sets = 12

const paladin_white_spellset = 0
const unused_spellset = 1
const kain_spellset = 1
const rydia_white_spellset = 2
const rydia_black_spellset = 3
const rydia_summon_spellset = 4
const tellah_white_spellset = 5
const tellah_black_spellset = 6
const rosa_white_spellset = 7
const palom_black_spellset = 8
const porom_white_spellset = 9
const fusoya_white_spellset = 10
const fusoya_black_spellset = 11
const edge_spellset = 12

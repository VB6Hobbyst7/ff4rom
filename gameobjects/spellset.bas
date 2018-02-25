type SpellSet
 private:
  starting_spells as List
  learning_spells as List
  learning_levels as List
 public:
  declare function LearnedAtLevel(level as Integer) as List
  declare function LearnedSpell(index as Integer) as Spell ptr
  declare function LevelIndex(index as Integer) as Integer
  declare function LevelOfSpell(s as Spell ptr) as Integer
  declare function StartingSpell(index as Integer) as Spell ptr
  declare function TotalLearnedSpells() as Integer
  declare function TotalStartingSpells() as Integer
  declare sub AddStartingSpell(s as Spell ptr)
  declare sub AddLearnedSpell(s as Spell ptr, level as UByte)
end type

const total_spell_sets = 12

enum SpellSetNames
 paladin_white = 0
 unused1
 unused2
 rydia_white
 rydia_black
 rydia_summon
 tellah_white
 tellah_black
 rosa_white
 palom_black
 porom_white
 fusoya_white
 fusoya_black
 edge
end enum

function SpellSet.LearnedAtLevel(level as Integer) as List
 dim result as List
 for i as Integer = 1 to learning_levels.Size()
  if learning_levels.ValueAt(i) = level then
   result += learning_spells.PointerAt(i)
  end if
 next
 return result
end function

function SpellSet.LearnedSpell(index as Integer) as Spell ptr
 return cptr(Spell ptr, learning_spells.PointerAt(index))
end function

function SpellSet.LevelIndex(index as Integer) as Integer
 return learning_levels.ValueAt(index)
end function

function SpellSet.LevelOfSpell(s as Spell ptr) as Integer
 dim result as Integer
 for i as Integer = 1 to learning_spells.Size()
  if learning_spells.PointerAt(i) = s then
   result = learning_levels.ValueAt(i)
  end if
 next
 return result
end function

function SpellSet.StartingSpell(index as Integer) as Spell ptr
 return cptr(Spell ptr, starting_spells.PointerAt(index))
end function

function SpellSet.TotalLearnedSpells() as Integer
 return learning_spells.Size()
end function

function SpellSet.TotalStartingSpells() as Integer
 return starting_spells.Size()
end function

sub SpellSet.AddStartingSpell(s as Spell ptr)
 starting_spells.AddPointer(s)
end sub

sub SpellSet.AddLearnedSpell(s as Spell ptr, level as UByte)
 learning_spells.AddPointer(s)
 learning_levels.AddValue(level)
end sub

'An ElementStatusTable is a combination of element and/or status flags.

'Rather than having each weapon, armor, spell, etc, reference its own set of
'element and status flags individually, there is a large table of
'element/status combinations, and the spells and such reference an index in
'the table corresponding to one of the combinations.

'Each flag corresponds to a different element or status as defined by the
'constants.

'The "immune" flag has special meanings:
' * For a weapon: I don't think it does anything but I'm not completely sure.
' * For an armor: It makes you take 1 damage instead of half damage from
'                 elements that you resist (regardless of whether you resist
'                 them because of this armor or other armors; for example if
'                 you have a Helm with the immune and fire flags and a Ring
'                 with the bolt flag, you will be immune to both fire and
'                 bolt).
' * For a weakness: It makes you take 4x damage instead of 2x damage from
'                   elements that you are weak to. For example, if you are weak
'                   to bolt, fire, and immune, you will take 4x damage from
'                   bolt and fire sources.
' * For a resistance: Same as armor.

'The "absorb" flag also has special meanings:
' * For a weapon: Damage dealt by the weapon will heal the attacker equal to
'                 the amount of damage dealt.
' * For an armor: It makes you heal HP equal to the damage instead of taking
'                 half damage from elements that you resist (whether you
'                 resist them because of this armor or other armors, in the
'                 same manner as the immune flag). I'm not sure whether it
'                 halves the damage as well or just inverts it.
' * For a weakness: I'm not sure how this works, but I think it just makes you
'                   take 2x damage from attacks that have the absorb flag.
' * For a resistance: Same as armor.

type ElementStatusTable extends Object

 flags as Set
 
 declare function BytesFromFlags() as List
 declare sub AddItem(flag_name as String)
 declare sub AddItems(flag_names as List)
 declare sub ReplaceFlags(new_flags as List)
 declare sub ReplaceItems(new_flags as List)
 declare sub SetFlagsFromBytes(byte1 as UByte, byte2 as UByte, byte3 as UByte)
 
 declare static function FlagName(flag as Integer) as String

 private:
 declare static function CorrespondingFlag(flag_name as String) as Integer
 
end type

const total_element_status_tables = 123

const fire = 0
const ice = 1
const bolt = 2
const dark = 3
const holy = 4
const air = 5
const absorb = 6
const immune = 7

const poison = 8
const blind = 9
const mute = 10
const pig = 11
const mini = 12
const frog = 13
const petrify = 14
const ko = 15

const calcify1 = 16
const calcify2 = 17
const berserk = 18
const charm = 19
const asleep = 20 'I can't call it "sleep" as that is a BASIC keyword
const stun = 21
const float = 22
const curse = 23


function ElementStatusTable.BytesFromFlags() as List

 dim result as List
 dim b1 as UByte
 dim b2 as UByte
 dim b3 as UByte
 
 for i as Integer = 0 to 7
  if flags.ContainsValue(i) then b1 = bitset(b1, i)
  if flags.ContainsValue(i + 8) then b2 = bitset(b2, i)
  if flags.ContainsValue(i + 16) then b3 = bitset(b3, i)
 next
 result.AddValue(b1)
 result.AddValue(b2)
 result.AddValue(b3)
 
 return result

end function


sub ElementStatusTable.AddItem(flag_name as String)

 flags.AddValue(CorrespondingFlag(flag_name))

end sub


sub ElementStatusTable.AddItems(flag_names as List)

 for i as Integer = 1 to flag_names.Length()
  flags.AddValue(CorrespondingFlag(flag_names.ItemAt(i)))
 next

end sub


sub ElementStatusTable.ReplaceFlags(new_flags as List)

 flags.Destroy()
 flags.AddValues(new_flags)

end sub


sub ElementStatusTable.ReplaceItems(new_flags as List)

 flags.Destroy()
 for i as Integer = 1 to new_flags.Length()
  flags.AddValue(CorrespondingFlag(new_flags.ItemAt(i)))
 next

end sub


sub ElementStatusTable.SetFlagsFromBytes(byte1 as UByte, byte2 as UByte, byte3 as UByte)

 flags.Destroy()
 for i as Integer = 0 to 7
  if bit(byte1, i) then flags.AddValue(i)
  if bit(byte2, i) then flags.AddValue(i + 8)
  if bit(byte3, i) then flags.AddValue(i + 16)
 next

end sub


function ElementStatusTable.CorrespondingFlag(flag_name as String) as Integer

 dim result as Integer
 
 select case ucase(flag_name)
 case "fire"
  result = fire
 case "ice", "water"
  result = ice
 case "bolt", "thunder", "lit", "lightning"
  result = bolt
 case "dark", "darkness", "unholy"
  result = dark
 case "holy", "white", "sacred"
  result = holy
 case "air", "projectile", "spear", "bow"
  result = air
 case "absorb", "drain"
  result = absorb
 case "immune", "extra", "force"
  result = immune
 case "poison"
  result = poison
 case "blind"
  result = blind
 case "mute", "silence"
  result = mute
 case "pig", "piggy"
  result = pig
 case "mini", "small", "size"
  result = mini
 case "frog", "toad"
  result = frog
 case "petrify", "stone"
  result = petrify
 case "ko", "dead", "death", "swoon", "fatal"
  result = ko
 case "calcify1", "calcify 1", "calcify", _
      "gradual petrify 1", "gradual petrify1", "gradual petrify", _
      "gradual-petrify 1", "gradual-petrify1", "gradual-petrify", _
      "gradualpetrify1", "gradualpetrify1", "gradualpetrify", _
      "petrify1", "petrify 1", "petrifying1", "petrifying 1", "petrifying"
  result = calcify1
 case "calcify2", "calcify 2", _
      "gradual petrify 2", "gradual petrify2", _
      "gradual-petrify 2", "gradual-petrify2", _
      "gradualpetrify2", "gradualpetrify2", _
      "petrify2", "petrify 2", "petrifying2", "petrifying 2", "d"
  result = calcify2
 case "berserk"
  result = berserk
 case "charm", "confuse"
  result = charm
 case "asleep", "sleep"
  result = asleep
 case "stun", "paralyze", "hold"
  result = stun
 case "float", "floating"
  result = float
 case "curse"
  result = curse
 end select
 
 return result

end function


function ElementStatusTable.FlagName(flag as Integer) as String

 dim result as String
 
 select case flag
  case fire:     result = "Fire"
  case ice:      result = "Ice"
  case bolt:     result = "Bolt"
  case dark:     result = "Dark"
  case holy:     result = "Holy"
  case air:      result = "Air"
  case absorb:   result = "Absorb"
  case immune:   result = "Immune"
  case poison:   result = "Poison"
  case blind:    result = "Blind"
  case mute:     result = "Mute"
  case pig:      result = "Pig"
  case mini:     result = "Mini"
  case frog:     result = "Frog"
  case petrify:  result = "Petrify"
  case ko:       result = "KO"
  case calcify1: result = "Calcify1"
  case calcify2: result = "Calcify2"
  case berserk:  result = "Berserk"
  case charm:    result = "Charm"
  case asleep:   result = "Sleep"
  case stun:     result = "Stun"
  case float:    result = "Float"
  case curse:    result = "Curse"
 end select
 
 return result

end function

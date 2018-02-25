type StatBonus
 stats(4) as Boolean
 amount as UByte
 declare function ToByte() as UByte
 declare sub FromByte(b as UByte)
end type

enum StatNames
 str = 0
 agi
 vit
 wis
 wil
end enum

function StatBonus.ToByte() as UByte
 dim result as UByte
 result = amount
 for i as Integer = 0 to 4
  if stats(4 - i) then result = bitset(result, i + 3)
 next
 return result
end function

sub StatBonus.FromByte(b as UByte)
 amount = b mod 2^3
 for i as Integer = 0 to 4
  stats(4 - i) = bit(b, i + 3)
 next
end sub

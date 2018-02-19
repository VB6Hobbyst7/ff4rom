type AttributeTable
 attributes as Set
 declare function ToBytes() as List
 declare sub FromBytes(byte1 as UByte = 0, byte2 as UByte = 0, byte3 as UByte = 0)
end type

const total_attribute_tables = 123

enum Attributes
 'Elements
 fire = 0
 ice
 bolt
 dark
 holy
 air
 absorb
 immune
 'Permanent status
 poison
 blind
 mute
 pig
 mini
 frog
 petrify
 ko
 'Temporary status
 calcify1
 calcify2
 berserk
 charm
 asleep
 stun
 float
 curse
end enum

function AttributeTable.ToBytes() as List
 dim result as List
 dim byte1 as UByte
 dim byte2 as UByte
 dim byte3 as UByte
 for i as Integer = 0 to 7
  if attributes.ContainsValue(i) then byte1 = bitset(byte1, i)
  if attributes.ContainsValue(i + 8) then byte2 = bitset(byte2, i)
  if attributes.ContainsValue(i + 16) then byte3 = bitset(byte3, i)
 next
 result += byte1
 result += byte2
 result += byte3
 return result
end function

sub AttributeTable.FromBytes(byte1 as UByte = 0, byte2 as UByte = 0, byte3 as UByte = 0)
 attributes.Destroy()
 for i as Integer = 0 to 7
  if bit(byte1, i) then attributes += i
  if bit(byte2, i) then attributes += i + 8
  if bit(byte3, i) then attributes += i + 16
 next
end sub


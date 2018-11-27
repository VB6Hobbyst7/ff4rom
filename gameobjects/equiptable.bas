type EquipTable extends Set
 declare function ToBytes() as List
 declare sub FromBytes(b1 as UByte, b2 as UByte)
end type

const total_equip_tables = 31

function EquipTable.ToBytes() as List
 dim result as List
 dim b1 as UByte
 dim b2 as UByte
 for i as Integer = 0 to 7
  if ContainsValue(i) then b1 = bitset(b1, i)
  if ContainsValue(i + 8) then b2 = bitset(b2, i)
 next
 result += b1
 result += b2
 return result
end function

sub EquipTable.FromBytes(b1 as UByte, b2 as UByte)
 Destroy()
 for i as Integer = 0 to 7
  if bit(b1, i) then AddValue(i)
  if bit(b2, i) then AddValue(i + 8)
 next
end sub

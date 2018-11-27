type EquipTableList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as EquipTable ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor EquipTableList(initial_size as Integer = 0)
 dim p as EquipTable ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new EquipTable
   AddPointer(p)
  next
 end if
end constructor

operator EquipTableList.[](index as Long) as EquipTable ptr
 return cptr(EquipTable ptr, PointerAt(index + 1))
end operator

function EquipTableList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


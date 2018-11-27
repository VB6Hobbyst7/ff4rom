type SupplyList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Supply ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor SupplyList(initial_size as Integer = 0)
 dim p as Supply ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Supply
   AddPointer(p)
  next
 end if
end constructor

operator SupplyList.[](index as Long) as Supply ptr
 return cptr(Supply ptr, PointerAt(index + 1))
end operator

function SupplyList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

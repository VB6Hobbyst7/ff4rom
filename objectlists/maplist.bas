type MapList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Map ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor MapList(initial_size as Integer = 0)
 dim p as Map ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Map
   AddPointer(p)
  next
 end if
end constructor

operator MapList.[](index as Long) as Map ptr
 return cptr(Map ptr, PointerAt(index + 1))
end operator

function MapList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

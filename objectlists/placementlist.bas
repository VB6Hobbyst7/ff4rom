type PlacementList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Placement ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor PlacementList(initial_size as Integer = 0)
 dim p as Placement ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Placement
   AddPointer(p)
  next
 end if
end constructor

operator PlacementList.[](index as Long) as Placement ptr
 return cptr(Placement ptr, PointerAt(index + 1))
end operator

function PlacementList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

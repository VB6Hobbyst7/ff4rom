type PlacementSetList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as PlacementSet ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor PlacementSetList(initial_size as Integer = 0)
 dim p as PlacementSet ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new PlacementSet
   AddPointer(p)
  next
 end if
end constructor

operator PlacementSetList.[](index as Long) as PlacementSet ptr
 return cptr(PlacementSet ptr, PointerAt(index + 1))
end operator

function PlacementSetList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

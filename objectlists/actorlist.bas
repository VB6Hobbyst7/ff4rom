type ActorList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Actor ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ActorList(initial_size as Integer = 0)
 dim p as Actor ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Actor
   AddPointer(p)
  next
 end if
end constructor

operator ActorList.[](index as Long) as Actor ptr
 return cptr(Actor ptr, PointerAt(index + 1))
end operator

function ActorList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


type EventCallList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as EventCall ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor EventCallList(initial_size as Integer = 0)
 dim p as EventCall ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new EventCall
   AddPointer(p)
  next
 end if
end constructor

operator EventCallList.[](index as Long) as EventCall ptr
 return cptr(EventCall ptr, PointerAt(index + 1))
end operator

function EventCallList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

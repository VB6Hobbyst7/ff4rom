type EventList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator[](index as Long) as Event ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor EventList(initial_size as Integer = 0)
 dim p as Event ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Event
   AddPointer(p)
  next
 end if
end constructor

operator EventList.[](index as Long) as Event ptr
 return cptr(Event ptr, PointerAt(index + 1))
end operator

function EventList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

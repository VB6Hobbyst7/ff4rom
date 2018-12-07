type TriggerList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Trigger ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor TriggerList(initial_size as Integer = 0)
 dim p as Trigger ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Trigger
   AddPointer(p)
  next
 end if
end constructor

operator TriggerList.[](index as Long) as Trigger ptr
 return cptr(Trigger ptr, PointerAt(index + 1))
end operator

function TriggerList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

type CallComponentList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](initial as Long) as CallComponent ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor CallComponentList(initial_size as Integer = 0)
 dim p as CallComponent ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new CallComponent
   AddPointer(p)
  next
 end if
end constructor

operator CallComponentList.[](index as Long) as CallComponent ptr
 return cptr(CallComponent ptr, PointerAt(index + 1))
end operator

function CallComponentList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

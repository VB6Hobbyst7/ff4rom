type AIList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as AI ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor AIList(initial_size as Integer = 0)
 dim p as AI ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new AI
   AddPointer(p)
  next
 end if
end constructor

operator AIList.[](index as Long) as AI ptr
 return cptr(AI ptr, PointerAt(index + 1))
end operator

function AIList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

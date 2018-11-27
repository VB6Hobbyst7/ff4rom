type ToolList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Tool ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ToolList(initial_size as Integer = 0)
 dim p as Tool ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Tool
   AddPointer(p)
  next
 end if
end constructor

operator ToolList.[](index as Long) as Tool ptr
 return cptr(Tool ptr, PointerAt(index + 1))
end operator

function ToolList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

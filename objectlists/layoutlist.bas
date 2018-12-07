type LayoutList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Layout ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor LayoutList(initial_size as Integer = 0)
 dim p as Layout ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Layout
   AddPointer(p)
  next
 end if
end constructor

operator LayoutList.[](index as Long) as Layout ptr
 return cptr(Layout ptr, PointerAt(index + 1))
end operator

function LayoutList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

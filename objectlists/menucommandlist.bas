type MenuCommandList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as MenuCommand ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor MenuCommandList(initial_size as Integer = 0)
 dim p as MenuCommand ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new MenuCommand
   AddPointer(p)
  next
 end if
end constructor

operator MenuCommandList.[](index as Long) as MenuCommand ptr
 return cptr(MenuCommand ptr, PointerAt(index + 1))
end operator

function MenuCommandList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

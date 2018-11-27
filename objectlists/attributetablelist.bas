type AttributeTableList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as AttributeTable ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor AttributeTableList(initial_size as Integer = 0)
 dim p as AttributeTable ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new AttributeTable
   AddPointer(p)
  next
 end if
end constructor

operator AttributeTableList.[](index as Long) as AttributeTable ptr
 return cptr(AttributeTable ptr, PointerAt(index + 1))
end operator

function AttributeTableList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


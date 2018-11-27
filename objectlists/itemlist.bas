type ItemList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Item ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ItemList(initial_size as Integer = 0)
 dim p as Item ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Item
   AddPointer(p)
  next
 end if
end constructor

operator ItemList.[](index as Long) as Item ptr
 return cptr(Item ptr, PointerAt(index + 1))
end operator

function ItemList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

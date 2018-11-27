type ShopList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Shop ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ShopList(initial_size as Integer = 0)
 dim p as Shop ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Shop
   AddPointer(p)
  next
 end if
end constructor

operator ShopList.[](index as Long) as Shop ptr
 return cptr(Shop ptr, PointerAt(index + 1))
end operator

function ShopList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

type DropTableList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as DropTable ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor DropTableList(initial_size as Integer = 0)
 dim p as DropTable ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new DropTable
   AddPointer(p)
  next
 end if
end constructor

operator DropTableList.[](index as Long) as DropTable ptr
 return cptr(DropTable ptr, PointerAt(index + 1))
end operator

function DropTableList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


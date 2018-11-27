type SpeedTableList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as SpeedTable ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor SpeedTableList(initial_size as Integer = 0)
 dim p as SpeedTable ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new SpeedTable
   AddPointer(p)
  next
 end if
end constructor

operator SpeedTableList.[](index as Long) as SpeedTable ptr
 return cptr(SpeedTable ptr, PointerAt(index + 1))
end operator

function SpeedTableList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

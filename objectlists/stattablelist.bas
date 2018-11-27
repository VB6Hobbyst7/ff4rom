type StatTableList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as StatTable ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor StatTableList(initial_size as Integer = 0)
 dim p as StatTable ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new StatTable
   AddPointer(p)
  next
 end if
end constructor

operator StatTableList.[](index as Long) as StatTable ptr
 return cptr(StatTable ptr, PointerAt(index + 1))
end operator

function StatTableList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

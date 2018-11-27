type StanceList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Stance ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor StanceList(initial_size as Integer = 0)
 dim p as Stance ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Stance
   AddPointer(p)
  next
 end if
end constructor

operator StanceList.[](index as Long) as Stance ptr
 return cptr(Stance ptr, PointerAt(index))
end operator

function StanceList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

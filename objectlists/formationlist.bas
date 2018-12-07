type FormationList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Formation ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor FormationList(initial_size as Integer = 0)
 dim p as Formation ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Formation
   AddPointer(p)
  next
 end if
end constructor

operator FormationList.[](index as Long) as Formation ptr
 return cptr(Formation ptr, PointerAt(index + 1))
end operator

function FormationList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

type SpellSetList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as SpellSet ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor SpellSetList(initial_size as Integer = 0)
 dim p as SpellSet ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new SpellSet
   AddPointer(p)
  next
 end if
end constructor

operator SpellSetList.[](index as Long) as SpellSet ptr
 return cptr(SpellSet ptr, PointerAt(index + 1))
end operator

function SpellSetList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


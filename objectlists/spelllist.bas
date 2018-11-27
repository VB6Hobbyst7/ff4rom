type SpellList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Spell ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor SpellList(initial_size as Integer = 0)
 dim p as Spell ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Spell
   AddPointer(p)
  next
 end if
end constructor

operator SpellList.[](index as Long) as Spell ptr
 return cptr(Spell ptr, PointerAt(index + 1))
end operator

function SpellList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


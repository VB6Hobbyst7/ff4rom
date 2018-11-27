type ArmorList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Armor ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ArmorList(initial_size as Integer = 0)
 dim p as Armor ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Armor
   AddPointer(p)
  next
 end if
end constructor

operator ArmorList.[](index as Long) as Armor ptr
 return cptr(Armor ptr, PointerAt(index + 1))
end operator

function ArmorList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

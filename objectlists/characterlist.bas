type CharacterList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Character ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor CharacterList(initial_size as Integer = 0)
 dim p as Character ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Character
   AddPointer(p)
  next
 end if
end constructor

operator CharacterList.[](index as Long) as Character ptr
 return cptr(Character ptr, PointerAt(index + 1))
end operator

function CharacterList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


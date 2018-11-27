type MonsterList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Monster ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor MonsterList(initial_size as Integer = 0)
 dim p as Monster ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Monster
   AddPointer(p)
  next
 end if
end constructor

operator MonsterList.[](index as Long) as Monster ptr
 return cptr(Monster ptr, PointerAt(index + 1))
end operator

function MonsterList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

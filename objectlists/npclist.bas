type NPCList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as NPC ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor NPCList(initial_size as Integer = 0)
 dim p as NPC ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new NPC
   AddPointer(p)
  next
 end if
end constructor

operator NPCList.[](index as Long) as NPC ptr
 return cptr(NPC ptr, PointerAt(index + 1))
end operator

function NPCList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

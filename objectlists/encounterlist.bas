type EncounterList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Encounter ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor EncounterList(initial_size as Integer = 0)
 dim p as Encounter ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Encounter
   AddPointer(p)
  next
 end if
end constructor

operator EncounterList.[](index as Long) as Encounter ptr
 return cptr(Encounter ptr, PointerAt(index + 1))
end operator

function EncounterList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

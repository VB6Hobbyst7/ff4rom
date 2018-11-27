type ConditionSetList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as ConditionSet ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ConditionSetList(initial_size as Integer = 0)
 dim p as ConditionSet ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new ConditionSet
   AddPointer(p)
  next
 end if
end constructor

operator ConditionSetList.[](index as Long) as ConditionSet ptr
 return cptr(ConditionSet ptr, PointerAt(index + 1))
end operator

function ConditionSetList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

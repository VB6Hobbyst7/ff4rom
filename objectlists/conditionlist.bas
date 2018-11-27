type ConditionList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Condition ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ConditionList(initial_size as Integer = 0)
 dim p as Condition ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Condition
   AddPointer(p)
  next
 end if
end constructor

operator ConditionList.[](index as Long) as Condition ptr
 return cptr(Condition ptr, PointerAt(index + 1))
end operator

function ConditionList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

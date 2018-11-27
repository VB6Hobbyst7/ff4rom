type ScriptList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Script ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ScriptList(initial_size as Integer = 0)
 dim p as Script ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Script
   AddPointer(p)
  next
 end if
end constructor

operator ScriptList.[](index as Long) as Script ptr
 return cptr(Script ptr, PointerAt(index + 1))
end operator

function ScriptList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

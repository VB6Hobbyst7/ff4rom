type AutoScriptList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as AutoScriptEntry ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor AutoScriptList(initial_size as Integer = 0)
 dim p as AutoScriptEntry ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new AutoScriptEntry
   AddPointer(p)
  next
 end if
end constructor

operator AutoScriptList.[](index as Long) as AutoScriptEntry ptr
 return cptr(AutoScriptEntry ptr, PointerAt(index + 1))
end operator

function AutoScriptList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

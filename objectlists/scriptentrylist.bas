type ScriptEntryList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as ScriptEntry ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor ScriptEntryList(initial_size as Integer = 0)
 dim p as ScriptEntry ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new ScriptEntry
   AddPointer(p)
  next
 end if
end constructor

operator ScriptEntryList.[](index as Long) as ScriptEntry ptr
 return cptr(ScriptEntry ptr, PointerAt(index + 1))
end operator

function ScriptEntryList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

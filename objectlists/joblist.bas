type JobList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Job ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor JobList(initial_size as Integer = 0)
 dim p as Job ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Job
   AddPointer(p)
  next
 end if
end constructor

operator JobList.[](index as Long) as Job ptr
 return PointerAt(index + 1)
end operator

function JobList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function


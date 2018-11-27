type MessageList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Message ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor MessageList(initial_size as Integer = 0)
 dim p as Message ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Message
   AddPointer(p)
  next
 end if
end constructor

operator MessageList.[](index as Long) as Message ptr
 return cptr(Message ptr, PointerAt(index + 1))
end operator

function MessageList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function

